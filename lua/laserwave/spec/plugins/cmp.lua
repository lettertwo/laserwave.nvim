local palette = require("laserwave.spec.palette")
local syntax = require("laserwave.spec.syntax")
local ui = require("laserwave.spec.ui")

---@type LaserwaveSpec
--stylua: ignore
local cmp = {
  CmpItemAbbr           = { fg = palette.HINT, bg = "NONE" },
  CmpItemAbbrDeprecated = { fg = palette.IGNORE, bg = "NONE", strikethrough = true },
  CmpItemAbbrMatch      = { fg = palette.HIGHLIGHT, bg = "NONE" },
  CmpItemAbbrMatchFuzzy = { fg = palette.HIGHLIGHT, bg = "NONE" },
  CmpItemMenu           = { fg = palette.INACTIVE, bg = "NONE" },

  CmpItemKindText          = { fg = palette.COMMENT },
  CmpItemKindKeyword       = { fg = syntax.Keyword.fg },
  CmpItemKindVariable      = { fg = syntax.Identifier.fg },
  CmpItemKindConstant      = { fg = syntax.Constant.fg },
  CmpItemKindReference     = { fg = syntax.Constant.fg },
  CmpItemKindValue         = { fg = syntax.Statement.fg },
  CmpItemKindFunction      = { fg = syntax.Function.fg },
  CmpItemKindMethod        = { fg = syntax.Function.fg },
  CmpItemKindConstructor   = { fg = syntax.Function.fg },
  CmpItemKindCopilot       = { fg = syntax.Constant.fg },
  CmpItemKindClass         = { fg = syntax.Type.fg },
  CmpItemKindInterface     = { fg = syntax.Type.fg },
  CmpItemKindStruct        = { fg = syntax.Type.fg },
  CmpItemKindEvent         = { fg = syntax.Type.fg },
  CmpItemKindEnum          = { fg = syntax.Type.fg },
  CmpItemKindUnit          = { fg = syntax.Type.fg },
  CmpItemKindModule        = { fg = syntax.PreProc.fg },
  CmpItemKindProperty      = { fg = syntax.Operator.fg },
  CmpItemKindField         = { fg = syntax.Operator.fg },
  CmpItemKindTypeParameter = { fg = syntax.Type.fg },
  CmpItemKindEnumMember    = { fg = syntax.Type.fg },
  CmpItemKindOperator      = { fg = syntax.Operator.fg },
  CmpItemKindSnippet       = { fg = ui.NonText.fg },
}

return cmp
