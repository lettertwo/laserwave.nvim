---@diagnostic disable: unused-local

---@class HslValue
---@field h number
---@field s number
---@field l number
---@field hex string
---@field hsl table<string, number>
---@field hue fun(hue: number): HslValue
---@field saturation fun(saturation: number): HslValue
---@field lightness fun(lightness: number): HslValue
---@field rotate fun(value: number): HslValue
---@field ro fun(value: number): HslValue
---@field saturate fun(percent: number): HslValue
---@field sa fun(percent: number): HslValue
---@field abs_saturate fun(value: number): HslValue
---@field abs_sa fun(value: number): HslValue
---@field desaturate fun(percent: number): HslValue
---@field de fun(percent: number): HslValue
---@field abs_desaturate fun(value: number): HslValue
---@field abs_de fun(value: number): HslValue
---@field lighten fun(percent: number): HslValue
---@field li fun(percent: number): HslValue
---@field abs_lighten fun(value: number): HslValue
---@field abs_li fun(value: number): HslValue
---@field darken fun(percent: number): HslValue
---@field da fun(percent: number): HslValue
---@field abs_darken fun(value: number): HslValue
---@field abs_da fun(value: number): HslValue
---@field mix fun(target: HslValue, strength: number): HslValue
---@field readable fun(): HslValue

---@class HsluvValue: HslValue
---@field hue fun(hue: number): HsluvValue
---@field saturation fun(saturation: number): HsluvValue
---@field lightness fun(lightness: number): HsluvValue
---@field rotate fun(value: number): HsluvValue
---@field ro fun(value: number): HsluvValue
---@field saturate fun(percent: number): HsluvValue
---@field sa fun(percent: number): HsluvValue
---@field abs_saturate fun(value: number): HsluvValue
---@field abs_sa fun(value: number): HsluvValue
---@field desaturate fun(percent: number): HsluvValue
---@field de fun(percent: number): HsluvValue
---@field abs_desaturate fun(value: number): HsluvValue
---@field abs_de fun(value: number): HsluvValue
---@field lighten fun(percent: number): HsluvValue
---@field li fun(percent: number): HsluvValue
---@field abs_lighten fun(value: number): HsluvValue
---@field abs_li fun(value: number): HsluvValue
---@field darken fun(percent: number): HsluvValue
---@field da fun(percent: number): HsluvValue
---@field abs_darken fun(value: number): HsluvValue
---@field abs_da fun(value: number): HsluvValue
---@field mix fun(target: HsluvValue, strength: number): HsluvValue
---@field readable fun(): HsluvValue

---@alias LushColor HslValue | HsluvValue | string

-- A comma separated list (without spaces) of the
-- following items (in any order):
-- 	 bold
-- 	 underline
-- 	 undercurl      curly underline
-- 	 strikethrough
-- 	 reverse
-- 	 inverse        same as reverse
-- 	 italic
-- 	 standout
-- 	 nocombine      override attributes instead of combining them
-- 	 NONE           no attributes used (used to reset it)
--
-- Note that "bold" can be used here and by using a bold font.  They
-- have the same effect.
-- "undercurl" falls back to "underline" in a terminal that does not
-- support it.  The color is set using the `sp` field.
---@alias LushGui string

---@class LushSpecValue
---@field fg ?LushColor
---@field bg ?LushColor
---@field sp ?LushColor
---@field gui ?LushGui

---@alias ParsedLushSpec table<string, LushSpecValue>

---@alias LushSpec fun():table<string, table>

---@alias CompiledLushSpec table

---@class ExtendedLushSpec
---@field with fun(spec: LushSpec, options: table): ParsedLushSpec

-- We can call lush in two styles, with the intention of making boilerplate
-- easier.
--
-- lush(function() ... end)
--   -> define a lush spec, returns a parsed spec
--   -> traditionally called in a lua/lush_theme/theme.lua file
--
-- lush({...})
--   -> applying a parsed spec, automatically sets the clear option
--   -> traditionally called in the colors/colors.vim file
--
---@type fun(spec: LushSpec | ParsedLushSpec, options?: table): ParsedLushSpec
local Lush = {}

---@param hex string
---@return HslValue
---@overload fun(h: number, s: number, l: number): HslValue
Lush.hsl = function(hex) end

---@param hex string
---@return HsluvValue
---@overload fun(h: number, s: number, l: number): HsluvValue
Lush.hsluv = function(hex) end

---@param options table
---@return nil
Lush.ify = function(options) end

---@param spec LushSpec
---@param options table
---@return ParsedLushSpec
Lush.parse = function(spec, options) end

---@param ast table
---@param options table
---@return CompiledLushSpec
Lush.compile = function(ast, options) end

-- accepts list of highlight commands from compile() to apply
---@param compiled CompiledLushSpec
---@return nil
Lush.apply = function(compiled) end

---@param parsed_spec ParsedLushSpec
---@param options table
---@return string
Lush.stringify = function(parsed_spec, options) end

---@param parsed_spec ParsedLushSpec
---@return nil
Lush.export_to_buffer = function(parsed_spec) end

---@return nil
Lush.import = function() end

-- accepts list of parsed specs which it passes to the 'with'd specs
-- under the extends option
---@param extends_list ParsedLushSpec[]
---@return ExtendedLushSpec
Lush.extends = function(extends_list) end

-- accepts a list of parsed specs, merges them in order
-- (equivilent to extends({...}).with(empty_spec))
---@param extends_list ParsedLushSpec[]
---@return ParsedLushSpec
Lush.merge = function(extends_list) end

return Lush
