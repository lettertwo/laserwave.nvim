local hsluv = require("lush").hsluv

-- stylua: ignore start
---@class LaserwaveColors
local colors = {
  WHITE           = hsluv("#ffffff"), -- Foreground, Variables
  RAISIN_BLACK    = hsluv("#27212e"), -- Background
  OLD_LAVENDER    = hsluv("#91889b"), -- Comments, Hints
  HOT_PINK        = hsluv("#eb64B9"), -- Functions, Attributes, Highlighting
  PEARL_AQUA      = hsluv("#74dfc4"), -- Operators, Tags
  MUSTARD         = hsluv("#ffe261"), -- Builtins, Constants
  MAXIMUM_BLUE    = hsluv("#40b4c4"), -- Keywords, Properties, Info
  AFRICAN_VIOLET  = hsluv("#b381c5"), -- Numbers, Types
  POWDER_BLUE     = hsluv("#b4dce7"), -- Strings
  ROMAN_SILVER    = hsluv("#7b6995"), -- Gutter, Ignored
  VIVID_RASPBERRY = hsluv("#ff3e7b"), -- Errors
  GARDENIA        = hsluv("#ffb85b"), -- Warnings
}

---@class LaserwaveSemantics
local semantics = {
  FG        = colors.WHITE,
  BG        = colors.RAISIN_BLACK,
  GUTTER    = colors.ROMAN_SILVER,
  HIGHLIGHT = colors.HOT_PINK,

  VARIABLE  = colors.WHITE,
  COMMENT   = colors.OLD_LAVENDER,
  FUNCTION  = colors.HOT_PINK,
  OPERATOR  = colors.PEARL_AQUA,
  CONSTANT  = colors.MUSTARD,
  KEYWORD   = colors.MAXIMUM_BLUE,
  NUMBER    = colors.AFRICAN_VIOLET,
  TYPE      = colors.AFRICAN_VIOLET,
  STRING    = colors.POWDER_BLUE,

  ERROR     = colors.VIVID_RASPBERRY,
  WARNING   = colors.GARDENIA,
  IGNORE    = colors.ROMAN_SILVER,
  INFO      = colors.MAXIMUM_BLUE,
  HINT      = colors.OLD_LAVENDER,

  ADD       = colors.MAXIMUM_BLUE,
  DELETE    = colors.HOT_PINK,
  CHANGE    = colors.GARDENIA,
  CONFLICT  = colors.VIVID_RASPBERRY,

  NORMAL    = colors.MAXIMUM_BLUE,
  INSERT    = colors.PEARL_AQUA,
  COMMAND   = colors.MUSTARD,
  VISUAL    = colors.AFRICAN_VIOLET,
  REPLACE   = colors.HOT_PINK,
  INACTIVE  = colors.ROMAN_SILVER,
}
-- stylua: ignore end

---@class LaserwaveColors : LaserwaveSemantics
---@field colors LaserwaveColors
---@field semantics LaserwaveSemantics
local M = {
  colors = colors,
  semantics = semantics,
}
M = vim.tbl_extend("error", M, colors, semantics)
return M
