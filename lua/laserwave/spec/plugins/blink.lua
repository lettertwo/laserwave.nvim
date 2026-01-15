local palette = require("laserwave.palette")
local syntax = require("laserwave.spec.syntax")
local ui = require("laserwave.spec.ui")

---@type laserwave.Spec
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
  BlinkCmpKindKeyword       = { fg = syntax.Keyword.fg },
  BlinkCmpKindVariable      = { fg = syntax.Identifier.fg },
  BlinkCmpKindConstant      = { fg = syntax.Constant.fg },
  BlinkCmpKindReference     = { fg = syntax.Constant.fg },
  BlinkCmpKindValue         = { fg = syntax.Statement.fg },
  BlinkCmpKindFunction      = { fg = syntax.Function.fg },
  BlinkCmpKindMethod        = { fg = syntax.Function.fg },
  BlinkCmpKindConstructor   = { fg = syntax.Function.fg },
  BlinkCmpKindCopilot       = { fg = syntax.Constant.fg },
  BlinkCmpKindClass         = { fg = syntax.Type.fg },
  BlinkCmpKindInterface     = { fg = syntax.Type.fg },
  BlinkCmpKindStruct        = { fg = syntax.Type.fg },
  BlinkCmpKindEvent         = { fg = syntax.Type.fg },
  BlinkCmpKindEnum          = { fg = syntax.Type.fg },
  BlinkCmpKindUnit          = { fg = syntax.Type.fg },
  BlinkCmpKindModule        = { fg = syntax.PreProc.fg },
  BlinkCmpKindProperty      = { fg = syntax.Operator.fg },
  BlinkCmpKindField         = { fg = syntax.Operator.fg },
  BlinkCmpKindTypeParameter = { fg = syntax.Type.fg },
  BlinkCmpKindEnumMember    = { fg = syntax.Type.fg },
  BlinkCmpKindOperator      = { fg = syntax.Operator.fg },
  BlinkCmpKindSnippet       = { fg = ui.NonText.fg },
}

return blink
