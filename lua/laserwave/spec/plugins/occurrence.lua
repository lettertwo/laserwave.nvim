-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")

local ui = require("laserwave.spec.ui")

---@diagnostic disable: undefined-global
local plugins = lush(function()
  --stylua: ignore start
  return {
    OccurrenceMatch   { ui.Visual }, -- Default is Search
    OccurrenceMark    { gui = "underline" }, -- Default is IncSearch
    OccurrenceCurrent { gui = "underline,reverse" }, -- Default is CurSearch
  }
  --stylua: ignore end
end)

return plugins
