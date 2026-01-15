if not package.path:find("./lua_modules/share/lua/5.1/") then
  package.path = package.path .. "./lua_modules/share/lua/5.1/?.lua;./lua_modules/share/lua/5.1/?/init.lua;"
end

local ok, hsluv = pcall(require, "hsluv")

if not ok then
  error("hsluv module not found. You may need to run `make install` to install dependencies.")
end

---@overload fun(hex: string): laserwave.Color
local M = {}

local function clamp(value, min, max)
  return math.min(math.max(value, min), max)
end

---@class laserwave.Color
---@field hex string
---@field h integer
---@field s integer
---@field l integer
local Color = {}
Color.__index = Color

function Color.__tostring(self)
  return self.hex
end

-- Mix two colors in HSLuv space
-- ratio: 0 = 100% self, 100 = 100% other
function Color:mix(other, ratio)
  ratio = clamp(ratio, 0, 100) / 100
  local h = self.h + (other.h - self.h) * ratio
  local s = self.s + (other.s - self.s) * ratio
  local l = self.l + (other.l - self.l) * ratio
  return M.hsluv(h, s, l)
end

-- Darken color by reducing lightness
function Color:darken(amount)
  local ratio = clamp(amount, 0, 100) / 100
  return M.hsluv(self.h, self.s, self.l + (self.l * -ratio))
end

-- Lighten color by increasing lightness
function Color:lighten(amount)
  local ratio = clamp(amount, 0, 100) / 100
  return M.hsluv(self.h, self.s, self.l + ((100 - self.l) * ratio))
end

-- Create a color from a hex string
---@param hex string
function M.hex(hex)
  local h, s, l = unpack(hsluv.hex_to_hsluv(hex))
  return M.hsluv(h, s, l)
end

-- Create color from HSLUV coordinates
---@param h integer
---@param s integer
---@param l integer
function M.hsluv(h, s, l)
  return setmetatable({
    hex = hsluv.hsluv_to_hex({ h, s, l }):upper(),
    h = h,
    s = s,
    l = l,
  }, Color)
end

---@diagnostic disable-next-line: param-type-mismatch
setmetatable(M, {
  __call = function(_, hex)
    return M.hex(hex)
  end,
})

return M
