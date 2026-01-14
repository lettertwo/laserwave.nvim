-- clear module cache
for k, _ in pairs(package.loaded) do
  if k:match("^laserwave") then
    package.loaded[k] = nil
  end
end

---@type Laserwave
local laserwave = require("laserwave")

local compiler = require("laserwave.compiler")
local transformer = require("laserwave.transformer")

local lualine = require("laserwave.transform.lualine")
local kitty = require("laserwave.transform.kitty")
local alacritty = require("laserwave.transform.alacritty")
local wezterm = require("laserwave.transform.wezterm")
local neovim = require("laserwave.transform.neovim")
local textmate = require("laserwave.transform.textmate")
local delta = require("laserwave.transform.delta")
local yazi = require("laserwave.transform.yazi")

laserwave.setup()

---@param flavor LASERWAVE_FLAVOR_NAME
local function build_flavor(flavor)
  ---@type CompiledLaserwaveSpecs
  local specs = compiler.compile(laserwave._config, flavor)
  local ctx = vim.tbl_extend("force", specs.spec, { name = specs.colorscheme, flavor = flavor })
  local colorspath = "colors/" .. specs.colorscheme .. ".lua"

  local flavor_result = {
    neovim = transformer.run(neovim, ctx, colorspath) and transformer.inject_colors("spec", specs.spec, colorspath),
    lualine = transformer.run(lualine, ctx, "lua/lualine/themes/" .. specs.colorscheme .. ".lua"),
    kitty = transformer.run(kitty, ctx, "dist/kitty/" .. specs.colorscheme .. ".conf"),
    alacritty = transformer.run(alacritty, ctx, "dist/alacritty/" .. specs.colorscheme .. ".yml"),
    wezterm = transformer.run(wezterm, ctx, "dist/wezterm/" .. specs.colorscheme .. ".toml"),
    textmate = transformer.run(textmate, ctx, "dist/" .. specs.colorscheme .. ".tmTheme"),
    delta = transformer.run(delta, ctx, "dist/delta/" .. specs.colorscheme .. ".gitconfig"),
    yazi = {
      flavor = transformer.run(yazi, ctx, "dist/yazi/" .. specs.colorscheme .. ".yazi/flavor.toml"),
      tmtheme = transformer.run(textmate, ctx, "dist/yazi/" .. specs.colorscheme .. ".yazi/tmtheme.xml"),
    },
  }

  if flavor_result.neovim then
    for plugin_name, plugin_spec in pairs(specs.plugins) do
      flavor_result[plugin_name] = transformer.inject_colors(plugin_name, plugin_spec, colorspath)
    end
  end

  return flavor_result
end

local result = {}
for name, _ in pairs(laserwave.flavors) do
  result[name] = build_flavor(name)
end

vim.notify("Built " .. vim.inspect(result), vim.log.levels.INFO, { title = "Laserwave" })
