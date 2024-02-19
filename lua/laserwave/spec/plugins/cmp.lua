-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")

local palette = require("laserwave.spec.palette")
local syntax = require("laserwave.spec.syntax")
local ui = require("laserwave.spec.ui")

---@diagnostic disable: undefined-global
local cmp = lush(function()
  --stylua: ignore start
  return {
    CmpItemAbbr              { fg = palette.HINT, bg = "NONE" },
    CmpItemAbbrDeprecated    { ui.NonText, bg = "NONE", gui = "strikethrough" },
    CmpItemAbbrMatch         { fg = palette.HIGHLIGHT, bg = "NONE" },
    CmpItemAbbrMatchFuzzy    { fg = palette.HIGHLIGHT, bg = "NONE" },
    CmpItemMenu              { fg = palette.INACTIVE, bg = "NONE" },

    CmpItemKindText          { fg = palette.COMMENT },
    CmpItemKindKeyword       { fg = syntax.Keyword.fg },
    CmpItemKindVariable      { fg = syntax.Identifier.fg },
    CmpItemKindConstant      { fg = syntax.Constant.fg },
    CmpItemKindReference     { fg = syntax.Constant.fg },
    CmpItemKindValue         { fg = syntax.Statement.fg },
    CmpItemKindFunction      { fg = syntax.Function.fg },
    CmpItemKindMethod        { fg = syntax.Function.fg },
    CmpItemKindConstructor   { fg = syntax.Function.fg },
    CmpItemKindCopilot       { fg = syntax.Constant.fg },
    CmpItemKindClass         { fg = syntax.Type.fg },
    CmpItemKindInterface     { fg = syntax.Type.fg },
    CmpItemKindStruct        { fg = syntax.Type.fg },
    CmpItemKindEvent         { fg = syntax.Type.fg },
    CmpItemKindEnum          { fg = syntax.Type.fg },
    CmpItemKindUnit          { fg = syntax.Type.fg },
    CmpItemKindModule        { fg = syntax.PreProc.fg },
    CmpItemKindProperty      { fg = syntax.Operator.fg },
    CmpItemKindField         { fg = syntax.Operator.fg },
    CmpItemKindTypeParameter { fg = syntax.Type.fg },
    CmpItemKindEnumMember    { fg = syntax.Type.fg },
    CmpItemKindOperator      { fg = syntax.Operator.fg },
    CmpItemKindSnippet       { fg = ui.NonText.fg },
  }
  --stylua: ignore end
end)

return cmp
