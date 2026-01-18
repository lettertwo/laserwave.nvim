local palette = require("laserwave.palette")

---@type laserwave.Spec
--stylua: ignore
local cmp = {
  CmpItemAbbr           = { fg = palette.HINT},
  CmpItemAbbrDeprecated = { fg = palette.IGNORE, strikethrough = true },
  CmpItemAbbrMatch      = { fg = palette.HIGHLIGHT},
  CmpItemAbbrMatchFuzzy = { fg = palette.HIGHLIGHT},
  CmpItemMenu           = { fg = palette.INACTIVE},

  CmpItemKindText          = { fg = palette.COMMENT },
  CmpItemKindKeyword       = { fg = palette.KEYWORD },
  CmpItemKindVariable      = { fg = palette.VARIABLE },
  CmpItemKindConstant      = { fg = palette.CONSTANT },
  CmpItemKindReference     = { fg = palette.CONSTANT },
  CmpItemKindValue         = { fg = palette.KEYWORD },
  CmpItemKindFunction      = { fg = palette.FUNCTION },
  CmpItemKindMethod        = { fg = palette.FUNCTION },
  CmpItemKindConstructor   = { fg = palette.FUNCTION },
  CmpItemKindCopilot       = { fg = palette.CONSTANT },
  CmpItemKindClass         = { fg = palette.TYPE },
  CmpItemKindInterface     = { fg = palette.TYPE },
  CmpItemKindStruct        = { fg = palette.TYPE },
  CmpItemKindEvent         = { fg = palette.TYPE },
  CmpItemKindEnum          = { fg = palette.TYPE },
  CmpItemKindUnit          = { fg = palette.TYPE },
  CmpItemKindModule        = { fg = palette.IGNORE },
  CmpItemKindProperty      = { fg = palette.OPERATOR },
  CmpItemKindField         = { fg = palette.OPERATOR },
  CmpItemKindTypeParameter = { fg = palette.TYPE },
  CmpItemKindEnumMember    = { fg = palette.TYPE },
  CmpItemKindOperator      = { fg = palette.OPERATOR },
  CmpItemKindSnippet       = { fg = palette.IGNORE },
}

return cmp
