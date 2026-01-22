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
end

---@param opts ?laserwave.Options
function M.setup(opts)
  require("laserwave").setup(opts)

  require("laserwave.command").add("compile", {
    impl = function()
      M.reset()
      vim.notify("Reloaded!", vim.log.levels.DEBUG, { title = "Laserwave" })
      require("laserwave").setup()
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
