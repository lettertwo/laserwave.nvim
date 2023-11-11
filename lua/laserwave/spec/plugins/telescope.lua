-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")

local palette = require("laserwave.spec.palette")
local ui = require("laserwave.spec.ui")

---@diagnostic disable: undefined-global
local telescope = lush(function()
  --stylua: ignore start
  return {
    -- Telescope
    TelescopeNormal       { ui.NormalFloat },
    TelescopeSelection    { ui.Visual },
    TelescopePromptNormal { ui.NormalFloat },
    TelescopePromptPrefix { ui.NormalFloat, fg = palette.HIGHLIGHT },
    TelescopePromptBorder { ui.FloatBorder },
    TelescopePromptTitle  { ui.FloatTitle },
    TelescopeBorder       { ui.FloatBorder },
    TelescopePreviewTitle { ui.FloatTitle },
    TelescopeResultsTitle { ui.FloatTitle },
  }
  --stylua: ignore end
end)

return telescope
