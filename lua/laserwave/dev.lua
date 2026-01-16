---@module 'laserwave.dev'
local M = {}

function M.reset()
  for name, _ in pairs(package.loaded) do
    if name:match("^laserwave.") then
      vim.notify("Unloading " .. name, vim.log.levels.DEBUG, { title = "Laserwave" })
      package.loaded[name] = nil
    end
  end

  local mt = getmetatable(M)
  if mt then
    mt.__index = require("laserwave")
  end

  vim.cmd("highlight clear")
end

---@param cfg laserwave.Config
---@param flavor laserwave.FLAVOR_NAME
function M.apply(cfg, flavor)
  local transformer = require("laserwave.transformer")
  local neovim = require("laserwave.transform.neovim")
  local specs = require("laserwave.compiler").compile(cfg, flavor)
  local ctx = vim.tbl_extend("force", specs.spec, { name = specs.colorscheme, flavor = flavor })
  local colorspath = "colors/" .. specs.colorscheme .. ".lua"

  local flavor_result = {
    neovim = transformer.run(neovim, ctx, colorspath) and transformer.inject_compiled_specs(specs, colorspath),
  }

  vim.notify("Built " .. vim.inspect(flavor_result), vim.log.levels.INFO, { title = "Laserwave" })

  vim.cmd.colorscheme(specs.colorscheme)
end

---@param opts ?laserwave.Options
function M.setup(opts)
  require("laserwave").setup(opts)

  require("laserwave.command").add("compile", {
    impl = function()
      M.reset()
      M.apply(M.get_config(), M.get_flavor())
      vim.notify("Reloaded!", vim.log.levels.DEBUG, { title = "Laserwave" })
    end,
  })

  vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("laserwave", { clear = true }),
    pattern = "*/laserwave/*",
    callback = function()
      vim.schedule(function()
        vim.cmd("Laserwave compile")
      end)
    end,
  })
end

setmetatable(M, { __index = require("laserwave") })

return M
