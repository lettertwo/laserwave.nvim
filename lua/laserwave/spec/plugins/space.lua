local palette = require("laserwave.palette")

---@type LaserwaveSpec
--stylua: ignore
local space = {
  -- ExtraWhitespace
  ExtraWhitespace = { bg = palette.ERROR },
  MiniTrailspace = "ExtraWhitespace",

  -- indent-blankline
  IblIndent                  = { fg = palette.IGNORE:darken(60) },
  IblWhitespace              = "IblIndent",
  IndentBlanklineChar        = "IblIndent",
  IblScope                   = { fg = palette.IGNORE:darken(30) },
  IndentBlanklineContextChar = "IblScope",

  -- mini.indentscope
  MiniIndentscopeSymbol = "IblScope",

  -- snacks
  SnacksIndent      = "IblIndent",
  SnacksIndentScope = "IblScope",
  SnacksIndentChunk = "IblScope",
  SnacksIndentBlank = "ExtraWhitespace",
}

return space
