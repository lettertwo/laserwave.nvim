local Color = require("laserwave.color")

-- stylua: ignore
---@class LaserwaveFlavorConfig
local original = {
  WHITE           = Color("#ffffff"), -- Foreground, Variables
  RAISIN_BLACK    = Color("#27212e"), -- Background
  OLD_LAVENDER    = Color("#91889b"), -- Comments, Hints
  HOT_PINK        = Color("#eb64B9"), -- Functions, Attributes, Highlighting
  PEARL_AQUA      = Color("#74dfc4"), -- Operators, Tags
  MUSTARD         = Color("#ffe261"), -- Builtins, Constants
  MAXIMUM_BLUE    = Color("#40b4c4"), -- Keywords, Properties, Info
  AFRICAN_VIOLET  = Color("#b381c5"), -- Numbers, Types
  POWDER_BLUE     = Color("#b4dce7"), -- Strings
  ROMAN_SILVER    = Color("#7b6995"), -- Gutter, Ignored
  VIVID_RASPBERRY = Color("#ff3e7b"), -- Errors
  GARDENIA        = Color("#ffb85b"), -- Warnings
}

-- stylua: ignore
---@type LaserwaveFlavorConfig
local hi_c = {
  WHITE           = Color("#ffffff"), -- Foreground, Variables
  RAISIN_BLACK    = Color("#19151e"), -- Background
  OLD_LAVENDER    = Color("#b4abbe"), -- Comments, Hints
  HOT_PINK        = Color("#ff52bf"), -- Functions, Attributes, Highlighting
  PEARL_AQUA      = Color("#3feabf"), -- Operators, Tags
  MUSTARD         = Color("#ffe261"), -- Builtins, Constants
  MAXIMUM_BLUE    = Color("#1ed3ec"), -- Keywords, Properties, Info
  AFRICAN_VIOLET  = Color("#d887f5"), -- Numbers, Types
  POWDER_BLUE     = Color("#acdfef"), -- Strings
  ROMAN_SILVER    = Color("#b4a8c8"), -- Gutter, Ignored
  VIVID_RASPBERRY = Color("#ff3e7b"), -- Errors
  GARDENIA        = Color("#ffb85b"), -- Warnings
}

---@class LaserwaveFlavor: LaserwaveFlavorConfig
local LaserwaveFlavor = {
  ---@class LaserwaveFlavors
  flavors = {
    original = original,
    hi_c = hi_c,
  },
  _current = original,
}

---@param input LASERWAVE_FLAVOR | LASERWAVE_FLAVOR_NAME | LaserwaveFlavorConfig
function LaserwaveFlavor.set(input)
  local flavor

  if type(input) ~= "table" then
    ---@cast input -LaserwaveFlavorConfig
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
