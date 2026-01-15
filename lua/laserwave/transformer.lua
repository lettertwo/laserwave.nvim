if not package.path:find("./vendor/shipwright.nvim/lua") then
  package.path = package.path .. "./vendor/shipwright.nvim/lua/?.lua;./vendor/shipwright.nvim/lua/?/init.lua;"
end

local shipwright_ok, shipwright = pcall(require, "shipwright")

if not shipwright_ok then
  error("shipwright.nvim module not found. You may need to run `make install` to install dependencies.")
end

local overwrite = require("shipwright.transform.overwrite")
local patchwrite = require("shipwright.transform.patchwrite")

local M = {}

local RESERVED_KEYWORDS = {
  ["and"] = true,
  ["break"] = true,
  ["do"] = true,
  ["else"] = true,
  ["elseif"] = true,
  ["end"] = true,
  ["false"] = true,
  ["for"] = true,
  ["function"] = true,
  ["goto"] = true,
  ["if"] = true,
  ["in"] = true,
  ["local"] = true,
  ["nil"] = true,
  ["not"] = true,
  ["or"] = true,
  ["repeat"] = true,
  ["return"] = true,
  ["then"] = true,
  ["true"] = true,
  ["until"] = true,
  ["while"] = true,
}

--stylua: ignore
local ATTR_ORDER = {
  fg      = "1",
  bg      = "2",
  sp      = "3",
}

-- Normal group must appear first as other groups may implicity use its
-- values via fg = "bg"
local NORMAL_SORT_KEY = "000Normal"

---@param name string
---@return string
local function sort_key(name)
  -- we want to strip quotes in group names
  local key = string.gsub(name, "['\"]", "")
  -- and shuffle punctutation prefixed names to the bottom.
  key = string.gsub(key, "^[%p]+", "zzzz")
  return key
end

---@param value laserwave.SpecValue | string
---@return string[]
local function sorted_attr_names(value)
  if type(value) ~= "table" then
    return {}
  end
  local sorted_names = vim.tbl_keys(value)
  table.sort(sorted_names, function(a, b)
    return (ATTR_ORDER[a] or a) < (ATTR_ORDER[b] or b)
  end)
  return sorted_names
end

---@param name string
---@return string
local function safe_group_name(name)
  if
    -- Check if the name is reserved keyword
    not RESERVED_KEYWORDS[name]
    -- Check if the name matches the identifier pattern
    -- Pattern breakdown:
    -- ^      - anchors the match to the start of the string
    -- [_%a]  - matches a letter or an underscore (the required first character)
    -- [_%w]* - matches zero or more letters, digits, or underscores (word characters)
    -- $      - anchors the match to the end of the string
    and string.match(name, "^[_%a][_%w]*$") ~= nil
  then
    return name
  else
    return string.format("[%q]", name)
  end
end

---@param group { name: string, value: laserwave.SpecValue | { link: string } }
---@return string
local function to_definition(group)
  return string.format(
    "%s = {%s},", -- concat group name and attr strings into "Normal = {fg = ...}"
    safe_group_name(group.name),
    vim
      .iter(sorted_attr_names(group.value))
      :map(function(key)
        local val = group.value[key]
        if type(val) == "number" or type(val) == "boolean" then
          return string.format("%s = %s", key, tostring(val))
        else
          return string.format("%s = %q", key, tostring(val))
        end
      end)
      :join(", ")
  )
end

---@param name string
---@param value laserwave.SpecValue | string
---@return { key: string, name: string, value: laserwave.SpecValue | { link: string } }
local function to_group(name, value)
  local key = sort_key(name)

  if type(value) == "string" then
    if value == "Normal" then
      key = NORMAL_SORT_KEY .. "1" .. key
    else
      key = sort_key(value) .. "1" .. key
    end
    value = { link = value }
  elseif name == "Normal" then
    key = NORMAL_SORT_KEY
  end

  return { key = key, name = name, value = value }
end

---@param spec laserwave.Spec
local function spec_to_definition_lines(spec)
  local groups = vim.iter(spec):map(to_group):totable()
  table.sort(groups, function(a, b)
    return a.key < b.key
  end)
  return vim.iter(groups):map(to_definition):totable()
end

---@param specs laserwave.CompiledSpecs
---@param filepath string
function M.inject_compiled_specs(specs, filepath)
  local spec = spec_to_definition_lines(specs.spec)
  local plugins = vim
    .iter(specs.plugins)
    :map(function(plugin_name, plugin_spec)
      return { plugin_name, spec_to_definition_lines(plugin_spec) }
    end)
    :totable()

  table.sort(plugins, function(a, b)
    return a[1] < b[1]
  end)

  local start = "--%% begin compiled_specs %%--"
  local stop = "--%% end compiled_specs %%--"

  local ok, err = pcall(shipwright.run, { spec = spec, plugins = plugins }, function(ctx)
    local lines = {
      "  spec = {",
    }
    for _, line in ipairs(ctx.spec) do
      table.insert(lines, "    " .. line)
    end
    table.insert(lines, "  },")

    table.insert(lines, "  plugins = {")
    for _, plugin in ipairs(ctx.plugins) do
      local plugin_name, plugin_spec_lines = plugin[1], plugin[2]
      table.insert(lines, "    " .. plugin_name .. " = {")
      for _, line in ipairs(plugin_spec_lines) do
        table.insert(lines, "      " .. line)
      end
      table.insert(lines, "    },")
    end
    table.insert(lines, "  },")
    return lines
  end, { patchwrite, filepath, start, stop })

  if not ok then
    vim.notify(
      string.format("Failed to inject compiled specs into %s\n%s", filepath, err),
      vim.log.levels.ERROR,
      { title = "Laserwave" }
    )
  end
  return ok
end

---@param transform fun(ctx: laserwave.Spec, filepath: string): boolean
---@param spec laserwave.Spec
---@param filepath string
function M.run(transform, spec, filepath)
  ---@diagnostic disable-next-line: assign-type-mismatch
  spec.upstream = "https://github.com/lettertwo/laserwave.nvim/" .. filepath
  local ok, err = pcall(shipwright.run, spec, transform, { overwrite, filepath })
  if not ok then
    vim.notify(string.format("Failed to build %s\n%s", filepath, err), vim.log.levels.ERROR, { title = "Laserwave" })
  end
  return ok
end

return M
