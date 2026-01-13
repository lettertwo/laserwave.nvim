local palette = require("laserwave.spec.palette")

---@type LaserwaveSpec
--stylua: ignore
local ui = {
  -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
  -- groups, mostly used for styling UI elements.
  -- Comment them out and add your own properties to override the defaults.
  -- An empty definition `{}` will clear all styling, leaving elements looking
  -- like the 'Normal' group.
  -- To be able to link to a group, it must already be defined, so you may have
  -- to reorder items as you go.
  --
  -- See :h highlight-groups

  Normal       = { fg = palette.FG, bg = palette.BG }, -- Normal text
  NormalNC     = "Normal", -- Normal text in non-current windows.

  NonText      = { fg = palette.IGNORE }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
  ModeMsg      = { fg = palette.IGNORE, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
  MsgArea      = "NonText", -- Area for messages and cmdline

  Conceal      = { fg = palette.FG, bg = palette.BG }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
  EndOfBuffer  = "Conceal", -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
  SpecialKey   = "Conceal", -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
  -- MsgSeparator = {}, -- Separator for scrolled messages, `msgsep` flag of 'display'

  Visual       = { bg = palette.VISUAL:mix(palette.BG, 80) }, -- Visual mode selection
  PmenuSel     = "Visual", -- Popup menu: selected item.
  VisualNOS    = "Visual", -- Visual mode selection when vim is "Not Owning the Selection".
  WildMenu     = "Visual", -- Current match in 'wildmenu' completion
  QuickFixLine = { bg = palette.VISUAL:mix(palette.BG, 80), bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.

  Cursor       = { fg = palette.FG, bg = palette.HIGHLIGHT:mix(palette.BG, 75), reverse = true }, -- Character under the cursor
  CurSearch    = { reverse = true }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
  CursorIM     = "Cursor", -- Like Cursor, but used when in IME mode |CursorIM|
  lCursor      = "Cursor", -- Character under the cursor when |language-mapping| is used (see 'guicursor')
  -- TermCursor   = {}, -- Cursor in a focused terminal
  -- TermCursorNC = {}, -- Cursor in an unfocused terminal

  CursorLine     = { bg = palette.VISUAL:mix(palette.BG, 85) }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
  ColorColumn    = "CursorLine", -- Columns set with 'colorcolumn'
  CursorColumn   = "CursorLine", -- Screen-column at the cursor, when 'cursorcolumn' is set.
  CursorLineFold = { bg = palette.VISUAL:mix(palette.BG, 85), fg = palette.VISUAL }, -- Like FoldColumn when 'cursorline' is set for the cursor line.
  CursorLineNr   = { bg = palette.VISUAL:mix(palette.BG, 85), fg = palette.FG:mix(palette.VISUAL, 50) }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
  CursorLineSign = { bg = palette.VISUAL:mix(palette.BG, 85), fg = palette.VISUAL }, -- Like SignColumn when 'cursorline' is set for the cursor line.

  LineNr       = { fg = palette.IGNORE:mix(palette.BG, 50) }, --Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
  -- LineNrAbove    = {}, -- Line number for when the 'relativenumber' option is set, above the cursor line
  -- LineNrBelow    = {}, -- Line number for when the 'relativenumber' option is set, below the cursor line

  Folded       = { fg = palette.IGNORE:mix(palette.BG, 50), bg = palette.IGNORE:mix(palette.BG, 75) }, -- Line used for closed folds
  FoldColumn   = { fg = palette.IGNORE:mix(palette.BG, 50), bg = palette.BG }, -- 'foldcolumn'
  SignColumn   = { fg = palette.IGNORE:mix(palette.BG, 50), bg = palette.BG }, -- Column where |signs| are displayed

  NormalFloat  = { fg = palette.FG, bg = palette.BG:darken(10) }, -- Normal text in floating windows.
  Pmenu        = "NormalFloat", -- Popup menu: normal item.
  PmenuSbar    = "NormalFloat", -- Popup menu: scrollbar.
  PmenuThumb   = { bg = palette.IGNORE }, -- Popup menu: Thumb of the scrollbar.
  -- PmenuKind      = {}, -- Popup menu: Normal item "kind"
  -- PmenuKindSel   = {}, -- Popup menu: Selected item "kind"
  -- PmenuExtra     = {}, -- Popup menu: Normal item "extra text"
  -- PmenuExtraSel  = {}, -- Popup menu: Selected item "extra text"

  FloatTitle   = { fg = palette.HIGHLIGHT, bg = palette.BG:darken(10) }, -- Title of floating windows (Non-standard).
  FloatBorder  = { fg = palette.HIGHLIGHT, bg = palette.BG:darken(10) }, -- Border of floating windows.

  IncSearch    = "CurSearch", -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
  Search       = { bg = palette.VISUAL:mix(palette.BG, 50) }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
  Substitute   = "CurSearch", -- |:substitute| replacement text highlighting

  Add      = { fg = palette.ADD },
  Change   = { fg = palette.CHANGE },
  Delete   = { fg = palette.DELETE },

  DiffAdd      = { fg = palette.ADD, bg = palette.ADD:mix(palette.BG, 90) }, -- Diff mode: Added line |diff.txt|
  DiffChange   = { fg = palette.ADD, bg = palette.ADD:mix(palette.BG, 90) }, -- Diff mode: Changed line |diff.txt|
  DiffDelete   = { fg = palette.DELETE, bg = palette.DELETE:mix(palette.BG, 90) }, -- Diff mode: Deleted line |diff.txt|
  DiffText     = { fg = palette.CHANGE, bg = palette.CHANGE:mix(palette.BG, 90)  }, -- Diff mode: Changed text within a changed line |diff.txt|

  Directory    = { fg = palette.KEYWORD }, -- Directory names (and other special names in listings)
  ErrorMsg     = { fg = palette.ERROR }, -- Error messages on the command line
  MatchParen   = { bold = true, fg = palette.HIGHLIGHT }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
  SpellBad     = { undercurl = true, sp = palette.ERROR }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
  SpellCap     = { undercurl = true, sp = palette.WARNING }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
  SpellLocal   = { undercurl = true, sp = palette.INFO }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
  SpellRare    = { undercurl = true, sp = palette.HINT }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
  Title        = { bold = true, fg = palette.KEYWORD }, -- Titles for output from ":set all", ":autocmd" etc.
  VirtualText  = { fg = palette.IGNORE, bg = palette.BG:lighten(5) }, -- I made this one up.
  WarningMsg   = { fg = palette.WARNING }, -- Warning messages
  Whitespace   = { fg = palette.IGNORE }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
  MoreMsg      = { fg = palette.INFO }, -- |more-prompt|
  Question     = { fg = palette.INFO }, -- |hit-enter| prompt and yes/no questions

  StatusLine   = { bg = palette.BG:darken(10), fg = palette.FG }, -- Status line of current window
  StatusLineNC = { bg = palette.BG:darken(10), fg = palette.IGNORE }, -- Status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.

  TabLine      = { bg = palette.BG:darken(10), fg = palette.FG }, -- Tab pages line, not active tab page label
  TabLineSel   = { fg = palette.BG, bg = palette.HIGHLIGHT }, -- Tab pages line, active tab page label
  TabLineFill  = { fg = palette.FG, bg = palette.BG:darken(10) }, -- Tab pages line, where there are no labels

  WinBar       = { bg = palette.BG:darken(10), fg = palette.FG }, -- Window bar of current window
  WinBarNC     = { bg = palette.BG:darken(10), fg = palette.IGNORE }, -- Window bar of not-current windows

  VertSplit    = { fg = palette.HIGHLIGHT }, -- Column separating vertically split windows
  WinSeparator  = { fg = palette.HIGHLIGHT }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.

  -- NeoVim
  healthError     = { fg = palette.ERROR },
  healthSuccess   = { fg = palette.OK },
  healthWarning   = { fg = palette.WARNING },

  -- Modes
  ModeNormal         = { fg = palette.NORMAL },
  ModeInsert         = { fg = palette.INSERT },
  ModeCommand        = { fg = palette.COMMAND },
  ModeVisual         = { fg = palette.VISUAL },
  ModeReplace        = { fg = palette.REPLACE },
  ModeSelect         = { fg = palette.VISUAL },
  ModeTerminal       = { fg = palette.COMMAND },
  ModeTerminalNormal = { fg = palette.COMMAND },
  NormalMode         = { bg = palette.NORMAL:mix(palette.BG, 75) },
  InsertMode         = { bg = palette.INSERT:mix(palette.BG, 75) },
  VisualMode         = { bg = palette.VISUAL:mix(palette.BG, 75) },
  CommandMode        = { bg = palette.COMMAND:mix(palette.BG, 75) },
  ReplaceMode        = { bg = palette.REPLACE:mix(palette.BG, 75) },
  SelectMode         = { bg = palette.VISUAL:mix(palette.BG, 75) },
  TerminalMode       = { bg = palette.COMMAND:mix(palette.BG, 75) },
  TerminalNormalMode = { bg = palette.COMMAND:mix(palette.BG, 75) },
}

return ui
