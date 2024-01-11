-- GENERATED ON 2024-01-10 AT 19:18:46
-- name:     laserwave
-- author:   Eric Eldredge <lettertwo@gmail.com>
-- license:  MIT
-- upstream: https://github.com/lettertwo/laserwave.nvim/colors/laserwave.lua
-- blurb:    Based on LaserWave for VSCode by Jared Jones
local function apply_terminal_colors()
  vim.g.terminal_color_0 = "#91889B"
  vim.g.terminal_color_1 = "#EB65B9"
  vim.g.terminal_color_2 = "#75DFC4"
  vim.g.terminal_color_3 = "#FFE25F"
  vim.g.terminal_color_4 = "#41B5C5"
  vim.g.terminal_color_5 = "#B381C5"
  vim.g.terminal_color_6 = "#B3DBE6"
  vim.g.terminal_color_7 = "#FFFFFF"
  vim.g.terminal_color_8 = "#B381C5"
  vim.g.terminal_color_9 = "#FF3D7A"
  vim.g.terminal_color_10 = "#75DFC4"
  vim.g.terminal_color_11 = "#FFB961"
  vim.g.terminal_color_12 = "#41B5C5"
  vim.g.terminal_color_13 = "#EB65B9"
  vim.g.terminal_color_14 = "#B3DBE6"
  vim.g.terminal_color_15 = "#FFFFFF"
end
local function apply_colors(groups, extend)
  for group, attrs in pairs(groups) do
    if extend then
      local base = vim.api.nvim_get_hl(0, { name = group }) or {}
      vim.api.nvim_set_hl(0, group, vim.tbl_extend("force", base, attrs))
    else
      vim.api.nvim_set_hl(0, group, attrs)
    end
  end
end
-- Load config and apply colors
vim.cmd("highlight clear")
vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "laserwave"
require("laserwave").set_flavor("original")
local cfg = require("laserwave").get_config()
if cfg.dev then
require("laserwave.dev").setup(cfg)
else
apply_colors({
--%% begin spec %%--
Normal = {fg = "#FFFFFF", bg = "#27212E"},
NormalNC = {link = "Normal"},
Attribute = {fg = "#EB65B9"},
Boolean = {fg = "#FFE25F"},
Character = {fg = "#75DFC4"},
Comment = {fg = "#91889B"},
Conceal = {fg = "#FFFFFF", bg = "#27212E"},
EndOfBuffer = {link = "Conceal"},
SpecialKey = {link = "Conceal"},
Constant = {fg = "#FFE25F"},
Cursor = {fg = "#FFFFFF", bg = "#4F354C", reverse = true},
CursorIM = {link = "Cursor"},
lCursor = {link = "Cursor"},
CursorLine = {bg = "#342B3C"},
ColorColumn = {link = "CursorLine"},
CursorColumn = {link = "CursorLine"},
CursorLineFold = {fg = "#B381C5", bg = "#342B3C"},
CursorLineNr = {fg = "#D1C5D6", bg = "#342B3C"},
CursorLineSign = {fg = "#B381C5", bg = "#342B3C"},
Define = {fg = "#EB65B9"},
Delimiter = {fg = "#7C6A96"},
DiffAdd = {bg = "#39434D"},
DiffChange = {bg = "#39434D"},
DiffDelete = {bg = "#4F354C"},
DiffText = {bg = "#554C47"},
Directory = {fg = "#41B5C5"},
Error = {fg = "#FF3D7A"},
ErrorMsg = {fg = "#FF3D7A"},
Float = {fg = "#B381C5"},
FloatBorder = {fg = "#EB65B9", bg = "#251F2C"},
FloatTitle = {fg = "#EB65B9", bg = "#251F2C"},
FoldColumn = {fg = "#7C6A96", bg = "#27212E"},
Folded = {fg = "#7C6A96", bg = "#3C3347"},
Function = {fg = "#EB65B9"},
Identifier = {fg = "#FFFFFF"},
Ignore = {fg = "#7C6A96"},
IncSearch = {reverse = true},
Include = {fg = "#41B5C5", italic = true},
Keyword = {fg = "#41B5C5", italic = true},
LineNr = {fg = "#7C6A96"},
Macro = {fg = "#EB65B9"},
MatchParen = {fg = "#EB65B9", bold = true},
ModeCommand = {fg = "#FFE25F"},
ModeInsert = {fg = "#75DFC4"},
ModeMsg = {fg = "#7C6A96", bold = true},
ModeNormal = {fg = "#41B5C5"},
ModeReplace = {fg = "#EB65B9"},
ModeVisual = {fg = "#B381C5"},
MoreMsg = {fg = "#41B5C5"},
NonText = {fg = "#7C6A96"},
MsgArea = {link = "NonText"},
PreProc = {link = "NonText"},
NormalFloat = {fg = "#FFFFFF", bg = "#251F2C"},
Pmenu = {link = "NormalFloat"},
PmenuSbar = {link = "NormalFloat"},
Number = {fg = "#B381C5"},
Operator = {fg = "#75DFC4"},
PmenuThumb = {bg = "#7C6A96"},
PreCondit = {fg = "#41B5C5"},
Punctuation = {fg = "#7C6A96"},
Question = {fg = "#41B5C5"},
QuickFixLine = {bg = "#473851", bold = true},
Search = {fg = "#27212E", bg = "#B381C5"},
SignColumn = {fg = "#7C6A96", bg = "#27212E"},
Special = {fg = "#75DFC4"},
SpellBad = {sp = "#FF3D7A", undercurl = true},
SpellCap = {sp = "#FFB961", undercurl = true},
SpellLocal = {sp = "#41B5C5", undercurl = true},
SpellRare = {sp = "#91889B", undercurl = true},
Statement = {fg = "#41B5C5"},
StatusLine = {fg = "#FFFFFF", bg = "#251F2C"},
StatusLineNC = {fg = "#7C6A96", bg = "#251F2C"},
String = {fg = "#B3DBE6"},
Substitute = {reverse = true},
TabLine = {fg = "#FFFFFF", bg = "#251F2C"},
TabLineFill = {fg = "#FFFFFF", bg = "#251F2C"},
TabLineSel = {fg = "#27212E", bg = "#EB65B9"},
Tag = {fg = "#75DFC4"},
TerminalBlack = {fg = "#91889B"},
TerminalBlue = {fg = "#41B5C5"},
TerminalBrightBlack = {fg = "#B381C5"},
TerminalBrightBlue = {fg = "#41B5C5"},
TerminalBrightCyan = {fg = "#B3DBE6"},
TerminalBrightGreen = {fg = "#75DFC4"},
TerminalBrightMagenta = {fg = "#EB65B9"},
TerminalBrightRed = {fg = "#FF3D7A"},
TerminalBrightWhite = {fg = "#FFFFFF"},
TerminalBrightYellow = {fg = "#FFB961"},
TerminalCyan = {fg = "#B3DBE6"},
TerminalGreen = {fg = "#75DFC4"},
TerminalMagenta = {fg = "#B381C5"},
TerminalRed = {fg = "#EB65B9"},
TerminalWhite = {fg = "#FFFFFF"},
TerminalYellow = {fg = "#FFE25F"},
Title = {fg = "#41B5C5", bold = true},
Todo = {fg = "#FFE25F"},
Type = {fg = "#B381C5"},
Underlined = {underline = true},
VertSplit = {fg = "#EB65B9"},
VirtualText = {fg = "#7C6A96", bg = "#302938"},
Visual = {bg = "#473851"},
PmenuSel = {link = "Visual"},
VisualNOS = {link = "Visual"},
WildMenu = {link = "Visual"},
WarningMsg = {fg = "#FFB961"},
Whitespace = {fg = "#7C6A96"},
WinBar = {fg = "#FFFFFF", bg = "#251F2C"},
WinBarNC = {fg = "#7C6A96", bg = "#251F2C"},
Winseparator = {fg = "#EB65B9"},
healthError = {fg = "#FF3D7A"},
healthSuccess = {fg = "#75DFC4"},
healthWarning = {fg = "#FFB961"},
--%% end spec %%--
})
if cfg.options.transparent then
  apply_colors({ Normal = { bg = nil } }, true)
end
apply_colors({
  Comment = { italic = cfg.options.italic_comments },
  Function = { italic = cfg.options.italic_functions },
  Statement = { italic = cfg.options.italic_keywords },
  Identifier = { italic = cfg.options.italic_variables },
}, true)
if cfg.treesitter then apply_colors({
--%% begin treesitter %%--
["@tag.attribute"] = {link = "Attribute"},
["@constant.builtin"] = {link = "Constant"},
["@constant.macro"] = {link = "Constant"},
["@keyword.export"] = {link = "Constant"},
["@property.id"] = {link = "Constant"},
["@type.builtin"] = {link = "Constant"},
["@type.tag"] = {link = "Constant"},
["@variable.builtin"] = {link = "Constant"},
["@punctuation.delimiter"] = {link = "Delimiter"},
["@tag.delimiter"] = {link = "Delimiter"},
["@constructor"] = {link = "Function"},
["@property.class"] = {link = "Function"},
["@punctuation"] = {link = "Punctuation"},
TreesitterContext = {bg = "#3E3248"},
TreesitterContextLineNumber = {fg = "#BD9ECA"},
["@property"] = {fg = "#41B5C5"},
["@string.escape"] = {fg = "#B381C5"},
["@string.regex"] = {fg = "#41B5C5"},
["@text.diff.add"] = {fg = "#41B5C5"},
["@text.diff.change"] = {fg = "#FFE25F"},
["@text.diff.delete"] = {fg = "#EB65B9"},
--%% end treesitter %%--
}) end
if cfg.semantic_highlights then apply_colors({
--%% begin semantic_highlights %%--
["@lsp.typemod.variable.defaultLibrary"] = {link = "Constant"},
["@lsp.typemod.variable.static"] = {link = "Constant"},
["@lsp.type.decorator"] = {link = "Define"},
["@lsp.typemod.variable.callable"] = {link = "Function"},
["@lsp.typemod.variable.injected"] = {link = "Identifier"},
["@lsp.type.variable"] = {},
--%% end semantic_highlights %%--
}) end
if cfg.plugins.alpha then apply_colors({
--%% begin alpha %%--
StartLogo1 = {fg = "#41B5C5"},
StartLogo10 = {fg = "#864E7A"},
StartLogo11 = {fg = "#804570"},
StartLogo12 = {fg = "#753F58"},
StartLogo13 = {fg = "#664055"},
StartLogo14 = {fg = "#593F52"},
StartLogo15 = {fg = "#4E3C50"},
StartLogo16 = {fg = "#45394D"},
StartLogo17 = {fg = "#3C364B"},
StartLogo18 = {fg = "#353248"},
StartLogo19 = {fg = "#2E2C40"},
StartLogo2 = {fg = "#59A6B8"},
StartLogo20 = {fg = "#2B2839"},
StartLogo3 = {fg = "#689DB2"},
StartLogo4 = {fg = "#6D90A8"},
StartLogo5 = {fg = "#7187AB"},
StartLogo6 = {fg = "#7A77A7"},
StartLogo7 = {fg = "#8768A1"},
StartLogo8 = {fg = "#8C6093"},
StartLogo9 = {fg = "#875582"},
--%% end alpha %%--
}) end
if cfg.plugins.cmp then apply_colors({
--%% begin cmp %%--
CmpItemAbbr = {fg = "#91889B", bg = "NONE"},
CmpItemAbbrDeprecated = {fg = "#7C6A96", bg = "NONE", strikethrough = true},
CmpItemAbbrMatch = {fg = "#EB65B9", bg = "NONE"},
CmpItemAbbrMatchFuzzy = {fg = "#EB65B9", bg = "NONE"},
CmpItemKindText = {fg = "#91889B"},
CmpItemMenu = {fg = "#7C6A96", bg = "NONE"},
CmpItemKindConstant = {link = "Constant"},
CmpItemKindReference = {link = "Constant"},
CmpItemKindConstructor = {link = "Function"},
CmpItemKindFunction = {link = "Function"},
CmpItemKindMethod = {link = "Function"},
CmpItemKindVariable = {link = "Identifier"},
CmpItemKindKeyword = {link = "Keyword"},
CmpItemKindSnippet = {link = "NonText"},
CmpItemKindField = {link = "Operator"},
CmpItemKindOperator = {link = "Operator"},
CmpItemKindProperty = {link = "Operator"},
CmpItemKindModule = {link = "PreProc"},
CmpItemKindValue = {link = "Statement"},
CmpItemKindClass = {link = "Type"},
CmpItemKindEnum = {link = "Type"},
CmpItemKindEnumMember = {link = "Type"},
CmpItemKindEvent = {link = "Type"},
CmpItemKindInterface = {link = "Type"},
CmpItemKindStruct = {link = "Type"},
CmpItemKindTypeParameter = {link = "Type"},
CmpItemKindUnit = {link = "Type"},
--%% end cmp %%--
}) end
if cfg.plugins.git then apply_colors({
--%% begin git %%--
GitGutterAdd = {fg = "#41B5C5"},
GitGutterChange = {fg = "#FFE25F"},
GitGutterDelete = {fg = "#EB65B9"},
GitSignsAdd = {fg = "#41B5C5"},
GitSignsChange = {fg = "#FFE25F"},
GitSignsDelete = {fg = "#EB65B9"},
gitblame = {link = "VirtualText"},
diffAdded = {fg = "#41B5C5"},
diffChanged = {fg = "#FFE25F"},
diffFile = {fg = "#FFE25F"},
diffIndexLine = {fg = "#91889B"},
diffLine = {fg = "#91889B"},
diffNewFile = {fg = "#41B5C5"},
diffOldFile = {fg = "#EB65B9"},
diffRemoved = {fg = "#EB65B9"},
--%% end git %%--
}) end
if cfg.plugins.lsp then apply_colors({
--%% begin lsp %%--
DiagnosticError = {fg = "#FF3D7A"},
DiagnosticHint = {fg = "#91889B"},
DiagnosticInfo = {fg = "#41B5C5"},
DiagnosticOk = {fg = "#75DFC4"},
DiagnosticUnderlineError = {sp = "#FF3D7A", undercurl = true},
DiagnosticUnderlineHint = {sp = "#91889B", undercurl = true},
DiagnosticUnderlineInfo = {sp = "#41B5C5", undercurl = true},
DiagnosticUnderlineOk = {sp = "#75DFC4", undercurl = true},
DiagnosticUnderlineWarn = {sp = "#FFB961", undercurl = true},
DiagnosticVirtualTextError = {fg = "#FF3D7A", bg = "#52001E"},
DiagnosticVirtualTextHint = {fg = "#91889B", bg = "#28242D"},
DiagnosticVirtualTextInfo = {fg = "#41B5C5", bg = "#0A2E33"},
DiagnosticVirtualTextOk = {fg = "#75DFC4", bg = "#193830"},
DiagnosticVirtualTextWarn = {fg = "#FFB961", bg = "#452B00"},
DiagnosticWarn = {fg = "#FFB961"},
LspInfoBorder = {link = "FloatBorder"},
LspReferenceRead = {bg = "#473851", underline = true},
LspReferenceText = {bg = "#473851", underline = true},
LspReferenceWrite = {bg = "#473851", underline = true},
LspCodeLens = {link = "VirtualText"},
LspCodeLensSeparator = {link = "VirtualText"},
LspSignatureActiveParameter = {link = "VirtualText"},
["@lsp.type.class"] = {},
["@lsp.type.decorator"] = {},
["@lsp.type.enum"] = {},
["@lsp.type.enumMember"] = {},
["@lsp.type.function"] = {},
["@lsp.type.interface"] = {},
["@lsp.type.macro"] = {},
["@lsp.type.method"] = {},
["@lsp.type.namespace"] = {},
["@lsp.type.parameter"] = {},
["@lsp.type.property"] = {},
["@lsp.type.struct"] = {},
["@lsp.type.type"] = {},
["@lsp.type.variable"] = {},
--%% end lsp %%--
}) end
if cfg.plugins.neotree then apply_colors({
--%% begin neotree %%--
NeoTreeFloatBorder = {link = "FloatBorder"},
NeoTreeFloatTitle = {link = "FloatTitle"},
NeoTreeGitAdded = {fg = "#41B5C5", bold = true},
NeoTreeGitConflict = {fg = "#FF3D7A", bold = true},
NeoTreeGitDeleted = {fg = "#EB65B9", bold = true},
NeoTreeGitIgnored = {fg = "#7C6A96", bold = true},
NeoTreeGitModified = {fg = "#FFE25F", bold = true},
NeoTreeGitUntracked = {fg = "#91889B"},
--%% end neotree %%--
}) end
if cfg.plugins.obsidian then apply_colors({
--%% begin obsidian %%--
ObsidianDone = {fg = "#91889B"},
ObsidianExtLinkIcon = {fg = "#91889B"},
ObsidianHighlightText = {bg = "#EB65B9"},
ObsidianRefText = {fg = "#B3DBE6", underline = true},
ObsidianRightArrow = {fg = "#FFB961"},
ObsidianTag = {fg = "#75DFC4", italic = true},
ObsidianTilde = {fg = "#FF3D7A"},
ObsidianTodo = {fg = "#41B5C5"},
--%% end obsidian %%--
}) end
if cfg.plugins.package_info then apply_colors({
--%% begin package_info %%--
PackageInfoOutdatedVersion = {fg = "#FF3D7A"},
PackageInfoUpToDateVersion = {},
--%% end package_info %%--
}) end
if cfg.plugins.space then apply_colors({
--%% begin space %%--
ExtraWhitespace = {bg = "#FF3D7A"},
IblIndent = {fg = "#584A6D"},
IblWhitespace = {link = "IblIndent"},
IndentBlanklineChar = {link = "IblIndent"},
IblScope = {fg = "#EB65B9"},
IndentBlanklineContextChar = {link = "IblScope"},
MiniIndentscopeSymbol = {link = "IblScope"},
--%% end space %%--
}) end
if cfg.plugins.telescope then apply_colors({
--%% begin telescope %%--
TelescopeBorder = {link = "FloatBorder"},
TelescopePromptBorder = {link = "FloatBorder"},
TelescopePreviewTitle = {link = "FloatTitle"},
TelescopePromptTitle = {link = "FloatTitle"},
TelescopeResultsTitle = {link = "FloatTitle"},
TelescopeNormal = {link = "NormalFloat"},
TelescopePromptNormal = {link = "NormalFloat"},
TelescopePromptPrefix = {fg = "#EB65B9", bg = "#251F2C"},
TelescopeSelection = {link = "Visual"},
--%% end telescope %%--
}) end
end
