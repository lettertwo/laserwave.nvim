local palette = require("laserwave.palette")

---@type laserwave.Spec
--stylua: ignore
local space = {
  -- ExtraWhitespace
  ExtraWhitespace = { bg = palette.ERROR },
  MiniTrailspace = "ExtraWhitespace",

  -- indent-blankline
  IblIndent                  = { fg = palette.INDENT },
  IblWhitespace              = "IblIndent",
  IndentBlanklineChar        = "IblIndent",
  IblScope                   = { fg = palette.SCOPE },
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
