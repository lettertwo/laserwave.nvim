local palette = require("laserwave.palette")

---@type laserwave.Groups
--stylua: ignore
local ui = {
  -- The following are the Neovim (as of 0.12.0-dev-1472+g869e55f2aa) highlight
  -- groups, mostly used for styling UI elements.
  -- Comment them out and add your own properties to override the defaults.
  -- An empty definition `{}` will clear all styling, leaving elements looking
  -- like the 'Normal' group.
  --
  -- See :h highlight-groups

  Normal   = { fg = palette.FG, bg = palette.BG }, -- Normal text
  NormalNC = "Normal", -- Normal text in non-current windows.

  NonText = { fg = palette.IGNORE }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
  ModeMsg = { fg = palette.IGNORE, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
  MsgArea = "NonText", -- Area for messages and cmdline

  Conceal      = { fg = palette.FG, bg = palette.BG }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
  EndOfBuffer  = "Conceal", -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
  SpecialKey   = "Conceal", -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
  -- MsgSeparator = {}, -- Separator for scrolled messages, `msgsep` flag of 'display'

  Visual       = { bg = palette.VISUAL }, -- Visual mode selection
  VisualNOS    = "Visual", -- Visual mode selection when vim is "Not Owning the Selection".
  WildMenu     = "Visual", -- Current match in 'wildmenu' completion
  QuickFixLine = { bg = palette.VISUAL, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.

  Cursor     = { fg = palette.FG, bg = palette.BG_CURSOR, reverse = true }, -- Character under the cursor
  CurSearch  = { reverse = true }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
  CursorIM   = "Cursor", -- Like Cursor, but used when in IME mode |CursorIM|
  lCursor    = "Cursor", -- Character under the cursor when |language-mapping| is used (see 'guicursor')
  -- TermCursor = {}, -- Cursor in a focused terminal

  CursorLine     = { bg = palette.BG_CURSOR_LINE }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
  ColorColumn    = "CursorLine", -- Columns set with 'colorcolumn'
  CursorColumn   = "CursorLine", -- Screen-column at the cursor, when 'cursorcolumn' is set.
  CursorLineFold = { bg = palette.BG_CURSOR_LINE, fg = palette.VISUAL }, -- Like FoldColumn when 'cursorline' is set for the cursor line.
  CursorLineNr   = { bg = palette.BG_CURSOR_LINE, fg = palette.CURSOR_LINE_NUM }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
  CursorLineSign = { bg = palette.BG_CURSOR_LINE, fg = palette.VISUAL }, -- Like SignColumn when 'cursorline' is set for the cursor line.

  LineNr      = { fg = palette.LINE_NUM }, --Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
  -- LineNrAbove = {}, -- Line number for when the 'relativenumber' option is set, above the cursor line
  -- LineNrBelow = {}, -- Line number for when the 'relativenumber' option is set, below the cursor line

  Folded     = { fg = palette.LINE_NUM, bg = palette.BG_FOLD }, -- Line used for closed folds
  FoldColumn = { fg = palette.LINE_NUM, bg = palette.BG }, -- 'foldcolumn'
  SignColumn = { fg = palette.LINE_NUM, bg = palette.BG }, -- Column where |signs| are displayed

  NormalFloat        = { fg = palette.FG, bg = palette.BG_FLOAT }, -- Normal text in floating windows.
  Pmenu              = "NormalFloat", -- Popup menu: normal item.
  PmenuSel           = "Visual", -- Popup menu: selected item.
  PmenuSbar          = "NormalFloat", -- Popup menu: scrollbar.
  PmenuThumb         = { bg = palette.IGNORE }, -- Popup menu: Thumb of the scrollbar.
  -- PmenuKind          = {}, -- Popup menu: Normal item "kind"
  -- PmenuKindSel       = {}, -- Popup menu: Selected item "kind"
  -- PmenuExtra         = {}, -- Popup menu: Normal item "extra text"
  -- PmenuExtraSel      = {}, -- Popup menu: Selected item "extra text"
  -- PmenuBorder        = {}, -- Popup menu: border of popup menu.
  -- PmenuMatch         = {}, -- Popup menu: Matched text in normal item.  Combined with
  -- PmenuMatchSel      = {}, -- Popup menu: Matched text in selected item.  Combined with
  -- PmenuShadow        = {}, -- Popup menu: blended areas when 'pumborder' is "shadow".
  -- PmenuShadowThrough = {}, -- Popup menu: shadow corners when 'pumborder' is "shadow".

  -- PreInsert     = {}, -- Text inserted when "preinsert" is in 'completeopt'.
  -- ComplHint     = {}, -- Virtual text of the currently selected completion.
  -- ComplHintMore = {}, -- The additional information of the virtual text.
  -- ComplMatchIns = {}, -- Matched text of the currently inserted completion.

  -- SnippetTabstop       = {}, -- Tabstops in snippets. |vim.snippet|
  -- SnippetTabstopActive = {}, -- The currently active tabstop. |vim.snippet|

  FloatTitle         = { fg = palette.HIGHLIGHT, bg = palette.BG_FLOAT }, -- Title of floating windows (Non-standard).
  FloatBorder        = { fg = palette.HIGHLIGHT, bg = palette.BG_FLOAT }, -- Border of floating windows.
  -- FloatFooter        = {}, -- Footer of floating windows.
  -- FloatShadow        = {}, -- Blended areas when border is "shadow".
  -- FloatShadowThrough = {}, -- Shadow corners when border is "shadow".

  IncSearch    = "CurSearch", -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
  Search       = { bg = palette.BG_SEARCH }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
  Substitute   = "CurSearch", -- |:substitute| replacement text highlighting

  Add      = { fg = palette.ADD },
  Change   = { fg = palette.CHANGE },
  Delete   = { fg = palette.DELETE },

  DiffAdd      = { fg = palette.ADD, bg = palette.BG_ADD }, -- Diff mode: Added line |diff.txt|
  DiffChange   = { fg = palette.ADD, bg = palette.BG_ADD }, -- Diff mode: Changed line |diff.txt|
  DiffDelete   = { fg = palette.DELETE, bg = palette.BG_DELETE }, -- Diff mode: Deleted line |diff.txt|
  DiffText     = { fg = palette.CHANGE, bg = palette.BG_CHANGE  }, -- Diff mode: Changed text within a changed line |diff.txt|
  DiffTextAdd  = { fg = palette.ADD, bg = palette.BG_ADD }, -- Diff mode: Added text within a changed line.  Linked to |hl-DiffText| by default. |diff.txt|

  Directory    = { fg = palette.KEYWORD }, -- Directory names (and other special names in listings)
  ErrorMsg     = { fg = palette.ERROR }, -- Error messages on the command line
  MatchParen   = { bold = true, fg = palette.HIGHLIGHT }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
  SpellBad     = { undercurl = true, sp = palette.ERROR }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
  SpellCap     = { undercurl = true, sp = palette.WARN }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
  SpellLocal   = { undercurl = true, sp = palette.INFO }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
  SpellRare    = { undercurl = true, sp = palette.HINT }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
  Title        = { bold = true, fg = palette.KEYWORD }, -- Titles for output from ":set all", ":autocmd" etc.
  WarningMsg   = { fg = palette.WARN }, -- Warning messages
  Whitespace   = { fg = palette.IGNORE }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
  MoreMsg      = { fg = palette.INFO }, -- |more-prompt|
  Question     = { fg = palette.INFO }, -- |hit-enter| prompt and yes/no questions
  OkMsg        = { fg = palette.OK }, -- Success messages
  -- StderrMsg    = {}, -- Messages in stderr from shell commands.
  -- StdoutMsg    = {}, -- Messages in stdout from shell commands.

  StatusLine   = { bg = palette.BG_FLOAT, fg = palette.COMMENT }, -- Status line of current window
  StatusLineNC = { bg = palette.BG_FLOAT, fg = palette.IGNORE }, -- Status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.

  -- StatusLineTerm   = {}, -- Status line of |terminal| window.
  -- StatusLineTermNC = {}, -- Status line of non-current |terminal| windows.

  TabLine      = { bg = palette.BG_FLOAT, fg = palette.FG }, -- Tab pages line, not active tab page label
  TabLineSel   = { fg = palette.BG, bg = palette.HIGHLIGHT }, -- Tab pages line, active tab page label
  TabLineFill  = { fg = palette.FG, bg = palette.BG_FLOAT }, -- Tab pages line, where there are no labels

  WinBar       = { bg = palette.BG_FLOAT, fg = palette.FG }, -- Window bar of current window
  WinBarNC     = { bg = palette.BG_FLOAT, fg = palette.IGNORE }, -- Window bar of not-current windows

  WinSeparator  = { fg = palette.HIGHLIGHT }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.

  -- NeoVim
  healthError     = { fg = palette.ERROR },
  healthSuccess   = { fg = palette.OK },
  healthWarning   = { fg = palette.WARN },

  -- Modes
  ModeNormal         = { fg = palette.NORMAL },
  ModeInsert         = { fg = palette.INSERT },
  ModeCommand        = { fg = palette.COMMAND },
  ModeVisual         = { fg = palette.VISUAL },
  ModeReplace        = { fg = palette.REPLACE },
  ModeSelect         = { fg = palette.VISUAL },
  ModeTerminal       = { fg = palette.COMMAND },
  ModeTerminalNormal = { fg = palette.COMMAND },

  -- LSP
  LspReferenceText            = { bg = palette.BG_VISUAL }, -- Used for highlighting "text" references
  LspReferenceRead            = { bg = palette.BG_VISUAL }, -- Used for highlighting "read" references
  LspReferenceWrite           = { bg = palette.BG_VISUAL }, -- Used for highlighting "write" references
  LspCodeLensSeparator        = { fg = palette.IGNORE, bg = palette.BG_VISUAL }, -- Used to color the seperator between two or more code lens.
  LspSignatureActiveParameter = { fg = palette.IGNORE, bg = palette.BG_VISUAL }, -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.
  LspInfoBorder               = "FloatBorder",

  -- Diagnostics
  DiagnosticError            = { fg = palette.ERROR },   -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
  DiagnosticWarn             = { fg = palette.WARN }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
  DiagnosticInfo             = { fg = palette.INFO },    -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
  DiagnosticHint             = { fg = palette.HINT },    -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
  DiagnosticOk               = { fg = palette.OK },      -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
  DiagnosticVirtualTextError = { fg = palette.ERROR, bg = palette.BG_ERROR },     -- Used for "Error" diagnostic virtual text.
  DiagnosticVirtualTextWarn  = { fg = palette.WARN, bg = palette.BG_WARN }, -- Used for "Warn" diagnostic virtual text.
  DiagnosticVirtualTextInfo  = { fg = palette.INFO, bg = palette.BG_INFO },       -- Used for "Info" diagnostic virtual text.
  DiagnosticVirtualTextHint  = { fg = palette.HINT, bg = palette.BG_HINT },       -- Used for "Hint" diagnostic virtual text.
  DiagnosticVirtualTextOk    = { fg = palette.OK, bg = palette.BG_OK },           -- Used for "Ok" diagnostic virtual text.
  DiagnosticUnderlineError   = { undercurl = true, sp = palette.ERROR },   -- Used to underline "Error" diagnostics.
  DiagnosticUnderlineWarn    = { undercurl = true, sp = palette.WARN }, -- Used to underline "Warn" diagnostics.
  DiagnosticUnderlineInfo    = { undercurl = true, sp = palette.INFO },    -- Used to underline "Info" diagnostics.
  DiagnosticUnderlineHint    = { undercurl = true, sp = palette.HINT },    -- Used to underline "Hint" diagnostics.
  DiagnosticUnderlineOk      = { undercurl = true, sp = palette.OK },      -- Used to underline "Ok" diagnostics.
  -- DiagnosticFloatingError    = { }, -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
  -- DiagnosticFloatingWarn     = { }, -- Used to color "Warn" diagnostic messages in diagnostics float.
  -- DiagnosticFloatingInfo     = { }, -- Used to color "Info" diagnostic messages in diagnostics float.
  -- DiagnosticFloatingHint     = { }, -- Used to color "Hint" diagnostic messages in diagnostics float.
  -- DiagnosticFloatingOk       = { }, -- Used to color "Ok" diagnostic messages in diagnostics float.
  -- DiagnosticSignError        = { }, -- Used for "Error" signs in sign column.
  -- DiagnosticSignWarn         = { }, -- Used for "Warn" signs in sign column.
  -- DiagnosticSignInfo         = { }, -- Used for "Info" signs in sign column.
  -- DiagnosticSignHint         = { }, -- Used for "Hint" signs in sign column.
  -- DiagnosticSignOk           = { }, -- Used for "Ok" signs in sign column.
}

return ui
