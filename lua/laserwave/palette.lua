local flavor = require("laserwave.flavor")

-- stylua: ignore
---@class laserwave.Terminal
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

-- stylua: ignore
---@class laserwave.Semantics
local semantics = {
  FG        = flavor.background == "light" and flavor.RAISIN_BLACK or flavor.WHITE,
  BG        = flavor.background == "light" and flavor.WHITE or flavor.RAISIN_BLACK,
  GUTTER    = flavor.ROMAN_SILVER,
  HIGHLIGHT = flavor.HOT_PINK,

  VARIABLE  = flavor.background == "light" and flavor.RAISIN_BLACK or flavor.WHITE,
  COMMENT   = flavor.OLD_LAVENDER,
  FUNCTION  = flavor.HOT_PINK,
  OPERATOR  = flavor.MAXIMUM_BLUE,
  CONSTANT  = flavor.MUSTARD,
  KEYWORD   = flavor.PEARL_AQUA,
  NUMBER    = flavor.AFRICAN_VIOLET,
  TYPE      = flavor.AFRICAN_VIOLET,
  STRING    = flavor.POWDER_BLUE,

  ERROR     = flavor.VIVID_RASPBERRY,
  WARN      = flavor.GARDENIA,
  IGNORE    = flavor.ROMAN_SILVER,
  INFO      = flavor.MAXIMUM_BLUE,
  HINT      = flavor.OLD_LAVENDER,
  OK        = flavor.PEARL_AQUA,
  TODO      = flavor.MAXIMUM_BLUE,

  ADD       = flavor.MAXIMUM_BLUE,
  DELETE    = flavor.HOT_PINK,
  CHANGE    = flavor.PEARL_AQUA,
  CONFLICT  = flavor.VIVID_RASPBERRY,
}

-- stylua: ignore
---@class laserwave.Ui
local ui           = {
  NORMAL           = flavor.MAXIMUM_BLUE,
  INSERT           = flavor.PEARL_AQUA,
  COMMAND          = flavor.MUSTARD,
  VISUAL           = flavor.AFRICAN_VIOLET:mix(semantics.BG, 80),
  REPLACE          = flavor.HOT_PINK,
  INACTIVE         = flavor.ROMAN_SILVER,

  CURSOR_LINE_NUM = flavor.AFRICAN_VIOLET:mix(semantics.FG, 50),
  LINE_NUM        = flavor.ROMAN_SILVER:mix(semantics.BG, 50),
  INDENT          = flavor.ROMAN_SILVER:mix(semantics.BG, 80),
  SCOPE           = flavor.AFRICAN_VIOLET:mix(semantics.BG, 40),

  BG_FLOAT       = flavor.background == "light" and semantics.BG:darken(5) or semantics.BG:darken(10),
  BG_SEARCH      = flavor.AFRICAN_VIOLET:mix(semantics.BG, 50),
  BG_VISUAL      = flavor.AFRICAN_VIOLET:mix(semantics.BG, 80),
  BG_CURSOR      = flavor.HOT_PINK:mix(semantics.BG, 75),
  BG_CURSOR_LINE = flavor.AFRICAN_VIOLET:mix(semantics.BG, 85),
  BG_FOLD        = flavor.ROMAN_SILVER:mix(semantics.BG, 75),

  BG_ERROR  = semantics.ERROR:darken(75),
  BG_WARN   = semantics.WARN:darken(75),
  BG_INFO   = semantics.INFO:darken(75),
  BG_HINT   = semantics.HINT:darken(75),
  BG_OK     = semantics.OK:darken(75),

  BG_ADD    = semantics.ADD:mix(semantics.BG, 90),
  BG_DELETE = semantics.DELETE:mix(semantics.BG, 90),
  BG_CHANGE = semantics.CHANGE:mix(semantics.BG, 90),
}

-- stylua: ignore
---@class laserwave.Gradient
local gradient = {
  Step1  = flavor.MAXIMUM_BLUE:mix(flavor.HOT_PINK, 0):mix(semantics.BG, 0),
  Step2  = flavor.MAXIMUM_BLUE:mix(flavor.HOT_PINK, 10):mix(semantics.BG, 5),
  Step3  = flavor.MAXIMUM_BLUE:mix(flavor.HOT_PINK, 20):mix(semantics.BG, 10),
  Step4  = flavor.MAXIMUM_BLUE:mix(flavor.HOT_PINK, 30):mix(semantics.BG, 15),
  Step5  = flavor.MAXIMUM_BLUE:mix(flavor.HOT_PINK, 40):mix(semantics.BG, 20),
  Step6  = flavor.MAXIMUM_BLUE:mix(flavor.HOT_PINK, 50):mix(semantics.BG, 25),
  Step7  = flavor.MAXIMUM_BLUE:mix(flavor.HOT_PINK, 60):mix(semantics.BG, 30),
  Step8  = flavor.MAXIMUM_BLUE:mix(flavor.HOT_PINK, 70):mix(semantics.BG, 35),
  Step9  = flavor.MAXIMUM_BLUE:mix(flavor.HOT_PINK, 80):mix(semantics.BG, 40),
  Step10 = flavor.MAXIMUM_BLUE:mix(flavor.HOT_PINK, 90):mix(semantics.BG, 45),
  Step11 = flavor.MAXIMUM_BLUE:mix(flavor.HOT_PINK, 100):mix(semantics.BG, 50),
  Step12 = flavor.VIVID_RASPBERRY:mix(flavor.MAXIMUM_BLUE, 10):mix(semantics.BG, 55),
  Step13 = flavor.VIVID_RASPBERRY:mix(flavor.MAXIMUM_BLUE, 20):mix(semantics.BG, 60),
  Step14 = flavor.VIVID_RASPBERRY:mix(flavor.MAXIMUM_BLUE, 30):mix(semantics.BG, 65),
  Step15 = flavor.VIVID_RASPBERRY:mix(flavor.MAXIMUM_BLUE, 40):mix(semantics.BG, 70),
  Step16 = flavor.VIVID_RASPBERRY:mix(flavor.MAXIMUM_BLUE, 50):mix(semantics.BG, 75),
  Step17 = flavor.VIVID_RASPBERRY:mix(flavor.MAXIMUM_BLUE, 60):mix(semantics.BG, 80),
  Step18 = flavor.VIVID_RASPBERRY:mix(flavor.MAXIMUM_BLUE, 70):mix(semantics.BG, 85),
  Step19 = flavor.VIVID_RASPBERRY:mix(flavor.MAXIMUM_BLUE, 80):mix(semantics.BG, 90),
  Step20 = flavor.VIVID_RASPBERRY:mix(flavor.MAXIMUM_BLUE, 90):mix(semantics.BG, 95),
}

---@class laserwave.Palette: laserwave.Flavor, laserwave.Semantics, laserwave.Ui
---@field background "dark" | "light"
---@field colors laserwave.Flavor
---@field semantics laserwave.Semantics
---@field ui laserwave.Ui
---@field terminal laserwave.Terminal
local M = {
  background = flavor.background,
  colors = flavor,
  semantics = semantics,
  ui = ui,
  terminal = terminal,
  gradient = gradient,
}

setmetatable(M, {
  __index = function(_, key)
    return M.colors[key] or M.semantics[key] or M.ui[key]
  end,
})

return M
