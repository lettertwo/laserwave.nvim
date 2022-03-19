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

-- for usage guides, see :h lush or :LushRunTutorial

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`
local lush = require("lush")
local hsluv = lush.hsluv -- https://www.hsluv.org/comparison/


-- stylua: ignore start
local NONE     = "NONE"

local WHITE    = hsluv("#ffffff") -- White           - Foreground, Variables
local BLACK    = hsluv("#27212e") -- Raisin Black    - Background
local GRAY     = hsluv("#91889b") -- Old Lavender    - Comments, Hints
local RED      = hsluv("#eb64B9") -- Hot Pink        - Functions, Attributes, Highlighting
local GREEN    = hsluv("#74dfc4") -- Pearl Aqua      - Operators, Tags
local YELLOW   = hsluv("#ffe261") -- Mustard         - Builtins, Constants
local BLUE     = hsluv("#40b4c4") -- Maximum Blue    - Keywords, Properties, Info
local MAGENTA  = hsluv("#b381c5") -- African Violet  - Numbers, Types
local CYAN     = hsluv("#b4dce7") -- Powder Blue     - Strings

local ERROR    = hsluv("#ff3e7b") -- Vivid Raspberry - Errors
local WARNING  = hsluv("#ffb85b") -- Gardenia        - Warnings
local IGNORE   = hsluv("#7b6995") -- Roman Silver    - Gutter, Ignored
local INFO     = BLUE
local HINT     = GRAY

local CHANGE   = GREEN
local ADD      = BLUE
local DELETE   = MAGENTA
local CONFLICT = RED
-- stylua: ignore end

-- LSP/Linters mistakenly show `undefined global` errors in the spec.
---@diagnostic disable: undefined-global
--stylua: ignore
local theme = lush(function()
  -- TODO: make theme configurable
  local config = {
    commentStyle = "italic",
    functionStyle = "NONE",
    variableStyle = "NONE",
    keywordStyle = "italic",
    transparent = false,
  }

  return {
    Bold         { gui = "bold" },
    Inverse      { gui = "inverse" },
    Italic       { gui = "italic" },
    Underlined   { gui = "underline" }, -- (preferred) text that stands out, HTML links
    Undercurl    { gui = "undercurl" }, -- squigglies

    ModeNormal   { fg = BLUE },
    ModeInsert   { fg = GREEN },
    ModeCommand  { fg = YELLOW },
    ModeVisual   { fg = MAGENTA },
    ModeReplace  { fg = RED },
    ModeInactive { fg = IGNORE },

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
    Comment      { fg = GRAY, gui = config.commentStyle }, -- any comment
    Cursor       { Inverse }, -- character under the cursor
    CursorLine   { bg = BLACK.lighten(5)  }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    DiffAdd      { bg = ADD }, -- diff mode: Added line |diff.txt|
    DiffChange   { bg = CHANGE }, -- diff mode: Changed line |diff.txt|
    DiffDelete   { bg = DELETE }, -- diff mode: Deleted line |diff.txt|
    DiffText     { bg = DiffChange.bg.lighten(50)  }, -- diff mode: Changed text within a changed line |diff.txt|
    NonText      { fg = IGNORE }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal       { fg = WHITE, bg = config.transparent and NONE or BLACK }, -- normal text
    NormalNC     { Normal }, -- Normal text in not-current windows.
    NormalFloat  { Normal, bg = BLACK.darken(7)  }, -- Normal text in floating windows.
    StatusLine   { bg = BLACK, fg = RED }, -- status line of current window
    StatusLineNC { bg = BLACK, fg = GRAY }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine      { StatusLine }, -- tab pages line, not active tab page label
    TabLineFill  { NormalFloat }, -- tab pages line, where there are no labels
    TabLineSel   { fg =BLACK, bg = RED }, -- tab pages line, active tab page label
    Visual       { bg = IGNORE.darken(50)  }, -- Visual mode selection

    -- These highlights are mostly links and variations of the above
    ColorColumn  { CursorLine }, -- used for the columns set with 'colorcolumn'
    Conceal      { Normal, fg = Normal.bg }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    lCursor      { Cursor }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM     { Cursor }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { CursorLine }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    Directory    { fg = BLUE }, -- directory names (and other special names in listings)
    EndOfBuffer  { Conceal }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    TermCursor   { Cursor }, -- cursor in a focused terminal
    TermCursorNC { Cursor }, -- cursor in an unfocused terminal
    ErrorMsg     { fg = ERROR }, -- error messages on the command line
    VertSplit    { fg = MAGENTA }, -- the column separating vertically split windows
    Folded       { NonText, bg = IGNORE.darken(50)  }, -- line used for closed folds
    FoldColumn   { Normal, fg = NonText.fg }, -- 'foldcolumn'
    SignColumn   { Normal, fg = NonText.fg }, -- column where |signs| are displayed
    IncSearch    { Inverse }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute   { Inverse }, -- |:substitute| replacement text highlighting
    LineNr       { NonText }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { CursorLine, fg = GRAY }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen   { Bold, fg = RED }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg      { NonText, gui = Bold.gui }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea      { NonText }, -- Area for messages and cmdline
    -- MsgSeparator {  }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg      { fg = BLUE }, -- |more-prompt|
    VisualNOS    { Visual }, -- Visual mode selection when vim is "Not Owning the Selection".
    Pmenu        { NormalFloat }, -- Popup menu: normal item.
    PmenuSel     { Visual }, -- Popup menu: selected item.
    PmenuSbar    { NormalFloat }, -- Popup menu: scrollbar.
    PmenuThumb   { bg = IGNORE }, -- Popup menu: Thumb of the scrollbar.
    Question     { MoreMsg }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine { Bold, bg = Visual.bg }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search       { bg = IGNORE, fg = BLACK }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    SpecialKey   { Conceal }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad     { Undercurl, sp = ERROR }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap     { Undercurl, sp = WARNING }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal   { Undercurl, sp = INFO }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare    { Undercurl, sp = HINT }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    Title        { Bold, fg = BLUE }, -- titles for output from ":set all", ":autocmd" etc.
    WarningMsg   { fg = WARNING }, -- warning messages
    Whitespace   { fg = IGNORE }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu     { Visual }, -- current match in 'wildmenu' completion

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant      { fg = YELLOW }, -- (preferred) any constant
    String        { fg = CYAN }, --   a string constant: "this is a string"
    Character     { String }, --  a character constant: 'c', '\n'
    Number        { fg = MAGENTA }, --   a number constant: 234, 0xff
    Boolean       { Number }, --  a boolean constant: TRUE, false
    Float         { Number }, --    a floating point constant: 2.3e10

    Identifier     { fg = WHITE, gui = config.variableStyle }, -- (preferred) any variable name
    Function       { fg = RED, gui = config.functionStyle }, -- function name (also: methods for classes)

    Statement      { fg = BLUE }, -- (preferred) any statement
    -- Conditional    { }, --  if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --    case, default, etc.
    Operator       { fg = GREEN }, -- "sizeof", "+", "*", etc.
    Keyword        { fg = BLUE, gui = config.keywordStyle }, --  any other keyword
    -- Exception      { }, --  try, catch, throw

    PreProc        { fg = GREEN }, -- (preferred) generic Preprocessor
    -- Include        { }, --  preprocessor #include
    -- Define         { }, --   preprocessor #define
    -- Macro          { }, --    same as Define
    -- PreCondit      { }, --  preprocessor #if, #else, #endif, etc.

    Type           { fg = MAGENTA }, -- (preferred) int, long, char, etc.
    -- StorageClass   { }, -- static, register, volatile, etc.
    -- Structure      { }, --  struct, union, enum, etc.
    -- Typedef        { }, --  A typedef

    Special        { NonText }, -- (preferred) any special symbol
    -- SpecialChar    { }, --  special character in a constant
    -- Tag            { }, --    you can use CTRL-] on this
    -- Delimiter      { }, --  character that needs attention
    -- SpecialComment { }, -- special things inside a comment
    -- Debug          { }, --    debugging statements

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error { fg = ERROR }, -- (preferred) any erroneous construct

    Todo { fg = YELLOW }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!

    LspReferenceText            { Underlined, bg = Visual.bg }, -- used for highlighting "text" references
    LspReferenceRead            { Underlined, bg = Visual.bg }, -- used for highlighting "read" references
    LspReferenceWrite           { Underlined, bg = Visual.bg }, -- used for highlighting "write" references
    LspCodeLens                 { NonText }, -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    LspCodeLensSeparator        { NonText }, -- Used to color the seperator between two or more code lens.
    LspSignatureActiveParameter { NonText }, -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

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
    -- TSConstBuiltin       { } , -- Built-in constant values: `nil` in Lua.
    -- TSConstMacro         { } , -- Constants defined by macros: `NULL` in C.
    -- TSConstructor        { } , -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
    -- TSError              { } , -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
    -- TSException          { } , -- Exception related keywords: `try`, `except`, `finally` in Python.
    -- TSField              { } , -- Object and struct fields.
    -- TSFloat              { } , -- Floating-point number literals.
    -- TSFunction           { } , -- Function calls and definitions.
    -- TSFuncBuiltin        { } , -- Built-in functions: `print` in Lua.
    -- TSFuncMacro          { } , -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
    -- TSInclude            { } , -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
    -- TSKeyword            { } , -- Keywords that don't fit into other categories.
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
    TSStringRegex        { fg = BLUE }, -- Regular expression literals.
    TSStringEscape       { fg = MAGENTA }, -- Escape characters within a string: `\n`, `\t`, etc.
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
    -- TSTypeBuiltin        { } , -- Built-in types: `i32` in Rust.
    TSVariable           { gui = config.variableStyle }, -- Variable names that don't fit into other categories.
    -- TSVariableBuiltin    { } , -- Variable names defined by the language: `this` or `self` in Javascript.

    -- Plugins

    -- gitblame
    gitblame             { NonText },

    -- LspTrouble
    LspTroubleText       { fg = RED },
    LspTroubleCount      { fg = RED },
    LspTroubleNormal     { fg = RED },

    -- ExtraWhitespace
    ExtraWhitespace      { bg = ERROR },

    -- Telescope
    TelescopeBorder      { NormalFloat, fg = RED },
    TelescopeNormal      { NormalFloat },
  }
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap
