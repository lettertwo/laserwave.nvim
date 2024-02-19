-- clear module cache
for k, _ in pairs(package.loaded) do
  if k:match("^laserwave") or k:match("^lush") or k:match("^shipwright") then
    package.loaded[k] = nil
  end
end

local shipwright = require("shipwright")
local overwrite = require("shipwright.transform.overwrite")
local patchwrite = require("shipwright.transform.patchwrite")
local lushwright = require("shipwright.transform.lush")

---@type Laserwave
local laserwave = require("laserwave")

local compiler = require("laserwave.compiler")

local lualine = require("laserwave.transform.lualine")
local kitty = require("laserwave.transform.kitty")
local alacritty = require("laserwave.transform.alacritty")
local wezterm = require("laserwave.transform.wezterm")
local colorscheme = require("laserwave.transform.colorscheme")
local textmate = require("laserwave.transform.textmate")

laserwave.setup()

---@param spec_name string
---@param spec ParsedLushSpec
---@param filepath string
local function inject_colors(spec_name, spec, filepath)
  local start = "--%% begin " .. spec_name .. " %%--"
  local stop = "--%% end " .. spec_name .. " %%--"

  local build_ok, err = pcall(shipwright.run, spec, lushwright.to_lua, { patchwrite, filepath, start, stop })

  if not build_ok then
    vim.notify(
      "Failed to inject " .. spec_name .. " into " .. filepath .. " between " .. start .. " and " .. stop .. "\n" .. err,
      vim.log.levels.ERROR,
      { title = "Laserwave" }
    )
  end

  return build_ok
end

---@param transform fun(ctx: ParsedLushSpec, filepath: string): boolean
---@param spec ParsedLushSpec
---@param filepath string
local function run_transform(transform, spec, filepath)
  ---@diagnostic disable-next-line: assign-type-mismatch
  spec.upstream = "https://github.com/lettertwo/laserwave.nvim/" .. filepath
  local ok, err = pcall(shipwright.run, spec, transform, { overwrite, filepath })
  if not ok then
    vim.notify("Failed to build " .. filepath .. "\n" .. err, vim.log.levels.ERROR, { title = "Laserwave" })
  end
  return ok
end

---@param flavor ?LASERWAVE_FLAVOR_NAME
local function build_flavor(flavor)
  ---@type CompiledLaserwaveSpecs
  local specs = compiler.compile(laserwave._config, flavor)
  local ctx = vim.tbl_extend("force", specs.spec, { name = specs.colorscheme, flavor = flavor })
  local colorspath = "colors/" .. specs.colorscheme .. ".lua"

  local flavor_result = {
    lualine = run_transform(lualine, ctx, "lua/lualine/themes/" .. specs.colorscheme .. ".lua"),
    kitty = run_transform(kitty, ctx, "dist/kitty/" .. specs.colorscheme .. ".conf"),
    alacritty = run_transform(alacritty, ctx, "dist/alacritty/" .. specs.colorscheme .. ".yml"),
    wezterm = run_transform(wezterm, ctx, "dist/wezterm/" .. specs.colorscheme .. ".toml"),
    spec = run_transform(colorscheme, ctx, colorspath) and inject_colors("spec", specs.spec, colorspath),
    textmate = run_transform(textmate, ctx, "dist/" .. specs.colorscheme .. ".tmTheme"),
  }

  if flavor_result.spec then
    for plugin_name, plugin_spec in pairs(specs.plugins) do
      flavor_result[plugin_name] = inject_colors(plugin_name, plugin_spec, colorspath)
    end
  end

  return flavor_result
end

local result = {}
for name, _ in pairs(laserwave.flavors) do
  result[name] = build_flavor(name)
end

vim.notify("Built " .. vim.inspect(result), vim.log.levels.INFO, { title = "Laserwave" })
