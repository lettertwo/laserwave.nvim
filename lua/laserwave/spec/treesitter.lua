local palette = require("laserwave.palette")

-- Tree-Sitter syntax groups.
--
-- See :h treesitter-highlight-groups
--
-- Tree-Sitter groups are defined with an "@" symbol
---@type laserwave.Spec
--stylua: ignore
local treesitter = {
  -- Treesitter Context
  -- TODO: exact to its own plugin
  TreesitterContext           = { bg = palette.BG_FLOAT },
  TreesitterContextLineNumber = { bg = palette.BG_FLOAT, fg = palette.CURSOR_LINE_NUM },
  TreesitterContextSeparator  = { fg = palette.BG_FLOAT },

  -- Treesitter groups linked to builtin highlight groups
  ["@annotation"]               = "PreProc",
  ["@attribute"]                = "Attribute", -- attribute annotations (e.g. Python decorators, Rust lifetimes)
  ["@boolean"]                  = "Boolean", -- boolean literals
  ["@character"]                = "Character", -- character literals
  ["@comment"]                  = "Comment", -- line and block comments
  ["@constant"]                 = "Constant", -- constant identifiers
  ["@diff.delta"]               = "DiffText", -- changed text (for diff files)
  ["@diff.minus"]               = "DiffDelete", -- deleted text (for diff files)
  ["@diff.plus"]                = "DiffAdd", -- added text (for diff files)
  ["@function"]                 = "Function", -- function definitions
  ["@keyword"]                  = "Keyword", -- keywords not fitting into specific categories
  ["@keyword.conditional"]      = "Conditional", -- keywords related to conditionals (e.g. `if`, `else`)
  ["@keyword.debug"]            = "Debug", -- keywords related to debugging
  ["@keyword.directive"]        = "PreProc", -- various preprocessor directives and shebangs
  ["@keyword.directive.define"] = "Define", -- preprocessor definition directives
  ["@keyword.exception"]        = "Error", -- keywords related to exceptions (e.g. `throw`, `catch`)
  ["@keyword.import"]           = "Include", -- keywords for including or exporting modules (e.g. `import`, `from` in Python)
  ["@label"]                    = "Label", -- `GOTO` and other labels (e.g. `label:` in C), including heredoc labels
  ["@markup.quote"]             = "String", -- block quotes
  ["@markup.raw"]               = "String", -- literal or verbatim text (e.g. inline code)
  ["@module"]                   = "Include", -- modules or namespaces
  ["@number"]                   = "Number", -- numeric literals
  ["@operator"]                 = "Operator", -- symbolic operators (e.g. `+`, `*`)
  ["@property"]                 = "Variable", -- the key in key/value pairs
  ["@punctuation"]              = "Punctuation", -- Punctuation
  ["@punctuation.delimiter"]    = "Delimiter", -- delimiters (e.g. `;`, `.`, `,`)
  ["@string"]                   = "String", -- string literals
  ["@string.special"]           = "Special", -- other special strings (e.g. dates)
  ["@tag"]                      = "Label", -- XML-style tag names (e.g. in XML, HTML, etc.)
  ["@tag.attribute"]            = "Attribute", -- XML-style tag attributes
  ["@tag.delimiter"]            = "Delimiter", -- XML-style tag delimiters
  ["@type"]                     = "Type", -- type or class definitions and annotations
  ["@variable"]                 = "Identifier", -- various variable names

  -- Treesitter custom highlights
  ["@character.special"]     = { fg = palette.KEYWORD }, -- special characters (e.g. wildcards)
  ["@comment.error"]         = { fg = palette.ERROR }, -- error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED`)
  ["@comment.hint"]          = { fg = palette.HINT },
  ["@comment.info"]          = { fg = palette.INFO },
  ["@comment.note"]          = { fg = palette.HINT }, -- note-type comments (e.g. `NOTE`, `INFO`, `XXX`)
  ["@comment.todo"]          = { fg = palette.TODO }, -- todo-type comments (e.g. `TODO`, `WIP`)
  ["@comment.warning"]       = { fg = palette.WARN }, -- warning-type comments (e.g. `WARNING`, `FIX`, `HACK`)
  ["@markup.heading"]        = { bold = true }, -- headings, titles (including markers)
  ["@markup.heading.1"]      = { fg = palette.gradient.Step1, bold = true }, -- top-level heading
  ["@markup.heading.2"]      = { fg = palette.gradient.Step3, bold = true }, -- section heading
  ["@markup.heading.3"]      = { fg = palette.gradient.Step5, bold = true }, -- subsection heading
  ["@markup.heading.4"]      = { fg = palette.gradient.Step7, bold = true }, -- and so on
  ["@markup.heading.5"]      = { fg = palette.gradient.Step9, bold = true }, -- and so forth
  ["@markup.heading.6"]      = { fg = palette.gradient.Step11, bold = true }, -- six levels ought to be enough for anybody
  ["@markup.italic"]         = { italic = true }, -- italic text
  ["@markup.list"]           = { fg = palette.OPERATOR }, -- list markers
  ["@markup.list.checked"]   = { fg = palette.HINT }, -- checked todo-style list markers
  ["@markup.list.unchecked"] = { fg = palette.TODO }, -- unchecked todo-style list markers
  ["@markup.strikethrough"]  = { strikethrough = true }, -- struck-through text
  ["@markup.strong"]         = { bold = true }, -- bold text
  ["@markup.underline"]      = { underline = true }, -- underlined text (only for literal underline markup!)
  ["@none"]                  = {},
  ["@string.escape"]         = { fg = palette.NUMBER }, -- escape sequences
  ["@string.regexp"]         = { fg = palette.KEYWORD }, -- regular expressions
  ["@string.special.url"]    = { fg = palette.OPERATOR, underline = true }, -- URIs (e.g. hyperlinks)
  ["@structure"]             = { fg = palette.KEYWORD },

  -- Specific Treesitter groups mapped to more general ones
  ["@attribute.builtin"]           = "@constant", -- builtin annotations (e.g. `@property` in Python)
  ["@comment.documentation"]       = "@comment", -- comments documenting code
  ["@constant.builtin"]            = "@constant", -- built-in constant values
  ["@constant.macro"]              = "@constant", -- constants defined by the preprocessor
  ["@constructor"]                 = "@function", -- constructor calls and definitions
  ["@function.builtin"]            = "@constant", -- built-in functions
  ["@function.call"]               = "@function", -- function calls
  ["@function.macro"]              = "@function.builtin", -- preprocessor macros
  ["@function.method"]             = "@function", -- method definitions
  ["@function.method.call"]        = "@function.method", -- method calls
  ["@keyword.conditional.ternary"] = "@keyword.conditional", -- ternary operator (e.g. `?`, `:`)
  ["@keyword.coroutine"]           = "@keyword", -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
  ["@keyword.export"]              = "@constant", -- e.g., js export
  ["@keyword.function"]            = "@keyword", -- keywords that define a function (e.g. `func` in Go, `def` in Python)
  ["@keyword.jsdoc"]               = "@type", -- jsdoc
  ["@keyword.modifier"]            = "@keyword", -- keywords modifying other constructs (e.g. `const`, `static`, `public`)
  ["@keyword.operator"]            = "@operator", -- operators that are English words (e.g. `and`, `or`)
  ["@keyword.repeat"]              = "@keyword", -- keywords related to loops (e.g. `for`, `while`)
  ["@keyword.return"]              = "@keyword", -- keywords like `return` and `yield`
  ["@keyword.type"]                = "@type", -- keywords describing namespaces and composite types (e.g. `struct`, `enum`)
  ["@macro"]                       = "@constant",
  ["@markup.link"]                 = "@string.special.url", -- text references, footnotes, citations, etc.
  ["@markup.link.label"]           = "@markup.link", -- link, reference descriptions
  ["@markup.link.url"]             = "@markup.link", -- URL-style links
  ["@markup.math"]                 = "@number", -- math environments (e.g. `$ ... $` in LaTeX)
  ["@markup.raw.block"]            = "@markup.raw", -- literal or verbatim text as a stand-alone block
  ["@method"]                      = "@function.method",
  ["@module.builtin"]              = "@constant", -- built-in modules or namespaces
  ["@namespace"]                   = "@type",
  ["@namespace.builtin"]           = "@constant",
  ["@number.float"]                = "@number", -- floating-point number literals
  ["@parameter"]                   = "@variable",
  ["@property.class"]              = "@constructor", -- e.g., css .class
  ["@property.id"]                 = "@constant", -- e.g., css #id
  ["@punctuation.bracket"]         = "@punctuation", -- brackets (e.g. `()`, `{}`, `[]`)
  ["@punctuation.special"]         = "@punctuation", -- special symbols (e.g. `{}` in string interpolation)
  ["@string.documentation"]        = "@string", -- string documenting code (e.g. Python docstrings)
  ["@string.special.path"]         = "@string.special", -- filenames
  ["@string.special.symbol"]       = "@string.special", -- symbols or atoms
  ["@tag.builtin"]                 = "@constant", -- builtin tag names (e.g. HTML5 tags)
  ["@type.builtin"]                = "@constant", -- built-in types
  ["@type.definition"]             = "@type", -- identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)
  ["@type.tag"]                    = "@constant", -- css tag names.
  ["@variable.builtin"]            = "@constant", -- built-in variable names (e.g. `this`, `self`)
  ["@variable.member"]             = "@none", -- object and struct fields
  ["@variable.parameter"]          = "@parameter", -- parameters of a function
  ["@variable.parameter.builtin"]  = "@constant", -- special parameters (e.g. `_`, `it`)
}

return treesitter
