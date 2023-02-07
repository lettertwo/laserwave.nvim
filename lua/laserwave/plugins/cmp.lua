-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")

local palette = require("laserwave.palette")
local syntax = require("laserwave.syntax")
local ui = require("laserwave.ui")

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
    CmpItemKindKeyword       { syntax.Keyword },
    CmpItemKindVariable      { syntax.Identifier },
    CmpItemKindConstant      { syntax.Constant },
    CmpItemKindReference     { syntax.Constant },
    CmpItemKindValue         { syntax.Statement },
    CmpItemKindFunction      { syntax.Function },
    CmpItemKindMethod        { syntax.Function },
    CmpItemKindConstructor   { syntax.Function },
    CmpItemKindClass         { syntax.Type },
    CmpItemKindInterface     { syntax.Type },
    CmpItemKindStruct        { syntax.Type },
    CmpItemKindEvent         { syntax.Type },
    CmpItemKindEnum          { syntax.Type },
    CmpItemKindUnit          { syntax.Type },
    CmpItemKindModule        { syntax.PreProc },
    CmpItemKindProperty      { syntax.Operator },
    CmpItemKindField         { syntax.Operator },
    CmpItemKindTypeParameter { syntax.Type },
    CmpItemKindEnumMember    { syntax.Type },
    CmpItemKindOperator      { syntax.Operator },
    CmpItemKindSnippet       { ui.NonText },
  }
  --stylua: ignore end
end)

return cmp
