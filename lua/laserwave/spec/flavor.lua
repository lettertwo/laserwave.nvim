local hsluv = require("lush").hsluv

-- stylua: ignore start
---@class LaserwaveColors
local original = {
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
-- stylua: ignore end

-- stylua: ignore start
---@type LaserwaveColors
local hi_c = {
  WHITE           = hsluv("#ffffff"), -- Foreground, Variables
  RAISIN_BLACK    = hsluv("#19151e"), -- Background
  OLD_LAVENDER    = hsluv("#b4abbe"), -- Comments, Hints
  HOT_PINK        = hsluv("#ff52bf"), -- Functions, Attributes, Highlighting
  PEARL_AQUA      = hsluv("#3feabf"), -- Operators, Tags
  MUSTARD         = hsluv("#ffe261"), -- Builtins, Constants
  MAXIMUM_BLUE    = hsluv("#1ed3ec"), -- Keywords, Properties, Info
  AFRICAN_VIOLET  = hsluv("#d887f5"), -- Numbers, Types
  POWDER_BLUE     = hsluv("#acdfef"), -- Strings
  ROMAN_SILVER    = hsluv("#b4a8c8"), -- Gutter, Ignored
  VIVID_RASPBERRY = hsluv("#ff3e7b"), -- Errors
  GARDENIA        = hsluv("#ffb85b"), -- Warnings
}
-- stylua: ignore end

---@class LaserwaveFlavor
local LaserwaveFlavor = {
  ---@class LaserwaveFlavors
  flavors = {
    original = original,
    hi_c = hi_c,
  },
  _current = original,
}

---@param input LASERWAVE_FLAVOR | LASERWAVE_FLAVOR_NAME | LaserwaveColors
function LaserwaveFlavor.set(input)
  local flavor

  if type(input) ~= "table" then
    local name = require("laserwave").get_flavor(input)
    if name ~= nil then
      flavor = LaserwaveFlavor.flavors[name]
    end
  else
    flavor = input
  end

  LaserwaveFlavor._current = flavor or LaserwaveFlavor.flavors.original
end

setmetatable(LaserwaveFlavor, {
  __index = function(_, key)
    return LaserwaveFlavor._current[key] or LaserwaveFlavor.flavors.original[key]
  end,
})

return LaserwaveFlavor
