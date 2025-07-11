-- GENERATED ON 2025-07-11 AT 18:47:28
-- name:     laserwave
-- author:   Eric Eldredge <lettertwo@gmail.com>
-- license:  MIT
-- upstream: https://github.com/lettertwo/laserwave.nvim/colors/laserwave.lua
-- blurb:    Based on LaserWave for VSCode by Jared Jones
local function apply_terminal_colors()
  vim.g.terminal_color_0 = "#91889B"
  vim.g.terminal_color_1 = "#EB65B9"
  vim.g.terminal_color_2 = "#41B5C5"
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
Add = {fg = "#41B5C5"},
Attribute = {fg = "#EB65B9"},
Boolean = {fg = "#FFE25F"},
Change = {fg = "#75DFC4"},
Character = {fg = "#75DFC4"},
CommandMode = {bg = "#554C47"},
Comment = {fg = "#91889B"},
Conceal = {fg = "#FFFFFF", bg = "#27212E"},
EndOfBuffer = {link = "Conceal"},
SpecialKey = {link = "Conceal"},
Constant = {fg = "#FFE25F"},
CurSearch = {reverse = true},
IncSearch = {link = "CurSearch"},
Substitute = {link = "CurSearch"},
Cursor = {fg = "#FFFFFF", bg = "#4F354C", reverse = true},
CursorIM = {link = "Cursor"},
lCursor = {link = "Cursor"},
CursorLine = {bg = "#392E42"},
ColorColumn = {link = "CursorLine"},
CursorColumn = {link = "CursorLine"},
CursorLineFold = {fg = "#B381C5", bg = "#392E42"},
CursorLineNr = {fg = "#D1C5D6", bg = "#392E42"},
CursorLineSign = {fg = "#B381C5", bg = "#392E42"},
Define = {fg = "#EB65B9"},
Delete = {fg = "#EB65B9"},
Delimiter = {fg = "#7C6A96"},
DiffAdd = {fg = "#41B5C5", bg = "#2B2D3C"},
DiffChange = {fg = "#41B5C5", bg = "#2B2D3C"},
DiffDelete = {fg = "#EB65B9", bg = "#372A3A"},
DiffText = {fg = "#75DFC4", bg = "#30323D"},
Directory = {fg = "#41B5C5"},
Error = {fg = "#FF3D7A"},
ErrorMsg = {fg = "#FF3D7A"},
Float = {fg = "#B381C5"},
FloatBorder = {fg = "#EB65B9", bg = "#251F2C"},
FloatTitle = {fg = "#EB65B9", bg = "#251F2C"},
FoldColumn = {fg = "#50445F", bg = "#27212E"},
Folded = {fg = "#50445F", bg = "#3C3347"},
Function = {fg = "#EB65B9"},
Identifier = {fg = "#FFFFFF"},
Ignore = {fg = "#7C6A96"},
Include = {fg = "#41B5C5", italic = true},
InsertMode = {bg = "#434A4D"},
Keyword = {fg = "#41B5C5", italic = true},
LineNr = {fg = "#50445F"},
Macro = {fg = "#EB65B9"},
MatchParen = {fg = "#EB65B9", bold = true},
ModeCommand = {fg = "#FFE25F"},
ModeInsert = {fg = "#75DFC4"},
ModeMsg = {fg = "#7C6A96", bold = true},
ModeNormal = {fg = "#41B5C5"},
ModeReplace = {fg = "#EB65B9"},
ModeSelect = {fg = "#B381C5"},
ModeTerminal = {fg = "#FFE25F"},
ModeTerminalNormal = {fg = "#FFE25F"},
ModeVisual = {fg = "#B381C5"},
MoreMsg = {fg = "#41B5C5"},
NonText = {fg = "#7C6A96"},
MsgArea = {link = "NonText"},
PreProc = {link = "NonText"},
NormalFloat = {fg = "#FFFFFF", bg = "#251F2C"},
Pmenu = {link = "NormalFloat"},
PmenuSbar = {link = "NormalFloat"},
NormalMode = {bg = "#39434D"},
Number = {fg = "#B381C5"},
Operator = {fg = "#75DFC4"},
PmenuThumb = {bg = "#7C6A96"},
PreCondit = {fg = "#41B5C5"},
Punctuation = {fg = "#7C6A96"},
Question = {fg = "#41B5C5"},
QuickFixLine = {bg = "#3E3248", bold = true},
ReplaceMode = {bg = "#4F354C"},
Search = {bg = "#6B4F79"},
SelectMode = {bg = "#473851"},
SignColumn = {fg = "#50445F", bg = "#27212E"},
Special = {fg = "#75DFC4"},
SpellBad = {sp = "#FF3D7A", undercurl = true},
SpellCap = {sp = "#FFB961", undercurl = true},
SpellLocal = {sp = "#41B5C5", undercurl = true},
SpellRare = {sp = "#91889B", undercurl = true},
Statement = {fg = "#41B5C5"},
StatusLine = {fg = "#FFFFFF", bg = "#251F2C"},
StatusLineNC = {fg = "#7C6A96", bg = "#251F2C"},
String = {fg = "#B3DBE6"},
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
TerminalMode = {bg = "#554C47"},
TerminalNormalMode = {bg = "#554C47"},
TerminalRed = {fg = "#EB65B9"},
TerminalWhite = {fg = "#FFFFFF"},
TerminalYellow = {fg = "#FFE25F"},
Title = {fg = "#41B5C5", bold = true},
Todo = {fg = "#FFE25F"},
Type = {fg = "#B381C5"},
Underlined = {underline = true},
VertSplit = {fg = "#EB65B9"},
VirtualText = {fg = "#7C6A96", bg = "#302938"},
Visual = {bg = "#3E3248"},
PmenuSel = {link = "Visual"},
VisualNOS = {link = "Visual"},
WildMenu = {link = "Visual"},
VisualMode = {bg = "#473851"},
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
["@keyword.operator"] = {link = "Operator"},
["@punctuation"] = {link = "Punctuation"},
TreesitterContext = {bg = "#251F2C"},
TreesitterContextLineNumber = {fg = "#6B4F79", bg = "#251F2C"},
TreesitterContextSeparator = {fg = "#18141D"},
["@keyword.jsdoc"] = {link = "Type"},
["@property"] = {fg = "#41B5C5"},
["@string.escape"] = {fg = "#B381C5"},
["@string.regex"] = {fg = "#41B5C5"},
["@text.diff.add"] = {fg = "#41B5C5"},
["@text.diff.change"] = {fg = "#75DFC4"},
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
["@lsp.type.class"] = {link = "Type"},
["@lsp.type.keyword"] = {link = "Type"},
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
if cfg.plugins.blink then apply_colors({
--%% begin blink %%--
BlinkCmpKindClass = {fg = "#B381C5"},
BlinkCmpKindConstant = {fg = "#FFE25F"},
BlinkCmpKindConstructor = {fg = "#EB65B9"},
BlinkCmpKindCopilot = {fg = "#FFE25F"},
BlinkCmpKindEnum = {fg = "#B381C5"},
BlinkCmpKindEnumMember = {fg = "#B381C5"},
BlinkCmpKindEvent = {fg = "#B381C5"},
BlinkCmpKindField = {fg = "#75DFC4"},
BlinkCmpKindFunction = {fg = "#EB65B9"},
BlinkCmpKindInterface = {fg = "#B381C5"},
BlinkCmpKindKeyword = {fg = "#41B5C5"},
BlinkCmpKindMethod = {fg = "#EB65B9"},
BlinkCmpKindModule = {fg = "#7C6A96"},
BlinkCmpKindOperator = {fg = "#75DFC4"},
BlinkCmpKindProperty = {fg = "#75DFC4"},
BlinkCmpKindReference = {fg = "#FFE25F"},
BlinkCmpKindSnippet = {fg = "#7C6A96"},
BlinkCmpKindStruct = {fg = "#B381C5"},
BlinkCmpKindText = {fg = "#91889B"},
BlinkCmpKindTypeParameter = {fg = "#B381C5"},
BlinkCmpKindUnit = {fg = "#B381C5"},
BlinkCmpKindValue = {fg = "#41B5C5"},
BlinkCmpKindVariable = {fg = "#FFFFFF"},
BlinkCmpLabel = {fg = "#91889B", bg = "NONE"},
BlinkCmpLabelDeprecated = {fg = "#7C6A96", bg = "NONE", strikethrough = true},
BlinkCmpLabelMatch = {fg = "#EB65B9", bg = "NONE"},
BlinkCmpMenu = {},
BlinkCmpDocBorder = {link = "FloatBorder"},
BlinkCmpMenuBorder = {link = "FloatBorder"},
BlinkCmpSignatureHelpBorder = {link = "FloatBorder"},
--%% end blink %%--
}) end
if cfg.plugins.cmp then apply_colors({
--%% begin cmp %%--
CmpItemAbbr = {fg = "#91889B", bg = "NONE"},
CmpItemAbbrDeprecated = {fg = "#7C6A96", bg = "NONE", strikethrough = true},
CmpItemAbbrMatch = {fg = "#EB65B9", bg = "NONE"},
CmpItemAbbrMatchFuzzy = {fg = "#EB65B9", bg = "NONE"},
CmpItemKindClass = {fg = "#B381C5"},
CmpItemKindConstant = {fg = "#FFE25F"},
CmpItemKindConstructor = {fg = "#EB65B9"},
CmpItemKindCopilot = {fg = "#FFE25F"},
CmpItemKindEnum = {fg = "#B381C5"},
CmpItemKindEnumMember = {fg = "#B381C5"},
CmpItemKindEvent = {fg = "#B381C5"},
CmpItemKindField = {fg = "#75DFC4"},
CmpItemKindFunction = {fg = "#EB65B9"},
CmpItemKindInterface = {fg = "#B381C5"},
CmpItemKindKeyword = {fg = "#41B5C5"},
CmpItemKindMethod = {fg = "#EB65B9"},
CmpItemKindModule = {fg = "#7C6A96"},
CmpItemKindOperator = {fg = "#75DFC4"},
CmpItemKindProperty = {fg = "#75DFC4"},
CmpItemKindReference = {fg = "#FFE25F"},
CmpItemKindSnippet = {fg = "#7C6A96"},
CmpItemKindStruct = {fg = "#B381C5"},
CmpItemKindText = {fg = "#91889B"},
CmpItemKindTypeParameter = {fg = "#B381C5"},
CmpItemKindUnit = {fg = "#B381C5"},
CmpItemKindValue = {fg = "#41B5C5"},
CmpItemKindVariable = {fg = "#FFFFFF"},
CmpItemMenu = {fg = "#7C6A96", bg = "NONE"},
--%% end cmp %%--
}) end
if cfg.plugins.git then apply_colors({
--%% begin git %%--
GitGutterAdd = {fg = "#41B5C5"},
GitGutterChange = {fg = "#75DFC4"},
GitGutterDelete = {fg = "#EB65B9"},
GitSignsAdd = {fg = "#41B5C5"},
GitSignsChange = {fg = "#75DFC4"},
GitSignsDelete = {fg = "#EB65B9"},
gitblame = {link = "VirtualText"},
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
LspReferenceRead = {bg = "#3E3248"},
LspReferenceText = {bg = "#3E3248"},
LspReferenceWrite = {bg = "#3E3248"},
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
MiniPickBorderBusy = {fg = "#FFB961", bg = "#251F2C"},
MiniPickCursor = {fg = "#EB65B9", bg = "#251F2C"},
MiniPickMatchCurrent = {bg = "#392E42", bold = true},
MiniPickMatchRanges = {fg = "#EB65B9", bold = true},
MiniPickPreviewRegion = {fg = "#EB65B9", bg = "#3E3248", bold = true},
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
NeoTreeGitAdded = {fg = "#41B5C5", bold = true},
NeoTreeGitConflict = {fg = "#FF3D7A", bold = true},
NeoTreeGitDeleted = {fg = "#EB65B9", bold = true},
NeoTreeGitIgnored = {fg = "#7C6A96", bold = true},
NeoTreeGitModified = {fg = "#75DFC4", bold = true},
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
if cfg.plugins.snacks then apply_colors({
--%% begin snacks %%--
SnacksDashboardDesc = {link = "Normal"},
SnacksDashboardFooter = {fg = "#7C6A96"},
SnacksDashboardHeader = {fg = "#41B5C5"},
SnacksDashboardHeader1 = {fg = "#41B5C5"},
SnacksDashboardHeader10 = {fg = "#864E7A"},
SnacksDashboardHeader11 = {fg = "#804570"},
SnacksDashboardHeader12 = {fg = "#753F58"},
SnacksDashboardHeader13 = {fg = "#664055"},
SnacksDashboardHeader14 = {fg = "#593F52"},
SnacksDashboardHeader15 = {fg = "#4E3C50"},
SnacksDashboardHeader16 = {fg = "#45394D"},
SnacksDashboardHeader17 = {fg = "#3C364B"},
SnacksDashboardHeader18 = {fg = "#353248"},
SnacksDashboardHeader19 = {fg = "#2E2C40"},
SnacksDashboardHeader2 = {fg = "#59A6B8"},
SnacksDashboardHeader20 = {fg = "#2B2839"},
SnacksDashboardHeader3 = {fg = "#689DB2"},
SnacksDashboardHeader4 = {fg = "#6D90A8"},
SnacksDashboardHeader5 = {fg = "#7187AB"},
SnacksDashboardHeader6 = {fg = "#7A77A7"},
SnacksDashboardHeader7 = {fg = "#8768A1"},
SnacksDashboardHeader8 = {fg = "#8C6093"},
SnacksDashboardHeader9 = {fg = "#875582"},
SnacksDashboardIcon = {fg = "#B3DBE6"},
--%% end snacks %%--
}) end
if cfg.plugins.space then apply_colors({
--%% begin space %%--
ExtraWhitespace = {bg = "#FF3D7A"},
MiniTrailspace = {link = "ExtraWhitespace"},
SnacksIndentBlank = {link = "ExtraWhitespace"},
IblIndent = {fg = "#332A41"},
IblWhitespace = {link = "IblIndent"},
IndentBlanklineChar = {link = "IblIndent"},
SnacksIndent = {link = "IblIndent"},
IblScope = {fg = "#584A6D"},
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
TelescopePromptPrefix = {fg = "#EB65B9", bg = "#251F2C"},
TelescopeSelection = {link = "Visual"},
--%% end telescope %%--
}) end
end
