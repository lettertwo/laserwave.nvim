local M = {}

---@class LaserwaveSpecValue
---@field fg LaserwaveColor?
---@field bg LaserwaveColor?
---@field sp LaserwaveColor?
---@field bold boolean?
---@field underline boolean?
---@field undercurl boolean?
---@field underdouble boolean?
---@field underdotted boolean?
---@field underdashed boolean?
---@field strikethrough boolean?
---@field italic boolean?
---@field reverse boolean?
---@field [any] 'never'

---@alias LaserwaveSpec table<string, LaserwaveSpecValue | string>

---@class CompiledLaserwaveSpecs
---@field colorscheme string
---@field palette LaserwavePalette
---@field spec LaserwaveSpec
---@field plugins table<string, LaserwaveSpec>

---@param specs LaserwaveSpec[]
---@return LaserwaveSpec
local function merge_specs(specs)
  local result = {}
  for _, spec in ipairs(specs) do
    for group, attrs in pairs(spec) do
      result[group] = attrs
    end
  end
  return result
end

---@param config ParsedLaserwaveConfig
---@param flavor LASERWAVE_FLAVOR_NAME
---@return CompiledLaserwaveSpecs
function M.compile(config, flavor)
  local colorscheme = flavor ~= "original" and "laserwave-" .. flavor or "laserwave"

  vim.notify(
    "Compiling specs for flavor: " .. flavor .. " as " .. colorscheme,
    vim.log.levels.DEBUG,
    { title = "Laserwave" }
  )

  -- clear specs from module cache
  for k, _ in pairs(package.loaded) do
    if k:match("^laserwave.spec") or k:match("^laserwave.flavor") or k:match("^laserwave.palette") then
      vim.notify("Unloading " .. k, vim.log.levels.DEBUG, { title = "Laserwave" })
      package.loaded[k] = nil
    end
  end

  require("laserwave.flavor").set(flavor)

  local result = {
    colorscheme = colorscheme,
    palette = require("laserwave.palette"),
    spec = merge_specs({
      require("laserwave.spec.syntax"),
      require("laserwave.spec.ui"),
      require("laserwave.spec.terminal"),
    }),
    plugins = {
      treesitter = require("laserwave.spec.treesitter"),
      semantic_highlights = require("laserwave.spec.semantic_highlights"),
    },
  }

  for plugin in pairs(config.plugins) do
    local plugin_ok, plugin_spec = pcall(require, "laserwave.spec.plugins." .. plugin)
    if plugin_ok then
      result.plugins[plugin] = plugin_spec
    else
      vim.notify("Failed to load plugin: " .. plugin, vim.log.levels.ERROR, { title = "Laserwave" })
    end
  end

  return result
end

return M
