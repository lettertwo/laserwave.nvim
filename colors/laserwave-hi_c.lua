-- GENERATED ON 2025-02-18 AT 18:29:31
-- name:     laserwave-hi_c
-- author:   Eric Eldredge <lettertwo@gmail.com>
-- license:  MIT
-- upstream: https://github.com/lettertwo/laserwave.nvim/colors/laserwave-hi_c.lua
-- blurb:    Based on LaserWave for VSCode by Jared Jones
local function apply_terminal_colors()
  vim.g.terminal_color_0 = "#B3AABD"
  vim.g.terminal_color_1 = "#FF55C0"
  vim.g.terminal_color_2 = "#3FEBBF"
  vim.g.terminal_color_3 = "#FFE25F"
  vim.g.terminal_color_4 = "#1CD4ED"
  vim.g.terminal_color_5 = "#D686F4"
  vim.g.terminal_color_6 = "#ADDFEF"
  vim.g.terminal_color_7 = "#FFFFFF"
  vim.g.terminal_color_8 = "#D686F4"
  vim.g.terminal_color_9 = "#FF3D7A"
  vim.g.terminal_color_10 = "#3FEBBF"
  vim.g.terminal_color_11 = "#FFB961"
  vim.g.terminal_color_12 = "#1CD4ED"
  vim.g.terminal_color_13 = "#FF55C0"
  vim.g.terminal_color_14 = "#ADDFEF"
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
vim.g.colors_name = "laserwave-hi_c"
require("laserwave").set_flavor("hi_c")
local cfg = require("laserwave").get_config()
if cfg.dev then
require("laserwave.dev").setup(cfg)
else
apply_colors({
--%% begin spec %%--
Normal = {fg = "#FFFFFF", bg = "#1A161F"},
NormalNC = {link = "Normal"},
Add = {fg = "#1CD4ED"},
Attribute = {fg = "#FF55C0"},
Boolean = {fg = "#FFE25F"},
Change = {fg = "#3FEBBF"},
Character = {fg = "#3FEBBF"},
CommandMode = {bg = "#4A433E"},
Comment = {fg = "#B3AABD"},
Conceal = {fg = "#FFFFFF", bg = "#1A161F"},
EndOfBuffer = {link = "Conceal"},
SpecialKey = {link = "Conceal"},
Constant = {fg = "#FFE25F"},
CurSearch = {reverse = true},
IncSearch = {link = "CurSearch"},
Substitute = {link = "CurSearch"},
Cursor = {fg = "#FFFFFF", bg = "#472C42", reverse = true},
CursorIM = {link = "Cursor"},
lCursor = {link = "Cursor"},
CursorLine = {bg = "#31253A"},
ColorColumn = {link = "CursorLine"},
CursorColumn = {link = "CursorLine"},
CursorLineFold = {fg = "#D686F4", bg = "#31253A"},
CursorLineNr = {fg = "#DDCBE6", bg = "#31253A"},
CursorLineSign = {fg = "#D686F4", bg = "#31253A"},
Define = {fg = "#FF55C0"},
Delete = {fg = "#FF55C0"},
Delimiter = {fg = "#B5A9C8"},
DiffAdd = {fg = "#1CD4ED", bg = "#222530"},
DiffChange = {fg = "#1CD4ED", bg = "#222530"},
DiffDelete = {fg = "#FF55C0", bg = "#2B202D"},
DiffText = {fg = "#3FEBBF", bg = "#25282D"},
Directory = {fg = "#1CD4ED"},
Error = {fg = "#FF3D7A"},
ErrorMsg = {fg = "#FF3D7A"},
Float = {fg = "#D686F4"},
FloatBorder = {fg = "#FF55C0", bg = "#18141D"},
FloatTitle = {fg = "#FF55C0", bg = "#18141D"},
FoldColumn = {fg = "#67577C", bg = "#1A161F"},
Folded = {fg = "#67577C", bg = "#3E354A"},
Function = {fg = "#FF55C0"},
Identifier = {fg = "#FFFFFF"},
Ignore = {fg = "#B5A9C8"},
Include = {fg = "#1CD4ED", italic = true},
InsertMode = {bg = "#394142"},
Keyword = {fg = "#1CD4ED", italic = true},
LineNr = {fg = "#67577C"},
Macro = {fg = "#FF55C0"},
MatchParen = {fg = "#FF55C0", bold = true},
ModeCommand = {fg = "#FFE25F"},
ModeInsert = {fg = "#3FEBBF"},
ModeMsg = {fg = "#B5A9C8", bold = true},
ModeNormal = {fg = "#1CD4ED"},
ModeReplace = {fg = "#FF55C0"},
ModeSelect = {fg = "#D686F4"},
ModeTerminal = {fg = "#FFE25F"},
ModeTerminalNormal = {fg = "#FFE25F"},
ModeVisual = {fg = "#D686F4"},
MoreMsg = {fg = "#1CD4ED"},
NonText = {fg = "#B5A9C8"},
MsgArea = {link = "NonText"},
PreProc = {link = "NonText"},
NormalFloat = {fg = "#FFFFFF", bg = "#18141D"},
Pmenu = {link = "NormalFloat"},
PmenuSbar = {link = "NormalFloat"},
NormalMode = {bg = "#343F48"},
Number = {fg = "#D686F4"},
Operator = {fg = "#3FEBBF"},
PmenuThumb = {bg = "#B5A9C8"},
PreCondit = {fg = "#1CD4ED"},
Punctuation = {fg = "#B5A9C8"},
Question = {fg = "#1CD4ED"},
QuickFixLine = {bg = "#3A2A44", bold = true},
ReplaceMode = {bg = "#472C42"},
Search = {bg = "#77458D"},
SelectMode = {bg = "#432F4E"},
SignColumn = {fg = "#67577C", bg = "#1A161F"},
Special = {fg = "#3FEBBF"},
SpellBad = {sp = "#FF3D7A", undercurl = true},
SpellCap = {sp = "#FFB961", undercurl = true},
SpellLocal = {sp = "#1CD4ED", undercurl = true},
SpellRare = {sp = "#B3AABD", undercurl = true},
Statement = {fg = "#1CD4ED"},
StatusLine = {fg = "#FFFFFF", bg = "#18141D"},
StatusLineNC = {fg = "#B5A9C8", bg = "#18141D"},
String = {fg = "#ADDFEF"},
TabLine = {fg = "#FFFFFF", bg = "#18141D"},
TabLineFill = {fg = "#FFFFFF", bg = "#18141D"},
TabLineSel = {fg = "#1A161F", bg = "#FF55C0"},
Tag = {fg = "#3FEBBF"},
TerminalBlack = {fg = "#B3AABD"},
TerminalBlue = {fg = "#1CD4ED"},
TerminalBrightBlack = {fg = "#D686F4"},
TerminalBrightBlue = {fg = "#1CD4ED"},
TerminalBrightCyan = {fg = "#ADDFEF"},
TerminalBrightGreen = {fg = "#3FEBBF"},
TerminalBrightMagenta = {fg = "#FF55C0"},
TerminalBrightRed = {fg = "#FF3D7A"},
TerminalBrightWhite = {fg = "#FFFFFF"},
TerminalBrightYellow = {fg = "#FFB961"},
TerminalCyan = {fg = "#ADDFEF"},
TerminalGreen = {fg = "#3FEBBF"},
TerminalMagenta = {fg = "#D686F4"},
TerminalMode = {bg = "#4A433E"},
TerminalNormalMode = {bg = "#4A433E"},
TerminalRed = {fg = "#FF55C0"},
TerminalWhite = {fg = "#FFFFFF"},
TerminalYellow = {fg = "#FFE25F"},
Title = {fg = "#1CD4ED", bold = true},
Todo = {fg = "#FFE25F"},
Type = {fg = "#D686F4"},
Underlined = {underline = true},
VertSplit = {fg = "#FF55C0"},
VirtualText = {fg = "#B5A9C8", bg = "#251F2B"},
Visual = {bg = "#3A2A44"},
PmenuSel = {link = "Visual"},
VisualNOS = {link = "Visual"},
WildMenu = {link = "Visual"},
VisualMode = {bg = "#432F4E"},
WarningMsg = {fg = "#FFB961"},
Whitespace = {fg = "#B5A9C8"},
WinBar = {fg = "#FFFFFF", bg = "#18141D"},
WinBarNC = {fg = "#B5A9C8", bg = "#18141D"},
Winseparator = {fg = "#FF55C0"},
healthError = {fg = "#FF3D7A"},
healthSuccess = {fg = "#3FEBBF"},
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
["@keyword.operator"] = {link = "Operator"},
["@punctuation"] = {link = "Punctuation"},
TreesitterContext = {bg = "#18141D"},
TreesitterContextLineNumber = {fg = "#77458D", bg = "#18141D"},
TreesitterContextSeparator = {fg = "#100D14"},
["@keyword.jsdoc"] = {link = "Type"},
["@property"] = {fg = "#1CD4ED"},
["@string.escape"] = {fg = "#D686F4"},
["@string.regex"] = {fg = "#1CD4ED"},
["@text.diff.add"] = {fg = "#1CD4ED"},
["@text.diff.change"] = {fg = "#3FEBBF"},
["@text.diff.delete"] = {fg = "#FF55C0"},
--%% end treesitter %%--
}) end
if cfg.semantic_highlights then apply_colors({
--%% begin semantic_highlights %%--
["@lsp.typemod.variable.defaultLibrary"] = {link = "Constant"},
["@lsp.typemod.variable.static"] = {link = "Constant"},
["@lsp.type.decorator"] = {link = "Define"},
["@lsp.typemod.variable.callable"] = {link = "Function"},
["@lsp.typemod.variable.injected"] = {link = "Identifier"},
["@lsp.type.class"] = {link = "Type"},
["@lsp.type.keyword"] = {link = "Type"},
["@lsp.type.variable"] = {},
--%% end semantic_highlights %%--
}) end
if cfg.plugins.alpha then apply_colors({
--%% begin alpha %%--
StartLogo1 = {fg = "#1CD4ED"},
StartLogo10 = {fg = "#894376"},
StartLogo11 = {fg = "#823B6C"},
StartLogo12 = {fg = "#6B3950"},
StartLogo13 = {fg = "#5E3C50"},
StartLogo14 = {fg = "#523B4E"},
StartLogo15 = {fg = "#453748"},
StartLogo16 = {fg = "#3C3346"},
StartLogo17 = {fg = "#322E42"},
StartLogo18 = {fg = "#2B2A3F"},
StartLogo19 = {fg = "#252436"},
StartLogo2 = {fg = "#5CC3DF"},
StartLogo20 = {fg = "#1E1C29"},
StartLogo3 = {fg = "#6DAECC"},
StartLogo4 = {fg = "#76A0C4"},
StartLogo5 = {fg = "#7A8DBF"},
StartLogo6 = {fg = "#8A7BB4"},
StartLogo7 = {fg = "#9767AB"},
StartLogo8 = {fg = "#955A96"},
StartLogo9 = {fg = "#904F85"},
--%% end alpha %%--
}) end
if cfg.plugins.blink then apply_colors({
--%% begin blink %%--
BlinkCmpKindClass = {fg = "#D686F4"},
BlinkCmpKindConstant = {fg = "#FFE25F"},
BlinkCmpKindConstructor = {fg = "#FF55C0"},
BlinkCmpKindCopilot = {fg = "#FFE25F"},
BlinkCmpKindEnum = {fg = "#D686F4"},
BlinkCmpKindEnumMember = {fg = "#D686F4"},
BlinkCmpKindEvent = {fg = "#D686F4"},
BlinkCmpKindField = {fg = "#3FEBBF"},
BlinkCmpKindFunction = {fg = "#FF55C0"},
BlinkCmpKindInterface = {fg = "#D686F4"},
BlinkCmpKindKeyword = {fg = "#1CD4ED"},
BlinkCmpKindMethod = {fg = "#FF55C0"},
BlinkCmpKindModule = {fg = "#B5A9C8"},
BlinkCmpKindOperator = {fg = "#3FEBBF"},
BlinkCmpKindProperty = {fg = "#3FEBBF"},
BlinkCmpKindReference = {fg = "#FFE25F"},
BlinkCmpKindSnippet = {fg = "#B5A9C8"},
BlinkCmpKindStruct = {fg = "#D686F4"},
BlinkCmpKindText = {fg = "#B3AABD"},
BlinkCmpKindTypeParameter = {fg = "#D686F4"},
BlinkCmpKindUnit = {fg = "#D686F4"},
BlinkCmpKindValue = {fg = "#1CD4ED"},
BlinkCmpKindVariable = {fg = "#FFFFFF"},
BlinkCmpLabel = {fg = "#B3AABD", bg = "NONE"},
BlinkCmpLabelDeprecated = {fg = "#B5A9C8", bg = "NONE", strikethrough = true},
BlinkCmpLabelMatch = {fg = "#FF55C0", bg = "NONE"},
BlinkCmpMenu = {},
BlinkCmpDocBorder = {link = "FloatBorder"},
BlinkCmpMenuBorder = {link = "FloatBorder"},
BlinkCmpSignatureHelpBorder = {link = "FloatBorder"},
--%% end blink %%--
}) end
if cfg.plugins.cmp then apply_colors({
--%% begin cmp %%--
CmpItemAbbr = {fg = "#B3AABD", bg = "NONE"},
CmpItemAbbrDeprecated = {fg = "#B5A9C8", bg = "NONE", strikethrough = true},
CmpItemAbbrMatch = {fg = "#FF55C0", bg = "NONE"},
CmpItemAbbrMatchFuzzy = {fg = "#FF55C0", bg = "NONE"},
CmpItemKindClass = {fg = "#D686F4"},
CmpItemKindConstant = {fg = "#FFE25F"},
CmpItemKindConstructor = {fg = "#FF55C0"},
CmpItemKindCopilot = {fg = "#FFE25F"},
CmpItemKindEnum = {fg = "#D686F4"},
CmpItemKindEnumMember = {fg = "#D686F4"},
CmpItemKindEvent = {fg = "#D686F4"},
CmpItemKindField = {fg = "#3FEBBF"},
CmpItemKindFunction = {fg = "#FF55C0"},
CmpItemKindInterface = {fg = "#D686F4"},
CmpItemKindKeyword = {fg = "#1CD4ED"},
CmpItemKindMethod = {fg = "#FF55C0"},
CmpItemKindModule = {fg = "#B5A9C8"},
CmpItemKindOperator = {fg = "#3FEBBF"},
CmpItemKindProperty = {fg = "#3FEBBF"},
CmpItemKindReference = {fg = "#FFE25F"},
CmpItemKindSnippet = {fg = "#B5A9C8"},
CmpItemKindStruct = {fg = "#D686F4"},
CmpItemKindText = {fg = "#B3AABD"},
CmpItemKindTypeParameter = {fg = "#D686F4"},
CmpItemKindUnit = {fg = "#D686F4"},
CmpItemKindValue = {fg = "#1CD4ED"},
CmpItemKindVariable = {fg = "#FFFFFF"},
CmpItemMenu = {fg = "#B5A9C8", bg = "NONE"},
--%% end cmp %%--
}) end
if cfg.plugins.git then apply_colors({
--%% begin git %%--
GitGutterAdd = {fg = "#1CD4ED"},
GitGutterChange = {fg = "#3FEBBF"},
GitGutterDelete = {fg = "#FF55C0"},
GitSignsAdd = {fg = "#1CD4ED"},
GitSignsChange = {fg = "#3FEBBF"},
GitSignsDelete = {fg = "#FF55C0"},
gitblame = {link = "VirtualText"},
--%% end git %%--
}) end
if cfg.plugins.lsp then apply_colors({
--%% begin lsp %%--
DiagnosticError = {fg = "#FF3D7A"},
DiagnosticHint = {fg = "#B3AABD"},
DiagnosticInfo = {fg = "#1CD4ED"},
DiagnosticOk = {fg = "#3FEBBF"},
DiagnosticUnderlineError = {sp = "#FF3D7A", undercurl = true},
DiagnosticUnderlineHint = {sp = "#B3AABD", undercurl = true},
DiagnosticUnderlineInfo = {sp = "#1CD4ED", undercurl = true},
DiagnosticUnderlineOk = {sp = "#3FEBBF", undercurl = true},
DiagnosticUnderlineWarn = {sp = "#FFB961", undercurl = true},
DiagnosticVirtualTextError = {fg = "#FF3D7A", bg = "#52001E"},
DiagnosticVirtualTextHint = {fg = "#B3AABD", bg = "#302937"},
DiagnosticVirtualTextInfo = {fg = "#1CD4ED", bg = "#02363D"},
DiagnosticVirtualTextOk = {fg = "#3FEBBF", bg = "#083A2D"},
DiagnosticVirtualTextWarn = {fg = "#FFB961", bg = "#452B00"},
DiagnosticWarn = {fg = "#FFB961"},
LspInfoBorder = {link = "FloatBorder"},
LspReferenceRead = {bg = "#3A2A44"},
LspReferenceText = {bg = "#3A2A44"},
LspReferenceWrite = {bg = "#3A2A44"},
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
if cfg.plugins.mini_pick then apply_colors({
--%% begin mini_pick %%--
MiniPickPreviewLine = {link = "CursorLine"},
MiniPickBorder = {link = "FloatBorder"},
MiniPickBorderText = {link = "FloatTitle"},
MiniPickBorderBusy = {fg = "#FFB961", bg = "#18141D"},
MiniPickCursor = {fg = "#FF55C0", bg = "#18141D"},
MiniPickMatchCurrent = {bg = "#31253A", bold = true},
MiniPickMatchRanges = {fg = "#FF55C0", bold = true},
MiniPickPreviewRegion = {fg = "#FF55C0", bg = "#3A2A44", bold = true},
MiniPickNormal = {link = "NormalFloat"},
MiniPickHeader = {link = "Title"},
MiniPickPrompt = {link = "Title"},
MiniPickMatchMarked = {link = "Visual"},
--%% end mini_pick %%--
}) end
if cfg.plugins.neotree then apply_colors({
--%% begin neotree %%--
NeoTreeFloatBorder = {link = "FloatBorder"},
NeoTreeFloatTitle = {link = "FloatTitle"},
NeoTreeGitAdded = {fg = "#1CD4ED", bold = true},
NeoTreeGitConflict = {fg = "#FF3D7A", bold = true},
NeoTreeGitDeleted = {fg = "#FF55C0", bold = true},
NeoTreeGitIgnored = {fg = "#B5A9C8", bold = true},
NeoTreeGitModified = {fg = "#3FEBBF", bold = true},
NeoTreeGitUntracked = {fg = "#B3AABD"},
--%% end neotree %%--
}) end
if cfg.plugins.obsidian then apply_colors({
--%% begin obsidian %%--
ObsidianDone = {fg = "#B3AABD"},
ObsidianExtLinkIcon = {fg = "#B3AABD"},
ObsidianHighlightText = {bg = "#FF55C0"},
ObsidianRefText = {fg = "#ADDFEF", underline = true},
ObsidianRightArrow = {fg = "#FFB961"},
ObsidianTag = {fg = "#3FEBBF", italic = true},
ObsidianTilde = {fg = "#FF3D7A"},
ObsidianTodo = {fg = "#1CD4ED"},
--%% end obsidian %%--
}) end
if cfg.plugins.package_info then apply_colors({
--%% begin package_info %%--
PackageInfoOutdatedVersion = {fg = "#FF3D7A"},
PackageInfoUpToDateVersion = {},
--%% end package_info %%--
}) end
if cfg.plugins.snacks then apply_colors({
--%% begin snacks %%--
SnacksDashboardDesc = {link = "Normal"},
SnacksDashboardFooter = {fg = "#B5A9C8"},
SnacksDashboardHeader = {fg = "#1CD4ED"},
SnacksDashboardHeader1 = {fg = "#1CD4ED"},
SnacksDashboardHeader10 = {fg = "#894376"},
SnacksDashboardHeader11 = {fg = "#823B6C"},
SnacksDashboardHeader12 = {fg = "#6B3950"},
SnacksDashboardHeader13 = {fg = "#5E3C50"},
SnacksDashboardHeader14 = {fg = "#523B4E"},
SnacksDashboardHeader15 = {fg = "#453748"},
SnacksDashboardHeader16 = {fg = "#3C3346"},
SnacksDashboardHeader17 = {fg = "#322E42"},
SnacksDashboardHeader18 = {fg = "#2B2A3F"},
SnacksDashboardHeader19 = {fg = "#252436"},
SnacksDashboardHeader2 = {fg = "#5CC3DF"},
SnacksDashboardHeader20 = {fg = "#1E1C29"},
SnacksDashboardHeader3 = {fg = "#6DAECC"},
SnacksDashboardHeader4 = {fg = "#76A0C4"},
SnacksDashboardHeader5 = {fg = "#7A8DBF"},
SnacksDashboardHeader6 = {fg = "#8A7BB4"},
SnacksDashboardHeader7 = {fg = "#9767AB"},
SnacksDashboardHeader8 = {fg = "#955A96"},
SnacksDashboardHeader9 = {fg = "#904F85"},
SnacksDashboardIcon = {fg = "#ADDFEF"},
--%% end snacks %%--
}) end
if cfg.plugins.space then apply_colors({
--%% begin space %%--
ExtraWhitespace = {bg = "#FF3D7A"},
MiniTrailspace = {link = "ExtraWhitespace"},
SnacksIndentBlank = {link = "ExtraWhitespace"},
IblIndent = {fg = "#836EA1"},
IblWhitespace = {link = "IblIndent"},
IndentBlanklineChar = {link = "IblIndent"},
SnacksIndent = {link = "IblIndent"},
IblScope = {fg = "#3FEBBF"},
IndentBlanklineContextChar = {link = "IblScope"},
MiniIndentscopeSymbol = {link = "IblScope"},
SnacksIndentChunk = {link = "IblScope"},
SnacksIndentScope = {link = "IblScope"},
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
TelescopePromptPrefix = {fg = "#FF55C0", bg = "#18141D"},
TelescopeSelection = {link = "Visual"},
--%% end telescope %%--
}) end
end
