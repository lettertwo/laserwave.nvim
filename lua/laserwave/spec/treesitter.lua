local palette = require("laserwave.palette")

---@type laserwave.Spec
--stylua: ignore
local treesitter = {
  -- Tree-Sitter syntax groups.
  --
  -- See :h treesitter-highlight-groups
  --
  -- Tree-Sitter groups are defined with an "@" symbol

  ["@constant.builtin"]      = "Constant", -- Special
  ["@constant.macro"]        = "Constant", -- Define
  ["@string.escape"]         = { fg = palette.NUMBER }, -- SpecialChar
  ["@string.regex"]          = { fg = palette.KEYWORD }, -- Regular expression literals.
  ["@property"]              = { fg = palette.KEYWORD }, -- Identifier
  ["@property.class"]        = "Function", -- e.g., css .class
  ["@property.id"]           = "Constant", -- e.g., css #id
  ["@constructor"]           = "Function", -- Special
  ["@keyword.operator"]      = "Operator", -- Keyword
  ["@keyword.export"]        = "Constant", -- e.g., js export
  ["@keyword.jsdoc"]         = "Type", -- jsdoc
  ["@variable.builtin"]      = "Constant", -- Variable names defined by the language: `this` or `self` in Javascript.
  ["@type.builtin"]          = "Constant", -- Built-in types: `i32` in Rust.
  ["@type.tag"]              = "Constant", -- css tag names.
  ["@tag.attribute"]         = "Attribute", -- HTML tag attributes.
  ["@tag.delimiter"]         = "Delimiter", -- Tag delimiters like `<` `>` `/`.
  ["@punctuation"]           = "Punctuation", -- Punctuation
  ["@punctuation.delimiter"] = "Delimiter", -- Punctuation delimiters: Periods, commas, semicolons, etc.

  ["@text.diff.delete"]      = { fg = palette.DELETE },
  ["@text.diff.add"]         = { fg = palette.ADD },
  ["@text.diff.change"]      = { fg = palette.CHANGE },

  -- Treesitter Context
  TreesitterContext           = { bg = palette.BG_FLOAT },
  TreesitterContextLineNumber = { bg = palette.BG_FLOAT, fg = palette.CURSOR_LINE_NUM },
  TreesitterContextSeparator  = { fg = palette.BG_FLOAT },
}

return treesitter
