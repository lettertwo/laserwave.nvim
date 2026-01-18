-- clear module cache
for k, _ in pairs(package.loaded) do
  if k:match("^laserwave") then
    package.loaded[k] = nil
  end
end

---@type laserwave
local laserwave = require("laserwave")

local config = require("laserwave.config").parse()
local compiler = require("laserwave.compiler")
local transformer = require("laserwave.transformer")

local lualine = require("laserwave.transform.lualine")
local kitty = require("laserwave.transform.kitty")
local alacritty = require("laserwave.transform.alacritty")
local wezterm = require("laserwave.transform.wezterm")
local ghostty = require("laserwave.transform.ghostty")
local neovim = require("laserwave.transform.neovim")
local textmate = require("laserwave.transform.textmate")
local delta = require("laserwave.transform.delta")
local yazi = require("laserwave.transform.yazi")

---@param flavor laserwave.FLAVOR_NAME
local function build_flavor(flavor)
  ---@type laserwave.CompiledSpecs
  local specs = compiler.compile(config, flavor)

  ---@class laserwave.TemplateInput
  ---@field name string
  ---@field flavor laserwave.FLAVOR_NAME
  ---@field background string
  ---@field palette laserwave.Palette
  ---@field author string?
  ---@field license string?
  ---@field upstream string?
  ---@field blurb string?
  ---@field date string?
  ---@field time string?
  local ctx = {
    name = specs.colorscheme,
    flavor = flavor,
    background = specs.palette.background,
    palette = specs.palette,
  }
  local colorspath = "colors/" .. ctx.name .. ".lua"

  local flavor_result = {
    neovim = transformer.run(neovim, ctx, colorspath) and transformer.inject_compiled_specs(specs, colorspath),
    lualine = transformer.run(lualine, ctx, "lua/lualine/themes/" .. ctx.name .. ".lua"),
    kitty = transformer.run(kitty, ctx, "dist/kitty/" .. ctx.name .. ".conf"),
    alacritty = transformer.run(alacritty, ctx, "dist/alacritty/" .. ctx.name .. ".yml"),
    wezterm = transformer.run(wezterm, ctx, "dist/wezterm/" .. ctx.name .. ".toml"),
    ghostty = transformer.run(ghostty, ctx, "dist/ghostty/" .. ctx.name),
    textmate = transformer.run(textmate, ctx, "dist/" .. ctx.name .. ".tmTheme"),
    delta = transformer.run(delta, ctx, "dist/delta/" .. ctx.name .. ".gitconfig"),
    yazi = {
      flavor = transformer.run(yazi, ctx, "dist/yazi/" .. ctx.name .. ".yazi/flavor.toml"),
      tmtheme = transformer.run(textmate, ctx, "dist/yazi/" .. ctx.name .. ".yazi/tmtheme.xml"),
    },
  }

  return flavor_result
end

local result = {}
for name, _ in pairs(laserwave.flavors) do
  result[name] = build_flavor(name)
end

vim.notify("Built " .. vim.inspect(result), vim.log.levels.INFO, { title = "Laserwave" })
