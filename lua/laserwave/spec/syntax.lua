local palette = require("laserwave.palette")

---@type laserwave.Spec
--stylua: ignore
local syntax = {
  -- Common vim syntax groups used for all kinds of code and markup.
  -- Commented-out groups should chain up to their preferred (*) group
  -- by default.
  --
  -- See :h group-name
  --
  -- Uncomment and edit if you want more specific syntax highlighting.

  Comment       = { fg = palette.COMMENT }, -- Any comment

  Constant      = { fg = palette.CONSTANT }, -- (*) Any constant
  String        = { fg = palette.STRING },   --   A string constant: "this is a string"
  Character     = { fg = palette.OPERATOR }, --   A character constant: 'c', '\n'
  Number        = { fg = palette.NUMBER },   --   A number constant: 234, 0xff
  Boolean       = { fg = palette.CONSTANT }, --   A boolean constant: TRUE, false
  Float         = { fg = palette.NUMBER },        --   A floating point constant: 2.3e10

  Identifier     = { fg = palette.VARIABLE }, -- (*) Any variable name
  Function       = { fg = palette.FUNCTION }, --   Function name (also: methods for classes)

  Statement      = { fg = palette.KEYWORD },  -- (*) Any statement
  -- Conditional    = {},            --   if, then, else, endif, switch, etc.
  -- Repeat         = {},            --   for, do, while, etc.
  -- Label          = {},            --   case, default, etc.
  Operator       = { fg = palette.OPERATOR }, --   "sizeof", "+", "*", etc.
  Keyword        = { fg = palette.KEYWORD, italic = true },  --   any other keyword
  -- Exception      = {},            --   try, catch, throw

  PreProc        = "NonText",   -- (*) Generic Preprocessor
  Include        = { fg = palette.KEYWORD, italic = true }, --   Preprocessor #include
  Define         = { fg = palette.FUNCTION }, --   Preprocessor #define
  Macro          = { fg = palette.FUNCTION }, --   Same as Define
  PreCondit      = { fg = palette.KEYWORD }, --   Preprocessor #if, #else, #endif, etc.

  Type           = { fg = palette.TYPE }, -- (*) int, long, char, etc.
  -- StorageClass   = {},        --   static, register, volatile, etc.
  -- Structure      = {},        --   struct, union, enum, etc.
  -- Typedef        = {},        --   A typedef

  Special        = { fg = palette.OPERATOR },    -- (*) Any special symbol
  -- SpecialChar    = {},          --   Special character in a constant
  Tag            = { fg = palette.OPERATOR },    --   You can use CTRL-] on this
  Delimiter      = { fg = palette.GUTTER }, --   Character that needs attention
  -- SpecialComment = {},          --   Special things inside a comment (e.g. '\n')
  -- Debug          = {},          --   Debugging statements

  Underlined  = { underline = true },     -- Text that stands out, HTML links

  Ignore      = { fg = palette.IGNORE },   -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)

  Error       = { fg = palette.ERROR },    -- Any erroneous construct

  Todo        = { fg = palette.CONSTANT }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

  Attribute   = { fg = palette.HIGHLIGHT },

  Punctuation = { fg = palette.GUTTER },
}

return syntax
