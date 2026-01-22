local M = {}

function M.load_shipwright()
  if not package.path:find("./vendor/shipwright.nvim/lua") then
    package.path = package.path .. "./vendor/shipwright.nvim/lua/?.lua;./vendor/shipwright.nvim/lua/?/init.lua;"
  end

  local shipwright_ok, shipwright = pcall(require, "shipwright")

  if not shipwright_ok then
    error("shipwright.nvim module not found. You may need to run `make install` to install dependencies.")
  end

  return shipwright
end

---@param transform fun(ctx: laserwave.TemplateInput, filepath: string): boolean
---@param ctx laserwave.TemplateInput
---@param filepath string
function M.run_transform(transform, ctx, filepath)
  ctx.upstream = "https://github.com/lettertwo/laserwave.nvim/" .. filepath
  local shipwright = M.load_shipwright()
  local overwrite = require("shipwright.transform.overwrite")
  local ok, err = pcall(shipwright.run, ctx, transform, { overwrite, filepath })
  if not ok then
    vim.notify(string.format("Failed to build %s\n%s", filepath, err), vim.log.levels.ERROR, { title = "Laserwave" })
  end
  return ok
end

---@param flavor laserwave.FLAVOR
function M.build_flavor(flavor)
  for k, _ in pairs(package.loaded) do
    if k:match("^laserwave.flavor") or k:match("^laserwave.palette") then
      vim.notify("Unloading " .. k, vim.log.levels.DEBUG, { title = "Laserwave" })
      package.loaded[k] = nil
    end
  end

  require("laserwave.flavor").set(flavor)
  local palette = require("laserwave.palette")

  ---@type laserwave.TemplateInput
  local ctx = {
    name = flavor ~= "original" and "laserwave-" .. flavor or "laserwave",
    flavor = flavor,
    background = palette.background,
    palette = palette,
  }

  -- stylua: ignore
  return {
    lualine   = M.run_transform(require("laserwave.transform.lualine"),   ctx, "lua/lualine/themes/" .. ctx.name .. ".lua"),
    kitty     = M.run_transform(require("laserwave.transform.kitty"),     ctx, "dist/kitty/" .. ctx.name .. ".conf"),
    alacritty = M.run_transform(require("laserwave.transform.alacritty"), ctx, "dist/alacritty/" .. ctx.name .. ".yml"),
    wezterm   = M.run_transform(require("laserwave.transform.wezterm"),   ctx, "dist/wezterm/" .. ctx.name .. ".toml"),
    ghostty   = M.run_transform(require("laserwave.transform.ghostty"),   ctx, "dist/ghostty/" .. ctx.name),
    textmate  = M.run_transform(require("laserwave.transform.textmate"),  ctx, "dist/" .. ctx.name .. ".tmTheme"),
    delta     = M.run_transform(require("laserwave.transform.delta"),     ctx, "dist/delta/" .. ctx.name .. ".gitconfig"),
    yazi      = {
      flavor  = M.run_transform(require("laserwave.transform.yazi"),      ctx, "dist/yazi/" .. ctx.name .. ".yazi/flavor.toml"),
      tmtheme = M.run_transform(require("laserwave.transform.textmate"),  ctx, "dist/yazi/" .. ctx.name .. ".yazi/tmtheme.xml"),
    },
  }
end

function M.build_all_flavors()
  local result = {}
  for name, _ in pairs(require("laserwave.flavor").flavors) do
    result[name] = M.build_flavor(name)
  end
  return result
end

-- If this module is being loaded via shipwright, build all flavors
if debug.getinfo(3).short_src:find("shipwright.lua") then
  local result = M.build_all_flavors()
  vim.notify("Built all flavors " .. vim.inspect(result), vim.log.levels.INFO, { title = "Laserwave" })
end

return M
