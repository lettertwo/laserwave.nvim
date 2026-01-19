local M = {}

---@param flavor laserwave.FLAVOR_NAME
---@param dist? boolean
function M.build_flavor(flavor, dist)
  for k, _ in pairs(package.loaded) do
    if k:match("^laserwave.spec") or k:match("^laserwave.flavor") or k:match("^laserwave.palette") then
      vim.notify("Unloading " .. k, vim.log.levels.DEBUG, { title = "Laserwave" })
      package.loaded[k] = nil
    end
  end

  require("laserwave.flavor").set(flavor)
  local palette = require("laserwave.palette")
  local specs = require("laserwave.spec")
  local transformer = require("laserwave.transformer")

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
    name = flavor ~= "original" and "laserwave-" .. flavor or "laserwave",
    flavor = flavor,
    background = palette.background,
    palette = palette,
  }

  local colorspath = "colors/" .. ctx.name .. ".lua"

  local neovim = require("laserwave.transform.neovim")
  local flavor_result = {
    neovim = transformer.run(neovim, ctx, colorspath) and transformer.inject_compiled_specs(specs, colorspath),
  }

  if dist then
    local lualine = require("laserwave.transform.lualine")
    local kitty = require("laserwave.transform.kitty")
    local alacritty = require("laserwave.transform.alacritty")
    local wezterm = require("laserwave.transform.wezterm")
    local ghostty = require("laserwave.transform.ghostty")
    local textmate = require("laserwave.transform.textmate")
    local delta = require("laserwave.transform.delta")
    local yazi = require("laserwave.transform.yazi")
    flavor_result.lualine = transformer.run(lualine, ctx, "lua/lualine/themes/" .. ctx.name .. ".lua")
    flavor_result.kitty = transformer.run(kitty, ctx, "dist/kitty/" .. ctx.name .. ".conf")
    flavor_result.alacritty = transformer.run(alacritty, ctx, "dist/alacritty/" .. ctx.name .. ".yml")
    flavor_result.wezterm = transformer.run(wezterm, ctx, "dist/wezterm/" .. ctx.name .. ".toml")
    flavor_result.ghostty = transformer.run(ghostty, ctx, "dist/ghostty/" .. ctx.name)
    flavor_result.textmate = transformer.run(textmate, ctx, "dist/" .. ctx.name .. ".tmTheme")
    flavor_result.delta = transformer.run(delta, ctx, "dist/delta/" .. ctx.name .. ".gitconfig")
    flavor_result.yazi = {
      flavor = transformer.run(yazi, ctx, "dist/yazi/" .. ctx.name .. ".yazi/flavor.toml"),
      tmtheme = transformer.run(textmate, ctx, "dist/yazi/" .. ctx.name .. ".yazi/tmtheme.xml"),
    }
  end

  return flavor_result
end

---@param dist? boolean
function M.build_all_flavors(dist)
  local result = {}
  for name, _ in pairs(require("laserwave").flavors) do
    result[name] = M.build_flavor(name, dist)
  end
  return result
end

-- If this module is being loaded via shipwright, build all flavors
if debug.getinfo(3).short_src:find("shipwright.lua") then
  local result = M.build_all_flavors(true)
  vim.notify("Built all flavors " .. vim.inspect(result), vim.log.levels.INFO, { title = "Laserwave" })
end

return M
