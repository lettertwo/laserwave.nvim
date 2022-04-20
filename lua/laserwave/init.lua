local lush = require("lush")
local base = require("laserwave.base")
local defaults = require("laserwave.config")

---@param options Config
local function setup(options)
  vim.o.background = "dark"
  vim.g.colors_name = "laserwave"

  -- if options then
  --   if options.style == "light" then
  --     vim.o.background = "light"
  --   end
  -- end
  return defaults.apply(base, options)
end

return { setup = setup }
