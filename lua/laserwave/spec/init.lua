---@class laserwave.SpecValue
---@field fg laserwave.Color?
---@field bg laserwave.Color?
---@field sp laserwave.Color?
---@field bold boolean?
---@field underline boolean?
---@field undercurl boolean?
---@field underdouble boolean?
---@field underdotted boolean?
---@field underdashed boolean?
---@field strikethrough boolean?
---@field italic boolean?
---@field reverse boolean?
---@field [any] 'never'

---@alias laserwave.Spec table<string, laserwave.SpecValue | string>

---@param specs laserwave.Spec[]
---@return laserwave.Spec
local function merge_specs(specs)
  local result = {}
  for _, spec in ipairs(specs) do
    for group, attrs in pairs(spec) do
      result[group] = attrs
    end
  end
  return result
end

---@class laserwave.Specs
local specs = {
  spec = merge_specs({
    require("laserwave.spec.syntax"),
    require("laserwave.spec.ui"),
    require("laserwave.spec.terminal"),
  }),
  plugins = {
    treesitter = require("laserwave.spec.treesitter"),
    semantic_highlights = require("laserwave.spec.semantic_highlights"),
    blink = require("laserwave.spec.plugins.blink"),
    cmp = require("laserwave.spec.plugins.cmp"),
    git = require("laserwave.spec.plugins.git"),
    mini_pick = require("laserwave.spec.plugins.mini_pick"),
    neotree = require("laserwave.spec.plugins.neotree"),
    obsidian = require("laserwave.spec.plugins.obsidian"),
    occurrence = require("laserwave.spec.plugins.occurrence"),
    package_info = require("laserwave.spec.plugins.package_info"),
    snacks = require("laserwave.spec.plugins.snacks"),
    space = require("laserwave.spec.plugins.space"),
    telescope = require("laserwave.spec.plugins.telescope"),
  },
}

return specs
