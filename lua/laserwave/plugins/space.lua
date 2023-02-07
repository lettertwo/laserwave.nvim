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
    -- ExtraWhitespace
    ExtraWhitespace      { bg = palette.ERROR },

    -- indent-blankline
    IndentBlanklineChar  { fg = palette.IGNORE.darken(50) },
    IndentBlanklineContextChar  { fg = palette.HIGHLIGHT },

    -- mini.indentscope
    MiniIndentscopeSymbol { fg = palette.HIGHLIGHT },
  }
  --stylua: ignore end
end)

return plugins
