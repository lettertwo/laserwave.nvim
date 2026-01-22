local Color = require("laserwave.color")

-- stylua: ignore
---@class laserwave.FlavorConfig
---@field background "dark" | "light"
local original = {
  background      = "dark",
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
---@type laserwave.FlavorConfig
local hi_c = {
  background      = "dark",
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

---@class laserwave.Flavor: laserwave.FlavorConfig
local Flavor = {
  ---@enum (key) laserwave.FLAVOR
  flavors = {
    original = original,
    hi_c = hi_c,
  },
  _current = original,
}

---@param input string | table
function Flavor.validate(input)
  if type(input) == "string" then
    input = Flavor.flavors[input]
  end
  vim.validate("flavor", input, "table")
  vim.validate("flavor.background", input.background, function(val)
    return val == "dark" or val == "light"
  end, true, "must be 'dark' or 'light'")
  for key in pairs(input) do
    if key ~= "background" then
      vim.validate("flavor." .. key, original[key], function(val)
        return type(val) == "string" or type(val.__tostring) == "function"
      end, true, "must be a string or laserwave.Color")
    end
  end
end

---@param input laserwave.FLAVOR | laserwave.FlavorConfig
function Flavor.set(input)
  local flavor = Flavor.flavors.original
  local ok, err = pcall(Flavor.validate, input)
  if not ok then
    vim.notify("Invalid flavor:\n" .. err, vim.log.levels.ERROR, { title = "Laserwave" })
  elseif type(input) == "table" then
    flavor = input
  else
    flavor = Flavor.flavors[input] or Flavor.flavors.original
  end
  Flavor._current = flavor
end

setmetatable(Flavor, {
  __index = function(_, key)
    return Flavor._current[key] or Flavor.flavors.original[key]
  end,
})

return Flavor
