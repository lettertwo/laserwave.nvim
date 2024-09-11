-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")

local palette = require("laserwave.spec.palette")
local syntax = require("laserwave.spec.syntax")

---@diagnostic disable: undefined-global
--stylua: ignore
local treesitter = lush(function(injected)
  local sym = injected.sym
  return {
    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    -- sym"@text.literal"          { }, -- Comment
    -- sym"@text.reference"        { }, -- Identifier
    -- sym"@text.title"            { }, -- Title
    -- sym"@text.uri"              { }, -- Underlined
    -- sym"@text.underline"        { }, -- Underlined
    -- sym"@text.todo"             { }, -- Todo
    -- sym"@comment"               { }, -- Comment
    -- sym"@punctuation"           { }, -- Delimiter
    -- sym"@constant"              { }, -- Constant
    sym"@constant.builtin"      { syntax.Constant }, -- Special
    sym"@constant.macro"        { syntax.Constant }, -- Define
    -- sym"@define"                { }, -- Define
    -- sym"@macro"                 { }, -- Macro
    -- sym"@string"                { }, -- String
    sym"@string.escape"         { fg = palette.NUMBER }, -- SpecialChar
    sym"@string.regex"          { fg = palette.KEYWORD }, -- Regular expression literals.
    -- sym"@string.special"        { }, -- SpecialChar
    -- sym"@character"             { }, -- Character
    -- sym"@character.special"     { }, -- SpecialChar
    -- sym"@number"                { }, -- Number
    -- sym"@boolean"               { }, -- Boolean
    -- sym"@float"                 { }, -- Float
    -- sym"@function"              { }, -- Function
    -- sym"@function.builtin"      { }, -- Special
    -- sym"@function.macro"        { }, -- Macro
    -- sym"@parameter"             { }, -- Identifier
    -- sym"@method"                { }, -- Function
    -- sym"@field"                 { }, -- Identifier
    sym"@property"              { fg = palette.KEYWORD }, -- Identifier
    sym"@property.class"        { syntax.Function }, -- e.g., css .class
    sym"@property.id"           { syntax.Constant }, -- e.g., css #id
    sym"@constructor"           { syntax.Function }, -- Special
    -- sym"@conditional"           { }, -- Conditional
    -- sym"@repeat"                { }, -- Repeat
    -- sym"@label"                 { }, -- Label
    -- sym"@operator"              { }, -- Operator
    -- sym"@keyword"               { }, -- Keyword
    sym"@keyword.operator"     { syntax.Operator }, -- Keyword
    sym"@keyword.export"        { syntax.Constant }, -- e.g., js export
    sym"@keyword.jsdoc"         { syntax.Type }, -- jsdoc
    -- sym"@exception"             { }, -- Exception
    -- sym"@variable"              { }, -- Identifier
    sym"@variable.builtin"      { syntax.Constant }, -- Variable names defined by the language: `this` or `self` in Javascript.
    -- sym"@type"                  { }, -- Type
    -- sym"@type.definition"       { }, -- Typedef
    sym"@type.builtin"          { syntax.Constant }, -- Built-in types: `i32` in Rust.
    sym"@type.tag"              { syntax.Constant }, -- css tag names.
    -- sym"@storageclass"          { }, -- StorageClass
    -- sym"@structure"             { }, -- Structure
    -- sym"@namespace"             { }, -- Identifier
    -- sym"@include"               { }, -- Include
    -- sym"@preproc"               { }, -- PreProc
    -- sym"@debug"                 { }, -- Debug
    -- sym"@tag"                   { }, -- Tag
    sym"@tag.attribute"         { syntax.Attribute }, -- HTML tag attributes.
    sym"@tag.delimiter"         { syntax.Delimiter }, -- Tag delimiters like `<` `>` `/`.
    sym"@punctuation"           { syntax.Punctuation }, -- Punctuation
    sym"@punctuation.delimiter" { syntax.Delimiter }, -- Punctuation delimiters: Periods, commas, semicolons, etc.
    -- sym"@punctuation.bracket"   { }, -- Brackets, braces, parentheses, etc.
    -- sym"@punctuation.special"   { }, -- Special punctuation that doesn't fit into the previous categories.

    sym "@text.diff.delete"     { fg = palette.DELETE },
    sym "@text.diff.add"        { fg = palette.ADD },
    sym "@text.diff.change"     { fg = palette.CHANGE },

    -- Treesitter Context
    TreesitterContext           { bg = palette.BG.darken(10) },
    TreesitterContextLineNumber { bg = palette.BG.darken(10), fg = palette.BG.mix(palette.VISUAL, 50) },
    TreesitterContextSeparator        { fg = palette.BG.darken(50) },
  }
end)

return treesitter
