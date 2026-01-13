-- GENERATED ON 2026-01-13 AT 01:10:52
-- name:     laserwave
-- author:   Eric Eldredge <lettertwo@gmail.com>
-- license:  MIT
-- upstream: https://github.com/lettertwo/laserwave.nvim/colors/laserwave.lua
-- blurb:    Based on LaserWave for VSCode by Jared Jones
local function apply_terminal_colors()
  vim.g.terminal_color_0 = "#91889B"
  vim.g.terminal_color_1 = "#EB64B9"
  vim.g.terminal_color_2 = "#40B4C4"
  vim.g.terminal_color_3 = "#FFE261"
  vim.g.terminal_color_4 = "#40B4C4"
  vim.g.terminal_color_5 = "#B381C5"
  vim.g.terminal_color_6 = "#B4DCE7"
  vim.g.terminal_color_7 = "#FFFFFF"
  vim.g.terminal_color_8 = "#B381C5"
  vim.g.terminal_color_9 = "#FF3E7B"
  vim.g.terminal_color_10 = "#74DFC4"
  vim.g.terminal_color_11 = "#FFB85B"
  vim.g.terminal_color_12 = "#40B4C4"
  vim.g.terminal_color_13 = "#EB64B9"
  vim.g.terminal_color_14 = "#B4DCE7"
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
apply_colors({
--%% begin spec %%--
Normal = {fg = "#FFFFFF", bg = "#27212E"},
NormalNC = {link = "Normal"},
Add = {fg = "#40B4C4"},
Attribute = {fg = "#EB64B9"},
Boolean = {fg = "#FFE261"},
Change = {fg = "#74DFC4"},
Character = {fg = "#74DFC4"},
CommandMode = {bg = "#3E505B"},
Comment = {fg = "#91889B"},
Conceal = {fg = "#FFFFFF", bg = "#27212E"},
EndOfBuffer = {link = "Conceal"},
SpecialKey = {link = "Conceal"},
Constant = {fg = "#FFE261"},
CurSearch = {reverse = true},
IncSearch = {link = "CurSearch"},
Substitute = {link = "CurSearch"},
Cursor = {fg = "#FFFFFF", bg = "#4C3554", reverse = true},
CursorIM = {link = "Cursor"},
lCursor = {link = "Cursor"},
CursorLine = {bg = "#392E42"},
ColorColumn = {link = "CursorLine"},
CursorColumn = {link = "CursorLine"},
CursorLineFold = {fg = "#B381C5", bg = "#392E42"},
CursorLineNr = {fg = "#B0CFBE", bg = "#392E42"},
CursorLineSign = {fg = "#B381C5", bg = "#392E42"},
Define = {fg = "#EB64B9"},
Delete = {fg = "#EB64B9"},
Delimiter = {fg = "#7B6995"},
DiffAdd = {fg = "#40B4C4", bg = "#322B43"},
DiffChange = {fg = "#40B4C4", bg = "#322B43"},
DiffDelete = {fg = "#EB64B9", bg = "#35293D"},
DiffText = {fg = "#74DFC4", bg = "#332F48"},
DiffTextAdd = {fg = "#40B4C4", bg = "#322B43"},
Directory = {fg = "#40B4C4"},
Error = {fg = "#FF3E7B"},
ErrorMsg = {fg = "#FF3E7B"},
Float = {fg = "#B381C5"},
FloatBorder = {fg = "#EB64B9", bg = "#241E2B"},
FloatTitle = {fg = "#EB64B9", bg = "#241E2B"},
FoldColumn = {fg = "#4F435F", bg = "#27212E"},
Folded = {fg = "#4F435F", bg = "#3B3245"},
Function = {fg = "#EB64B9"},
Identifier = {fg = "#FFFFFF"},
Ignore = {fg = "#7B6995"},
Include = {fg = "#40B4C4", italic = true},
InsertMode = {bg = "#3F4960"},
Keyword = {fg = "#40B4C4", italic = true},
LineNr = {fg = "#4F435F"},
Macro = {fg = "#EB64B9"},
MatchParen = {fg = "#EB64B9", bold = true},
ModeCommand = {fg = "#FFE261"},
ModeInsert = {fg = "#74DFC4"},
ModeMsg = {fg = "#7B6995", bold = true},
ModeNormal = {fg = "#40B4C4"},
ModeReplace = {fg = "#EB64B9"},
ModeSelect = {fg = "#B381C5"},
ModeTerminal = {fg = "#FFE261"},
ModeTerminalNormal = {fg = "#FFE261"},
ModeVisual = {fg = "#B381C5"},
MoreMsg = {fg = "#40B4C4"},
NonText = {fg = "#7B6995"},
MsgArea = {link = "NonText"},
PreProc = {link = "NonText"},
NormalFloat = {fg = "#FFFFFF", bg = "#241E2B"},
Pmenu = {link = "NormalFloat"},
PmenuSbar = {link = "NormalFloat"},
NormalMode = {bg = "#3A3C6C"},
Number = {fg = "#B381C5"},
OkMsg = {fg = "#74DFC4"},
Operator = {fg = "#74DFC4"},
PmenuThumb = {bg = "#7B6995"},
PreCondit = {fg = "#40B4C4"},
Punctuation = {fg = "#7B6995"},
Question = {fg = "#40B4C4"},
QuickFixLine = {bg = "#3F334A", bold = true},
ReplaceMode = {bg = "#4C3554"},
Search = {bg = "#684E79"},
SelectMode = {bg = "#453751"},
SignColumn = {fg = "#4F435F", bg = "#27212E"},
Special = {fg = "#74DFC4"},
SpellBad = {sp = "#FF3E7B", undercurl = true},
SpellCap = {sp = "#FFB85B", undercurl = true},
SpellLocal = {sp = "#40B4C4", undercurl = true},
SpellRare = {sp = "#91889B", undercurl = true},
Statement = {fg = "#40B4C4"},
StatusLine = {fg = "#FFFFFF", bg = "#241E2B"},
StatusLineNC = {fg = "#7B6995", bg = "#241E2B"},
String = {fg = "#B4DCE7"},
TabLine = {fg = "#FFFFFF", bg = "#241E2B"},
TabLineFill = {fg = "#FFFFFF", bg = "#241E2B"},
TabLineSel = {fg = "#27212E", bg = "#EB64B9"},
Tag = {fg = "#74DFC4"},
TerminalBlack = {fg = "#91889B"},
TerminalBlue = {fg = "#40B4C4"},
TerminalBrightBlack = {fg = "#B381C5"},
TerminalBrightBlue = {fg = "#40B4C4"},
TerminalBrightCyan = {fg = "#B4DCE7"},
TerminalBrightGreen = {fg = "#74DFC4"},
TerminalBrightMagenta = {fg = "#EB64B9"},
TerminalBrightRed = {fg = "#FF3E7B"},
TerminalBrightWhite = {fg = "#FFFFFF"},
TerminalBrightYellow = {fg = "#FFB85B"},
TerminalCyan = {fg = "#B4DCE7"},
TerminalGreen = {fg = "#74DFC4"},
TerminalMagenta = {fg = "#B381C5"},
TerminalMode = {bg = "#3E505B"},
TerminalNormalMode = {bg = "#3E505B"},
TerminalRed = {fg = "#EB64B9"},
TerminalWhite = {fg = "#FFFFFF"},
TerminalYellow = {fg = "#FFE261"},
Title = {fg = "#40B4C4", bold = true},
Todo = {fg = "#FFE261"},
Type = {fg = "#B381C5"},
Underlined = {underline = true},
VirtualText = {fg = "#7B6995", bg = "#312A39"},
Visual = {bg = "#3F334A"},
PmenuSel = {link = "Visual"},
VisualNOS = {link = "Visual"},
WildMenu = {link = "Visual"},
VisualMode = {bg = "#453751"},
WarningMsg = {fg = "#FFB85B"},
Whitespace = {fg = "#7B6995"},
WinBar = {fg = "#FFFFFF", bg = "#241E2B"},
WinBarNC = {fg = "#7B6995", bg = "#241E2B"},
WinSeparator = {fg = "#EB64B9"},
healthError = {fg = "#FF3E7B"},
healthSuccess = {fg = "#74DFC4"},
healthWarning = {fg = "#FFB85B"},
--%% end spec %%--
})
if cfg.options.transparent then
  apply_colors({ Normal = { bg = nil } }, true)
end
apply_colors({
  Comment = { italic = cfg.options.italic_comments },
  Function = { italic = cfg.options.italic_functions },
  Statement = { italic = cfg.options.italic_keywords },
  Keyword = { italic = cfg.options.italic_keywords },
  Include = { italic = cfg.options.italic_keywords },
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
TreesitterContext = {bg = "#241E2B"},
TreesitterContextLineNumber = {fg = "#684E79", bg = "#241E2B"},
TreesitterContextSeparator = {fg = "#18141D"},
["@keyword.jsdoc"] = {link = "Type"},
["@property"] = {fg = "#40B4C4"},
["@string.escape"] = {fg = "#B381C5"},
["@string.regex"] = {fg = "#40B4C4"},
["@text.diff.add"] = {fg = "#40B4C4"},
["@text.diff.change"] = {fg = "#74DFC4"},
["@text.diff.delete"] = {fg = "#EB64B9"},
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
StartLogo1 = {fg = "#40B4C4"},
StartLogo10 = {fg = "#85498A"},
StartLogo11 = {fg = "#7C457B"},
StartLogo12 = {fg = "#763B72"},
StartLogo13 = {fg = "#693B6F"},
StartLogo14 = {fg = "#5E3A6B"},
StartLogo15 = {fg = "#533865"},
StartLogo16 = {fg = "#49355D"},
StartLogo17 = {fg = "#413255"},
StartLogo18 = {fg = "#392F4B"},
StartLogo19 = {fg = "#332A42"},
StartLogo2 = {fg = "#47A8C8"},
StartLogo20 = {fg = "#2D2638"},
StartLogo3 = {fg = "#4C9CCF"},
StartLogo4 = {fg = "#528DDE"},
StartLogo5 = {fg = "#727CDA"},
StartLogo6 = {fg = "#866BD2"},
StartLogo7 = {fg = "#9459C9"},
StartLogo8 = {fg = "#9451B3"},
StartLogo9 = {fg = "#8E4D9C"},
--%% end alpha %%--
}) end
if cfg.plugins.blink then apply_colors({
--%% begin blink %%--
BlinkCmpKindClass = {fg = "#B381C5"},
BlinkCmpKindConstant = {fg = "#FFE261"},
BlinkCmpKindConstructor = {fg = "#EB64B9"},
BlinkCmpKindCopilot = {fg = "#FFE261"},
BlinkCmpKindEnum = {fg = "#B381C5"},
BlinkCmpKindEnumMember = {fg = "#B381C5"},
BlinkCmpKindEvent = {fg = "#B381C5"},
BlinkCmpKindField = {fg = "#74DFC4"},
BlinkCmpKindFunction = {fg = "#EB64B9"},
BlinkCmpKindInterface = {fg = "#B381C5"},
BlinkCmpKindKeyword = {fg = "#40B4C4"},
BlinkCmpKindMethod = {fg = "#EB64B9"},
BlinkCmpKindModule = {},
BlinkCmpKindOperator = {fg = "#74DFC4"},
BlinkCmpKindProperty = {fg = "#74DFC4"},
BlinkCmpKindReference = {fg = "#FFE261"},
BlinkCmpKindSnippet = {fg = "#7B6995"},
BlinkCmpKindStruct = {fg = "#B381C5"},
BlinkCmpKindText = {fg = "#91889B"},
BlinkCmpKindTypeParameter = {fg = "#B381C5"},
BlinkCmpKindUnit = {fg = "#B381C5"},
BlinkCmpKindValue = {fg = "#40B4C4"},
BlinkCmpKindVariable = {fg = "#FFFFFF"},
BlinkCmpLabel = {fg = "#91889B", bg = "NONE"},
BlinkCmpLabelDeprecated = {fg = "#7B6995", bg = "NONE", strikethrough = true},
BlinkCmpLabelMatch = {fg = "#EB64B9", bg = "NONE"},
BlinkCmpMenu = {link = "Float"},
BlinkCmpDocBorder = {link = "FloatBorder"},
BlinkCmpMenuBorder = {link = "FloatBorder"},
BlinkCmpSignatureHelpBorder = {link = "FloatBorder"},
--%% end blink %%--
}) end
if cfg.plugins.cmp then apply_colors({
--%% begin cmp %%--
CmpItemAbbr = {fg = "#91889B", bg = "NONE"},
CmpItemAbbrDeprecated = {fg = "#7B6995", bg = "NONE", strikethrough = true},
CmpItemAbbrMatch = {fg = "#EB64B9", bg = "NONE"},
CmpItemAbbrMatchFuzzy = {fg = "#EB64B9", bg = "NONE"},
CmpItemKindClass = {fg = "#B381C5"},
CmpItemKindConstant = {fg = "#FFE261"},
CmpItemKindConstructor = {fg = "#EB64B9"},
CmpItemKindCopilot = {fg = "#FFE261"},
CmpItemKindEnum = {fg = "#B381C5"},
CmpItemKindEnumMember = {fg = "#B381C5"},
CmpItemKindEvent = {fg = "#B381C5"},
CmpItemKindField = {fg = "#74DFC4"},
CmpItemKindFunction = {fg = "#EB64B9"},
CmpItemKindInterface = {fg = "#B381C5"},
CmpItemKindKeyword = {fg = "#40B4C4"},
CmpItemKindMethod = {fg = "#EB64B9"},
CmpItemKindModule = {},
CmpItemKindOperator = {fg = "#74DFC4"},
CmpItemKindProperty = {fg = "#74DFC4"},
CmpItemKindReference = {fg = "#FFE261"},
CmpItemKindSnippet = {fg = "#7B6995"},
CmpItemKindStruct = {fg = "#B381C5"},
CmpItemKindText = {fg = "#91889B"},
CmpItemKindTypeParameter = {fg = "#B381C5"},
CmpItemKindUnit = {fg = "#B381C5"},
CmpItemKindValue = {fg = "#40B4C4"},
CmpItemKindVariable = {fg = "#FFFFFF"},
CmpItemMenu = {fg = "#7B6995", bg = "NONE"},
--%% end cmp %%--
}) end
if cfg.plugins.git then apply_colors({
--%% begin git %%--
GitGutterAdd = {fg = "#40B4C4"},
GitGutterChange = {fg = "#74DFC4"},
GitGutterDelete = {fg = "#EB64B9"},
GitSignsAdd = {fg = "#40B4C4"},
GitSignsChange = {fg = "#74DFC4"},
GitSignsDelete = {fg = "#EB64B9"},
gitblame = {link = "VirtualText"},
--%% end git %%--
}) end
if cfg.plugins.lsp then apply_colors({
--%% begin lsp %%--
DiagnosticError = {fg = "#FF3E7B"},
DiagnosticHint = {fg = "#91889B"},
DiagnosticInfo = {fg = "#40B4C4"},
DiagnosticOk = {fg = "#74DFC4"},
DiagnosticUnderlineError = {sp = "#FF3E7B", undercurl = true},
DiagnosticUnderlineHint = {sp = "#91889B", undercurl = true},
DiagnosticUnderlineInfo = {sp = "#40B4C4", undercurl = true},
DiagnosticUnderlineOk = {sp = "#74DFC4", undercurl = true},
DiagnosticUnderlineWarn = {sp = "#FFB85B", undercurl = true},
DiagnosticVirtualTextError = {fg = "#FF3E7B", bg = "#51001E"},
DiagnosticVirtualTextHint = {fg = "#91889B", bg = "#27232C"},
DiagnosticVirtualTextInfo = {fg = "#40B4C4", bg = "#0A2E33"},
DiagnosticVirtualTextOk = {fg = "#74DFC4", bg = "#18372F"},
DiagnosticVirtualTextWarn = {fg = "#FFB85B", bg = "#442B00"},
DiagnosticWarn = {fg = "#FFB85B"},
LspInfoBorder = {link = "FloatBorder"},
LspReferenceRead = {bg = "#3F334A"},
LspReferenceText = {bg = "#3F334A"},
LspReferenceWrite = {bg = "#3F334A"},
LspCodeLensSeparator = {link = "VirtualText"},
LspSignatureActiveParameter = {link = "VirtualText"},
["@lsp.type.enumMember"] = {link = "@constant"},
["@lsp.type.decorator"] = {link = "@function"},
["@lsp.type.function"] = {link = "@function"},
["@lsp.type.macro"] = {link = "@macro"},
["@lsp.type.method"] = {link = "@method"},
["@lsp.type.namespace"] = {link = "@namespace"},
["@lsp.type.parameter"] = {link = "@parameter"},
["@lsp.type.property"] = {link = "@property"},
["@lsp.type.struct"] = {link = "@structure"},
["@lsp.type.class"] = {link = "@type"},
["@lsp.type.enum"] = {link = "@type"},
["@lsp.type.interface"] = {link = "@type"},
["@lsp.type.type"] = {link = "@type"},
["@lsp.type.variable"] = {link = "@variable"},
--%% end lsp %%--
}) end
if cfg.plugins.mini_pick then apply_colors({
--%% begin mini_pick %%--
MiniPickPreviewLine = {link = "CursorLine"},
MiniPickBorder = {link = "FloatBorder"},
MiniPickBorderText = {link = "FloatTitle"},
MiniPickBorderBusy = {fg = "#FFB85B", bg = "#241E2B"},
MiniPickCursor = {fg = "#EB64B9", bg = "#241E2B"},
MiniPickMatchCurrent = {bg = "#392E42", bold = true},
MiniPickMatchRanges = {fg = "#EB64B9", bold = true},
MiniPickPreviewRegion = {fg = "#EB64B9", bg = "#3F334A", bold = true},
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
NeoTreeTitleBar = {link = "FloatTitle"},
NeoTreeGitAdded = {fg = "#40B4C4", bold = true},
NeoTreeGitConflict = {fg = "#FF3E7B", bold = true},
NeoTreeGitDeleted = {fg = "#EB64B9", bold = true},
NeoTreeGitIgnored = {fg = "#7B6995", bold = true},
NeoTreeGitModified = {fg = "#74DFC4", bold = true},
NeoTreeGitUntracked = {fg = "#91889B"},
--%% end neotree %%--
}) end
if cfg.plugins.obsidian then apply_colors({
--%% begin obsidian %%--
ObsidianDone = {fg = "#91889B"},
ObsidianExtLinkIcon = {fg = "#91889B"},
ObsidianHighlightText = {bg = "#EB64B9"},
ObsidianRefText = {fg = "#B4DCE7", underline = true},
ObsidianRightArrow = {fg = "#FFB85B"},
ObsidianTag = {fg = "#74DFC4", italic = true},
ObsidianTilde = {fg = "#FF3E7B"},
ObsidianTodo = {fg = "#40B4C4"},
--%% end obsidian %%--
}) end
if cfg.plugins.occurrence then apply_colors({
--%% begin occurrence %%--
OccurrenceCurrent = {reverse = true, underline = true},
OccurrenceMark = {underline = true},
OccurrenceMatch = {link = "Visual"},
--%% end occurrence %%--
}) end
if cfg.plugins.package_info then apply_colors({
--%% begin package_info %%--
PackageInfoOutdatedVersion = {fg = "#FF3E7B"},
PackageInfoUpToDateVersion = {},
--%% end package_info %%--
}) end
if cfg.plugins.snacks then apply_colors({
--%% begin snacks %%--
SnacksDashboardDesc = {link = "Normal"},
SnacksDashboardFooter = {fg = "#7B6995"},
SnacksDashboardHeader = {fg = "#40B4C4"},
SnacksDashboardHeader1 = {fg = "#40B4C4"},
SnacksDashboardHeader10 = {fg = "#85498A"},
SnacksDashboardHeader11 = {fg = "#7C457B"},
SnacksDashboardHeader12 = {fg = "#763B72"},
SnacksDashboardHeader13 = {fg = "#693B6F"},
SnacksDashboardHeader14 = {fg = "#5E3A6B"},
SnacksDashboardHeader15 = {fg = "#533865"},
SnacksDashboardHeader16 = {fg = "#49355D"},
SnacksDashboardHeader17 = {fg = "#413255"},
SnacksDashboardHeader18 = {fg = "#392F4B"},
SnacksDashboardHeader19 = {fg = "#332A42"},
SnacksDashboardHeader2 = {fg = "#47A8C8"},
SnacksDashboardHeader20 = {fg = "#2D2638"},
SnacksDashboardHeader3 = {fg = "#4C9CCF"},
SnacksDashboardHeader4 = {fg = "#528DDE"},
SnacksDashboardHeader5 = {fg = "#727CDA"},
SnacksDashboardHeader6 = {fg = "#866BD2"},
SnacksDashboardHeader7 = {fg = "#9459C9"},
SnacksDashboardHeader8 = {fg = "#9451B3"},
SnacksDashboardHeader9 = {fg = "#8E4D9C"},
SnacksDashboardIcon = {fg = "#B4DCE7"},
SnacksPickerGitStatusAdded = {fg = "#40B4C4"},
SnacksPickerGitStatusDeleted = {fg = "#EB64B9"},
SnacksPickerGitStatusModified = {fg = "#74DFC4"},
SnacksPickerGitStatusStaged = {fg = "#40B4C4"},
SnacksPickerGitStatusUnmerged = {fg = "#FF3E7B"},
--%% end snacks %%--
}) end
if cfg.plugins.space then apply_colors({
--%% begin space %%--
ExtraWhitespace = {bg = "#FF3E7B"},
MiniTrailspace = {link = "ExtraWhitespace"},
SnacksIndentBlank = {link = "ExtraWhitespace"},
IblIndent = {fg = "#332A41"},
IblWhitespace = {link = "IblIndent"},
IndentBlanklineChar = {link = "IblIndent"},
SnacksIndent = {link = "IblIndent"},
IblScope = {fg = "#56486A"},
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
TelescopePromptPrefix = {fg = "#EB64B9", bg = "#241E2B"},
TelescopeSelection = {link = "Visual"},
--%% end telescope %%--
}) end
