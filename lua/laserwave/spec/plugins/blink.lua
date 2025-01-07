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
local blink = lush(function()
  --stylua: ignore start
  return {
    BlinkCmpLabel           { fg = palette.HINT, bg = "NONE" },
    BlinkCmpLabelDeprecated { ui.NonText, bg = "NONE", gui = "strikethrough" },
    BlinkCmpLabelMatch      { fg = palette.HIGHLIGHT, bg = "NONE" },

    BlinkCmpMenu                { ui.Float },
    BlinkCmpMenuBorder          { ui.FloatBorder },
    BlinkCmpDocBorder           { ui.FloatBorder },
    BlinkCmpSignatureHelpBorder { ui.FloatBorder },

    BlinkCmpKindText          { fg = palette.COMMENT },
    BlinkCmpKindKeyword       { fg = syntax.Keyword.fg },
    BlinkCmpKindVariable      { fg = syntax.Identifier.fg },
    BlinkCmpKindConstant      { fg = syntax.Constant.fg },
    BlinkCmpKindReference     { fg = syntax.Constant.fg },
    BlinkCmpKindValue         { fg = syntax.Statement.fg },
    BlinkCmpKindFunction      { fg = syntax.Function.fg },
    BlinkCmpKindMethod        { fg = syntax.Function.fg },
    BlinkCmpKindConstructor   { fg = syntax.Function.fg },
    BlinkCmpKindCopilot       { fg = syntax.Constant.fg },
    BlinkCmpKindClass         { fg = syntax.Type.fg },
    BlinkCmpKindInterface     { fg = syntax.Type.fg },
    BlinkCmpKindStruct        { fg = syntax.Type.fg },
    BlinkCmpKindEvent         { fg = syntax.Type.fg },
    BlinkCmpKindEnum          { fg = syntax.Type.fg },
    BlinkCmpKindUnit          { fg = syntax.Type.fg },
    BlinkCmpKindModule        { fg = syntax.PreProc.fg },
    BlinkCmpKindProperty      { fg = syntax.Operator.fg },
    BlinkCmpKindField         { fg = syntax.Operator.fg },
    BlinkCmpKindTypeParameter { fg = syntax.Type.fg },
    BlinkCmpKindEnumMember    { fg = syntax.Type.fg },
    BlinkCmpKindOperator      { fg = syntax.Operator.fg },
    BlinkCmpKindSnippet       { fg = ui.NonText.fg },
  }
  --stylua: ignore end
end)

return blink
