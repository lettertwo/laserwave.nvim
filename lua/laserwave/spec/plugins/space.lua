-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")

local palette = require("laserwave.spec.palette")

---@diagnostic disable: undefined-global
local plugins = lush(function()
  --stylua: ignore start
  return {
    -- ExtraWhitespace
    ExtraWhitespace      { bg = palette.ERROR },
    MiniTrailspace       { ExtraWhitespace },

    -- indent-blankline
    IblIndent { fg = palette.IGNORE.darken(30) },
    IblWhitespace { IblIndent },
    IndentBlanklineChar  { IblIndent },
    IblScope { fg = palette.HIGHLIGHT },
    IndentBlanklineContextChar  { IblScope },

    -- mini.indentscope
    MiniIndentscopeSymbol { IblScope },
  }
  --stylua: ignore end
end)

return plugins
