local flavor = require("laserwave.spec.flavor")

-- stylua: ignore start
---@class LaserwaveTerminal
local terminal = {
    BLACK          = flavor.OLD_LAVENDER,
    BRIGHT_BLACK   = flavor.AFRICAN_VIOLET,
    RED            = flavor.HOT_PINK,
    BRIGHT_RED     = flavor.VIVID_RASPBERRY,
    GREEN          = flavor.PEARL_AQUA,
    BRIGHT_GREEN   = flavor.PEARL_AQUA,
    YELLOW         = flavor.MUSTARD,
    BRIGHT_YELLOW  = flavor.GARDENIA,
    BLUE           = flavor.MAXIMUM_BLUE,
    BRIGHT_BLUE    = flavor.MAXIMUM_BLUE,
    MAGENTA        = flavor.AFRICAN_VIOLET,
    BRIGHT_MAGENTA = flavor.HOT_PINK,
    CYAN           = flavor.POWDER_BLUE,
    BRIGHT_CYAN    = flavor.POWDER_BLUE,
    WHITE          = flavor.WHITE,
    BRIGHT_WHITE   = flavor.WHITE,
}

---@class LaserwaveSemantics
local semantics = {
  FG        = flavor.WHITE,
  BG        = flavor.RAISIN_BLACK,
  GUTTER    = flavor.ROMAN_SILVER,
  HIGHLIGHT = flavor.HOT_PINK,

  VARIABLE  = flavor.WHITE,
  COMMENT   = flavor.OLD_LAVENDER,
  FUNCTION  = flavor.HOT_PINK,
  OPERATOR  = flavor.PEARL_AQUA,
  CONSTANT  = flavor.MUSTARD,
  KEYWORD   = flavor.MAXIMUM_BLUE,
  NUMBER    = flavor.AFRICAN_VIOLET,
  TYPE      = flavor.AFRICAN_VIOLET,
  STRING    = flavor.POWDER_BLUE,

  ERROR     = flavor.VIVID_RASPBERRY,
  WARNING   = flavor.GARDENIA,
  IGNORE    = flavor.ROMAN_SILVER,
  INFO      = flavor.MAXIMUM_BLUE,
  HINT      = flavor.OLD_LAVENDER,
  OK        = flavor.PEARL_AQUA,

  ADD       = flavor.MAXIMUM_BLUE,
  DELETE    = flavor.HOT_PINK,
  CHANGE    = flavor.MUSTARD,
  CONFLICT  = flavor.VIVID_RASPBERRY,

  NORMAL    = flavor.MAXIMUM_BLUE,
  INSERT    = flavor.PEARL_AQUA,
  COMMAND   = flavor.MUSTARD,
  VISUAL    = flavor.AFRICAN_VIOLET,
  REPLACE   = flavor.HOT_PINK,
  INACTIVE  = flavor.ROMAN_SILVER,
}
-- stylua: ignore end

---@class LaserwavePalette: LaserwaveFlavor, LaserwaveSemantics
---@field colors LaserwaveFlavor
---@field semantics LaserwaveSemantics
---@field terminal LaserwaveTerminal
local M = {
  colors = flavor,
  semantics = semantics,
  terminal = terminal,
}

setmetatable(M, {
  __index = function(_, key)
    return M.colors[key] or M.semantics[key]
  end,
})

return M
