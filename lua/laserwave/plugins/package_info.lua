-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")

local palette = require("laserwave.palette")
local ui = require("laserwave.ui")

---@diagnostic disable: undefined-global
local plugins = lush(function()
  --stylua: ignore start
  return {
    PackageInfoOutdatedVersion      { fg = palette.ERROR },
    PackageInfoUpToDateVersion      { fg = paleette.SUCCESS },
  }
  --stylua: ignore end
end)

return plugins
