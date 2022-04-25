---@param options Config
local function config(options)
  package.loaded["laserwave.base"] = nil
  package.loaded["laserwave.config"] = nil

  local base = require("laserwave.base")
  local defaults = require("laserwave.config")

  vim.o.background = "dark"
  vim.g.colors_name = "laserwave"

  return defaults.apply(base, options)
end

local function apply()
  require("lush")(config(), { force_clean = false })
end

return { config = config, apply = apply }
