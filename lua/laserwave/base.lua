--                  (&&&&&&&&&&&&&&&&&&&(
--             ,&&&&&&&&&&&&&&&&&&&&&&&&&&&&&,
--          &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
--        &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
--      &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
--    &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
--   &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
--  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
--
-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
--
-- *%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*
--
--   ###################################################
--
--     ###############################################
--       ###########################################
--
--            #######(#############(##########(
--
--       _      _   ___ ___ _____      _____   _____
--      | |    /_\ / __| __| _ \ \    / /_\ \ / / __|
--      | |__ / _ \\__ \ _||   /\ \/\/ / _ \ V /| _|
--      |____/_/ \_\___/___|_|_\ \_/\_/_/ \_\_/ |___|
--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")

local palette = require("laserwave.palette")

-- stylua: ignore start
local NONE      = "NONE"

local FG        = palette.FG
local BG        = palette.BG
local GUTTER    = palette.GUTTER
local HIGHLIGHT = palette.HIGHLIGHT

local VARIABLE  = palette.VARIABLE
local COMMENT   = palette.COMMENT
local FUNCTION  = palette.FUNCTION
local OPERATOR  = palette.OPERATOR
local CONSTANT  = palette.CONSTANT
local KEYWORD   = palette.KEYWORD
local NUMBER    = palette.NUMBER
local TYPE      = palette.TYPE
local STRING    = palette.STRING

local ERROR     = palette.ERROR
local WARNING   = palette.WARNING
local IGNORE    = palette.IGNORE
local INFO      = palette.INFO
local HINT      = palette.HINT

local ADD       = palette.ADD
local DELETE    = palette.DELETE
local CHANGE    = palette.CHANGE
local CONFLICT  = palette.CONFLICT

local NORMAL    = palette.NORMAL
local INSERT    = palette.INSERT
local COMMAND   = palette.COMMAND
local VISUAL    = palette.VISUAL
local REPLACE   = palette.REPLACE
local INACTIVE  = palette.INACTIVE
-- stylua: ignore end

-- LSP/Linters mistakenly show `undefined global` errors in the spec.
---@diagnostic disable: undefined-global
--stylua: ignore
local theme = lush(function()
  return {
    Bold         { gui = "bold" },
    Inverse      { gui = "reverse" },
    Italic       { gui = "italic" },
    Underlined   { gui = "underline" }, -- (preferred) text that stands out, HTML links
    Undercurl    { gui = "undercurl" }, -- squigglies

    ModeNormal   { fg = NORMAL },
    ModeInsert   { fg = INSERT },
    ModeCommand  { fg = COMMAND },
    ModeVisual   { fg = VISUAL },
    ModeReplace  { fg = REPLACE },
    ModeInactive { fg = INACTIVE },

    -- The following are all the Neovim default highlight groups from the docs
    -- as of 0.5.0-nightly-446, to aid your theme creation. Your themes should
    -- probably style all of these at a bare minimum.
    --
    -- Referenced/linked groups must come before being referenced/lined,
    -- so the order shown ((mostly) alphabetical) is likely
    -- not the order you will end up with.
    --
    -- You can uncomment these and leave them empty to disable any
    -- styling for that group (meaning they mostly get styled as Normal)
    -- or leave them commented to apply vims default colouring or linking.

    -- Many highlights link to these
    Comment      { fg = COMMENT }, -- any comment
    Cursor       { Inverse }, -- character under the cursor
    CursorLine   { bg = VISUAL.mix(BG, 90)  }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    DiffAdd      { bg = ADD.mix(BG, 75) }, -- diff mode: Added line |diff.txt|
    DiffChange   { bg = ADD.mix(BG, 75) }, -- diff mode: Changed line |diff.txt|
    DiffDelete   { bg = DELETE.mix(BG, 75) }, -- diff mode: Deleted line |diff.txt|
    DiffText     { bg = CHANGE.mix(BG, 75)  }, -- diff mode: Changed text within a changed line |diff.txt|
    NonText      { fg = IGNORE }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    VirtualText  { fg = IGNORE, bg = BG.lighten(5) }, -- I made this one up.
    Normal       { fg = FG, bg = BG }, -- normal text
    NormalNC     { Normal }, -- Normal text in not-current windows.
    NormalFloat  { Normal, bg = BG.darken(10)  }, -- Normal text in floating windows.
    FloatBorder  { fg = HIGHLIGHT, bg = BG.darken(10) }, -- Border of floating windows.
    FloatTitle   { NormalFloat, fg = HIGHLIGHT }, -- Title of floating windows (Non-standard).
    StatusLine   { bg = BG.darken(10), fg = FG }, -- status line of current window
    StatusLineNC { bg = BG.darken(10), fg = IGNORE }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine      { StatusLine }, -- tab pages line, not active tab page label
    TabLineFill  { NormalFloat }, -- tab pages line, where there are no labels
    TabLineSel   { fg = BG, bg = HIGHLIGHT }, -- tab pages line, active tab page label
    Visual       { bg = VISUAL.mix(BG, 75)  }, -- Visual mode selection
    LineNr       { fg = GUTTER }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.

    -- These highlights are mostly links and variations of the above
    ColorColumn  { CursorLine }, -- used for the columns set with 'colorcolumn'
    Conceal      { Normal, fg = Normal.bg }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    lCursor      { Cursor }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM     { Cursor }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { CursorLine }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    Directory    { fg = KEYWORD }, -- directory names (and other special names in listings)
    EndOfBuffer  { Conceal }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor   { }, -- cursor in a focused terminal
    -- TermCursorNC { }, -- cursor in an unfocused terminal
    ErrorMsg     { fg = ERROR }, -- error messages on the command line
    VertSplit    { fg = HIGHLIGHT }, -- the column separating vertically split windows
    Folded       { LineNr, bg = IGNORE.mix(BG, 75)  }, -- line used for closed folds
    FoldColumn   { Normal, fg = LineNr.fg }, -- 'foldcolumn'
    SignColumn   { Normal, fg = LineNr.fg }, -- column where |signs| are displayed
    IncSearch    { Inverse }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute   { Inverse }, -- |:substitute| replacement text highlighting
    CursorLineNr { CursorLine, fg = VISUAL }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    CursorLineFold { CursorLine, fg = VISUAL }, -- Like FoldColumn when 'cursorline' is set for the cursor line.
    CursorLineSign { CursorLine, fg = VISUAL }, -- Like SignColumn when 'cursorline' is set for the cursor line.
    MatchParen   { Bold, fg = HIGHLIGHT }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg      { NonText, gui = Bold.gui }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea      { NonText }, -- Area for messages and cmdline
    -- MsgSeparator {  }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg      { fg = INFO }, -- |more-prompt|
    VisualNOS    { Visual }, -- Visual mode selection when vim is "Not Owning the Selection".
    Pmenu        { NormalFloat }, -- Popup menu: normal item.
    PmenuSel     { Visual }, -- Popup menu: selected item.
    PmenuSbar    { NormalFloat }, -- Popup menu: scrollbar.
    PmenuThumb   { bg = IGNORE }, -- Popup menu: Thumb of the scrollbar.
    Question     { MoreMsg }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine { Bold, bg = Visual.bg }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search       { bg = VISUAL, fg = BG }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    SpecialKey   { Conceal }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad     { Undercurl, sp = ERROR }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap     { Undercurl, sp = WARNING }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal   { Undercurl, sp = INFO }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare    { Undercurl, sp = HINT }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    Title        { Bold, fg = KEYWORD }, -- titles for output from ":set all", ":autocmd" etc.
    WarningMsg   { fg = WARNING }, -- warning messages
    Whitespace   { fg = IGNORE }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu     { Visual }, -- current match in 'wildmenu' completion

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant      { fg = CONSTANT }, -- (preferred) any constant
    String        { fg = STRING }, --   a string constant: "this is a string"
    Character     { fg = OPERATOR }, --  a character constant: 'c', '\n'
    Number        { fg = NUMBER }, --   a number constant: 234, 0xff
    Boolean       { fg = CONSTANT }, --  a boolean constant: TRUE, false
    Float         { Number }, --    a floating point constant: 2.3e10

    Identifier     { fg = VARIABLE }, -- (preferred) any variable name
    Function       { fg = FUNCTION }, -- function name (also: methods for classes)

    Statement      { fg = KEYWORD }, -- (preferred) any statement
    -- Conditional    { }, --  if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --    case, default, etc.
    Operator       { fg = OPERATOR }, -- "sizeof", "+", "*", etc.
    Keyword        { fg = KEYWORD }, --  any other keyword
    -- Exception      { }, --  try, catch, throw

    PreProc        { NonText }, -- (preferred) generic Preprocessor
    Include        { Statement }, --  preprocessor #include
    Define         { Statement }, --   preprocessor #define
    Macro          { Statement }, --    same as Define
    PreCondit      { Statement }, --  preprocessor #if, #else, #endif, etc.

    Type           { fg = TYPE }, -- (preferred) int, long, char, etc.
    -- StorageClass   { }, -- static, register, volatile, etc.
    -- Structure      { }, --  struct, union, enum, etc.
    -- Typedef        { }, --  A typedef

    Special        { Operator }, -- (preferred) any special symbol
    -- SpecialChar    { }, --  special character in a constant
    -- Tag            { }, --    you can use CTRL-] on this
    -- Delimiter      { }, --  character that needs attention
    -- SpecialComment { }, -- special things inside a comment
    -- Debug          { }, --    debugging statements

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error { fg = ERROR }, -- (preferred) any erroneous construct

    Todo { fg = CONSTANT }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!

    LspReferenceText            { Underlined, bg = Visual.bg }, -- used for highlighting "text" references
    LspReferenceRead            { Underlined, bg = Visual.bg }, -- used for highlighting "read" references
    LspReferenceWrite           { Underlined, bg = Visual.bg }, -- used for highlighting "write" references
    LspCodeLens                 { VirtualText }, -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    LspCodeLensSeparator        { VirtualText }, -- Used to color the seperator between two or more code lens.
    LspSignatureActiveParameter { VirtualText }, -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!

    DiagnosticError            { fg = ERROR }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn             { fg = WARNING }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo             { fg = INFO }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint             { fg = HINT }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticVirtualTextError { DiagnosticError, bg = DiagnosticError.fg.darken(75)  }, -- Used for "Error" diagnostic virtual text.
    DiagnosticVirtualTextWarn  { DiagnosticWarn, bg = DiagnosticWarn.fg.darken(75)  }, -- Used for "Warn" diagnostic virtual text.
    DiagnosticVirtualTextInfo  { DiagnosticInfo, bg = DiagnosticInfo.fg.darken(75)  }, -- Used for "Info" diagnostic virtual text.
    DiagnosticVirtualTextHint  { DiagnosticHint, bg = DiagnosticHint.fg.darken(75)  }, -- Used for "Hint" diagnostic virtual text.
    DiagnosticUnderlineError   { Undercurl, sp = ERROR }, -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn    { Undercurl, sp = WARNING }, -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo    { Undercurl, sp = INFO }, -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint    { Undercurl, sp = HINT }, -- Used to underline "Hint" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.

    -- See :h nvim-treesitter-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- TSAttribute          { } , -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
    -- TSBoolean            { } , -- Boolean literals: `True` and `False` in Python.
    -- TSCharacter          { } , -- Character literals: `'a'` in C.
    -- TSComment            { } , -- Line comments and block comments.
    -- TSConditional        { } , -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
    -- TSConstant           { } , -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
    TSConstBuiltin       { Constant } , -- Built-in constant values: `nil` in Lua.
    TSConstMacro         { Constant } , -- Constants defined by macros: `NULL` in C.
    TSConstructor        { Function } , -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
    -- TSError              { } , -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
    -- TSException          { } , -- Exception related keywords: `try`, `except`, `finally` in Python.
    -- TSField              { } , -- Object and struct fields.
    -- TSFloat              { } , -- Floating-point number literals.
    -- TSFunction           { } , -- Function calls and definitions.
    -- TSFuncBuiltin        { } , -- Built-in functions: `print` in Lua.
    -- TSFuncMacro          { } , -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
    -- TSInclude            { } , -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
    TSKeyword            { Keyword } , -- Keywords that don't fit into other categories.
    -- TSKeywordFunction    { } , -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
    -- TSKeywordOperator    { } , -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
    -- TSKeywordReturn      { } , -- Keywords like `return` and `yield`.
    -- TSLabel              { } , -- GOTO labels: `label:` in C, and `::label::` in Lua.
    -- TSMethod             { } , -- Method calls and definitions.
    -- TSNamespace          { } , -- Identifiers referring to modules and namespaces.
    -- TSNone               { } , -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
    -- TSNumber             { } , -- Numeric literals that don't fit into other categories.
    -- TSOperator           { } , -- Binary or unary operators: `+`, and also `->` and `*` in C.
    -- TSParameter          { } , -- Parameters of a function.
    -- TSParameterReference { } , -- References to parameters of a function.
    -- TSProperty           { } , -- Same as `TSField`.
    TSPunctDelimiter     { NonText }, -- Punctuation delimiters: Periods, commas, semicolons, etc.
    TSPunctBracket       { NonText }, -- Brackets, braces, parentheses, etc.
    TSPunctSpecial       { NonText }, -- Special punctuation that doesn't fit into the previous categories.
    -- TSRepeat             { } , -- Keywords related to loops: `for`, `while`, etc.
    -- TSString             { } , -- String literals.
    TSStringRegex        { fg = KEYWORD }, -- Regular expression literals.
    TSStringEscape       { fg = NUMBER }, -- Escape characters within a string: `\n`, `\t`, etc.
    TSStringSpecial      { NonText }, -- Strings with special meaning that don't fit into the previous categories.
    -- TSSymbol             { } , -- Identifiers referring to symbols or atoms.
    -- TSTag                { } , -- Tags like HTML tag names.
    -- TSTagAttribute       { } , -- HTML tag attributes.
    -- TSTagDelimiter       { } , -- Tag delimiters like `<` `>` `/`.
    -- TSText               { } , -- Non-structured text. Like text in a markup language.
    -- TSStrong             { } , -- Text to be represented in bold.
    -- TSEmphasis           { } , -- Text to be represented with emphasis.
    -- TSUnderline          { } , -- Text to be represented with an underline.
    -- TSStrike             { } , -- Strikethrough text.
    -- TSTitle              { } , -- Text that is part of a title.
    -- TSLiteral            { } , -- Literal or verbatim text.
    -- TSURI                { } , -- URIs like hyperlinks or email addresses.
    -- TSMath               { } , -- Math environments like LaTeX's `$ ... $`
    -- TSTextReference      { } , -- Footnotes, text references, citations, etc.
    -- TSEnvironment        { } , -- Text environments of markup languages.
    -- TSEnvironmentName    { } , -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
    -- TSNote               { } , -- Text representation of an informational note.
    -- TSWarning            { } , -- Text representation of a warning note.
    -- TSDanger             { } , -- Text representation of a danger note.
    -- TSType               { } , -- Type (and class) definitions and annotations.
    TSTypeBuiltin        { Type } , -- Built-in types: `i32` in Rust.
    TSVariable           { Normal }, -- Variable names that don't fit into other categories.
    TSVariableBuiltin    { Constant } , -- Variable names defined by the language: `this` or `self` in Javascript.

    -- Highlights from nvim-treesitter-refactor
    -- TSDefinition         { } , -- Highlights the definition of the symbol under cursor.
    -- TSDefinitionUsage    { } , -- Highlights usages of the symbol under cursor.
    -- TSCurrentScope       { } , -- Highlights the current scope of the cursor position.


    -- Plugins

    -- alpha (dashboard) header
    StartLogo1            { fg = INFO.mix(HIGHLIGHT, 0).mix(BG, 0) },
    StartLogo2            { fg = INFO.mix(HIGHLIGHT, 10).mix(BG, 5) },
    StartLogo3            { fg = INFO.mix(HIGHLIGHT, 20).mix(BG, 10) },
    StartLogo4            { fg = INFO.mix(HIGHLIGHT, 30).mix(BG, 15) },
    StartLogo5            { fg = INFO.mix(HIGHLIGHT, 40).mix(BG, 20) },
    StartLogo6            { fg = INFO.mix(HIGHLIGHT, 50).mix(BG, 25) },
    StartLogo7            { fg = INFO.mix(HIGHLIGHT, 60).mix(BG, 30) },
    StartLogo8            { fg = INFO.mix(HIGHLIGHT, 70).mix(BG, 35) },
    StartLogo9            { fg = INFO.mix(HIGHLIGHT, 80).mix(BG, 40) },
    StartLogo10           { fg = INFO.mix(HIGHLIGHT, 90).mix(BG, 45) },
    StartLogo11           { fg = INFO.mix(HIGHLIGHT, 100).mix(BG, 50) },
    StartLogo12           { fg = ERROR.mix(INFO, 10).mix(BG, 55) },
    StartLogo13           { fg = ERROR.mix(INFO, 20).mix(BG, 60) },
    StartLogo14           { fg = ERROR.mix(INFO, 30).mix(BG, 65) },
    StartLogo15           { fg = ERROR.mix(INFO, 40).mix(BG, 70) },
    StartLogo16           { fg = ERROR.mix(INFO, 50).mix(BG, 75) },
    StartLogo17           { fg = ERROR.mix(INFO, 60).mix(BG, 80) },
    StartLogo18           { fg = ERROR.mix(INFO, 70).mix(BG, 85) },
    StartLogo19           { fg = ERROR.mix(INFO, 80).mix(BG, 90) },
    StartLogo20           { fg = ERROR.mix(INFO, 90).mix(BG, 95) },

    -- gitblame
    gitblame             { VirtualText },

    -- ExtraWhitespace
    ExtraWhitespace      { bg = ERROR },

    -- Treesitter Context
    TreesitterContext           { bg = VISUAL.mix(BG, 90) },
    TreesitterContextLineNumber { fg = VISUAL, bg = VISUAL.mix(BG, 90) },

    -- Telescope
    TelescopeNormal       { NormalFloat },
    TelescopeSelection    { Visual },
    TelescopePromptNormal { NormalFloat },
    TelescopePromptPrefix { NormalFloat, fg = HIGHLIGHT },
    TelescopePromptBorder { FloatBorder },
    TelescopePromptTitle  { FloatTitle },
    TelescopeBorder       { FloatBorder },
    TelescopePreviewTitle { FloatTitle },
    TelescopeResultsTitle { FloatTitle },

    -- diff
    diffAdded       { fg = ADD },
    diffRemoved     { fg = DELETE },
    diffChanged     { fg = CHANGE },
    diffOldFile     { fg = DELETE },
    diffNewFile     { fg = ADD },
    diffFile        { fg = CONSTANT },
    diffLine        { fg = COMMENT },
    diffIndexLine   { fg = COMMENT },

    -- indent-blankline
    IndentBlanklineChar  { fg = IGNORE.darken(50) },
    IndentBlanklineContextChar  { fg = HIGHLIGHT },

    -- mini.indentscope
    MiniIndentscopeSymbol { fg = HIGHLIGHT },

    -- GitGutter
    GitGutterAdd         { fg = ADD }, -- diff mode: Added line |diff.txt|
    GitGutterChange      { fg = CHANGE }, -- diff mode: Changed line |diff.txt|
    GitGutterDelete      { fg = DELETE }, -- diff mode: Deleted line |diff.txt|

    -- GitSigns
    GitSignsAdd          { fg = ADD }, -- diff mode: Added line |diff.txt|
    GitSignsChange       { fg = CHANGE }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete       { fg = DELETE }, -- diff mode: Deleted line |diff.txt|

    -- NeoVim
    healthError     { fg = ERROR },
    healthSuccess   { fg = OPERATOR },
    healthWarning   { fg = WARNING },

    -- Cmp
    CmpItemAbbr              { fg = HINT, bg = NONE },
    CmpItemAbbrDeprecated    { NonText, bg = NONE, gui = "strikethrough" },
    CmpItemAbbrMatch         { fg = HIGHLIGHT, bg = NONE },
    CmpItemAbbrMatchFuzzy    { fg = HIGHLIGHT, bg = NONE },
    CmpItemMenu              { fg = INACTIVE, bg = NONE },

    CmpItemKindText          { fg = COMMENT },
    CmpItemKindKeyword       { Keyword },
    CmpItemKindVariable      { Identifier },
    CmpItemKindConstant      { Constant },
    CmpItemKindReference     { Constant },
    CmpItemKindValue         { Statement },
    CmpItemKindFunction      { Function },
    CmpItemKindMethod        { Function },
    CmpItemKindConstructor   { Function },
    CmpItemKindClass         { Type },
    CmpItemKindInterface     { Type },
    CmpItemKindStruct        { Type },
    CmpItemKindEvent         { Type },
    CmpItemKindEnum          { Type },
    CmpItemKindUnit          { Type },
    CmpItemKindModule        { PreProc },
    CmpItemKindProperty      { Operator },
    CmpItemKindField         { Operator },
    CmpItemKindTypeParameter { Type },
    CmpItemKindEnumMember    { Type },
    CmpItemKindOperator      { Operator },
    CmpItemKindSnippet       { NonText },

    -- NeoTree
    -- NeoTreeBufferNumber       {}, -- The buffer number shown in the buffers source.
    -- NeoTreeCursorLine         {}, -- |hl-CursorLine| override in Neo-tree window.
    -- NeoTreeDimText            {}, -- Greyed out text used in various places.
    -- NeoTreeDirectoryIcon      {}, -- Directory icon.
    -- NeoTreeDirectoryName      {}, -- Directory name.
    -- NeoTreeDotfile            {}, -- Used for icons and names when dotfiles are filtered.
    -- NeoTreeFileIcon           {}, -- File icon, when not overridden by devicons.
    -- NeoTreeFileName           {}, -- File name, when not overwritten by another status.
    -- NeoTreeFileNameOpened     {}, -- File name when the file is open. Not used yet.
    -- NeoTreeFilterTerm         {}, -- The filter term, as displayed in the root node.
    NeoTreeFloatBorder        { FloatBorder }, -- The border for pop-up windows.
    NeoTreeFloatTitle         { FloatTitle }, -- Used for the title text of pop-ups when the border-style is set to another style than "NC". This is derived from NeoTreeFloatBorder.
    -- NeoTreeTitleBar           { FloatTitle }, -- Used for the title bar of pop-ups, when the border-style is set to "NC". This is derived from NeoTreeFloatBorder.
    NeoTreeGitAdded           { Bold, fg = ADD }, -- File name when the git status is added.
    NeoTreeGitConflict        { Bold, fg = CONFLICT }, -- File name when the git status is conflict.
    NeoTreeGitDeleted         { Bold, fg = DELETE }, -- File name when the git status is deleted.
    NeoTreeGitIgnored         { Bold, fg = IGNORE }, -- File name when the git status is ignored.
    NeoTreeGitModified        { Bold, fg = CHANGE }, -- File name when the git status is modified.
    NeoTreeGitUntracked       { fg = HINT }, -- File name when the git status is untracked.
    -- NeoTreeGitUnstaged        {}, -- Used for git unstaged symbol.
    -- NeoTreeGitStaged          {}, -- Used for git staged symbol.
    -- NeoTreeHiddenByName       {}, -- Used for icons and names when `hide_by_name` is used.
    -- NeoTreeIndentMarker       {}, -- The style of indentation markers (guides). By default, the "Normal" highlight is used.
    -- NeoTreeExpander           {}, -- Used for collapsed/expanded icons.
    -- NeoTreeNormal             {}, -- |hl-Normal| override in Neo-tree window.
    -- NeoTreeNormalNC           {}, -- |hl-NormalNC| override in Neo-tree window.
    -- NeoTreeSignColumn         {}, -- |hl-SignColumn| override in Neo-tree window.
    -- NeoTreeStatusLine         {}, -- |hl-StatusLine| override in Neo-tree window.
    -- NeoTreeStatusLineNC       {}, -- |hl-StatusLineNC| override in Neo-tree window.
    -- NeoTreeVertSplit          {}, -- |hl-VertSplit| override in Neo-tree window.
    -- NeoTreeWinSeparator       {}, -- |hl-WinSeparator| override in Neo-tree window.
    -- NeoTreeEndOfBuffer        {}, -- |hl-EndOfBuffer| override in Neo-tree window.
    -- NeoTreeRootName           {}, -- The name of the root node.
    -- NeoTreeSymbolicLinkTarget {}, -- Symbolic link target.
    -- NeoTreeWindowsHidden      {}, -- Used for icons and names that are hidden on Windows.
  }
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap
