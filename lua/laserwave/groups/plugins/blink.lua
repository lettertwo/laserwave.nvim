local palette = require("laserwave.palette")

---@type laserwave.Groups
--stylua: ignore
local blink = {
  BlinkCmpLabel           = { fg = palette.HINT },
  BlinkCmpLabelDeprecated = { fg = palette.IGNORE, strikethrough = true },
  BlinkCmpLabelMatch      = { fg = palette.HIGHLIGHT },

  BlinkCmpMenu                = "Float",
  BlinkCmpMenuBorder          = "FloatBorder",
  BlinkCmpDocBorder           = "FloatBorder",
  BlinkCmpSignatureHelpBorder = "FloatBorder",

  BlinkCmpKindText          = { fg = palette.COMMENT },
  BlinkCmpKindKeyword       = { fg = palette.KEYWORD },
  BlinkCmpKindVariable      = { fg = palette.VARIABLE },
  BlinkCmpKindConstant      = { fg = palette.CONSTANT },
  BlinkCmpKindReference     = { fg = palette.CONSTANT },
  BlinkCmpKindValue         = { fg = palette.KEYWORD },
  BlinkCmpKindFunction      = { fg = palette.FUNCTION },
  BlinkCmpKindMethod        = { fg = palette.FUNCTION },
  BlinkCmpKindConstructor   = { fg = palette.FUNCTION },
  BlinkCmpKindCopilot       = { fg = palette.CONSTANT },
  BlinkCmpKindClass         = { fg = palette.TYPE },
  BlinkCmpKindInterface     = { fg = palette.TYPE },
  BlinkCmpKindStruct        = { fg = palette.TYPE },
  BlinkCmpKindEvent         = { fg = palette.TYPE },
  BlinkCmpKindEnum          = { fg = palette.TYPE },
  BlinkCmpKindUnit          = { fg = palette.TYPE },
  BlinkCmpKindModule        = { fg = palette.IGNORE },
  BlinkCmpKindProperty      = { fg = palette.OPERATOR },
  BlinkCmpKindField         = { fg = palette.OPERATOR },
  BlinkCmpKindTypeParameter = { fg = palette.TYPE },
  BlinkCmpKindEnumMember    = { fg = palette.TYPE },
  BlinkCmpKindOperator      = { fg = palette.OPERATOR },
  BlinkCmpKindSnippet       = { fg = palette.IGNORE },
}

return blink
