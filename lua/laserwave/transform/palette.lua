local laserwave_palette = require("laserwave.palette")

---@class LaserwaveTransformPalette: LaserwaveTransformPaletteBase
---@overload fun(opts: LaserwaveTransformPaletteOptions): LaserwaveTransformPalette

---@class LaserwaveTransformPaletteBase
---@field bg string
---@field fg string
---@field cursor_fg string
---@field cursor_bg string
---@field selection_fg string
---@field selection_bg string
---@field black string
---@field red string
---@field green string
---@field yellow string
---@field blue string
---@field magenta string
---@field cyan string
---@field white string
---@field bright_black string
---@field bright_red string
---@field bright_green string
---@field bright_yellow string
---@field bright_blue string
---@field bright_magenta string
---@field bright_cyan string
---@field bright_white string
---@field url string
---@field border_active string
---@field border_inactive string
---@field border_bell string
---@field tab_active_fg string
---@field tab_active_bg string
---@field tab_inactive_fg string
---@field tab_inactive_bg string
---@field tab_bg string
---@field mark1_fg string
---@field mark1_bg string
---@field mark2_fg string
---@field mark2_bg string
---@field mark3_fg string
---@field mark3_bg string

---@class LaserwaveTransformPaletteOptions
---@field bg? string
---@field fg? string
---@field cursor_fg? string
---@field cursor_bg? string
---@field selection_fg? string
---@field selection_bg? string
---@field black? string
---@field red? string
---@field green? string
---@field yellow? string
---@field blue? string
---@field magenta? string
---@field cyan? string
---@field white? string
---@field bright_black? string
---@field bright_red? string
---@field bright_green? string
---@field bright_yellow? string
---@field bright_blue? string
---@field bright_magenta? string
---@field bright_cyan? string
---@field bright_white? string
---@field url? string
---@field border_active? string
---@field border_inactive? string
---@field border_bell? string
---@field tab_active_fg? string
---@field tab_active_bg? string
---@field tab_inactive_fg? string
---@field tab_inactive_bg? string
---@field tab_bg? string
---@field mark1_fg? string
---@field mark1_bg? string
---@field mark2_fg? string
---@field mark2_bg? string
---@field mark3_fg? string
---@field mark3_bg? string

---@class LaserwaveTemplatePaletteSpec
local spec = {
  "bg",
  "fg",

  "cursor_fg",
  "cursor_bg",

  "selection_fg",
  "selection_bg",

  "black",
  "red",
  "green",
  "yellow",
  "blue",
  "magenta",
  "cyan",
  "white",

  "bright_black",
  "bright_red",
  "bright_green",
  "bright_yellow",
  "bright_blue",
  "bright_magenta",
  "bright_cyan",
  "bright_white",

  "url",

  "border_active",
  "border_inactive",
  "border_bell",

  "tab_active_fg",
  "tab_active_bg",
  "tab_inactive_fg",
  "tab_inactive_bg",
  "tab_bg",

  "mark1_fg",
  "mark1_bg",
  "mark2_fg",
  "mark2_bg",
  "mark3_fg",
  "mark3_bg",
}

---@param colors LaserwaveTransformPaletteOptions
---@return LaserwaveTransformPaletteOptions
local function stringify_colors(colors)
  local extracted = {}
  for key, value in pairs(colors) do
    if type(value) == "string" then
      extracted[key] = value
    elseif type(value.hex) == "string" then
      extracted[key] = value.hex
    else
      error("Invalid color value type " .. type(value) .. " for " .. key)
    end
  end
  return extracted
end

---@param data unknown
---@return LaserwaveTransformPaletteBase
local function validate_palette(data)
  for _, key in ipairs(spec) do
    assert(data[key] ~= nil, "key " .. key .. " is missing")
  end
  return data
end

---@param opts unknown
---@return LaserwaveTransformPaletteOptions
local function validate_opts(opts)
  opts = opts or {}
  for _, key in ipairs(opts) do
    assert(spec[key] ~= nil, "unknown key " .. key)
  end
  return opts
end

---@param base LaserwaveTransformPaletteBase
---@param opts? LaserwaveTransformPaletteOptions?
---@return LaserwaveTransformPalette
local function extend_palette(base, opts)
  opts = validate_opts(stringify_colors(opts or {}))

  local palette = vim.tbl_extend("force", base, opts)

  return setmetatable(palette, {
    ---@diagnostic disable-next-line: redefined-local
    __call = function(opts)
      return extend_palette(palette, opts)
    end,
  })
end

return extend_palette(validate_palette(stringify_colors({
  bg = laserwave_palette.BG,
  fg = laserwave_palette.FG,

  cursor_fg = laserwave_palette.FG,
  cursor_bg = laserwave_palette.HIGHLIGHT.mix(laserwave_palette.BG, 75),

  selection_fg = laserwave_palette.FG,
  selection_bg = laserwave_palette.VISUAL.mix(laserwave_palette.BG, 75),

  black = laserwave_palette.terminal.BLACK,
  red = laserwave_palette.terminal.RED,
  green = laserwave_palette.terminal.GREEN,
  yellow = laserwave_palette.terminal.YELLOW,
  blue = laserwave_palette.terminal.BLUE,
  magenta = laserwave_palette.terminal.MAGENTA,
  cyan = laserwave_palette.terminal.CYAN,
  white = laserwave_palette.terminal.WHITE,

  bright_black = laserwave_palette.terminal.BRIGHT_BLACK,
  bright_red = laserwave_palette.terminal.BRIGHT_RED,
  bright_green = laserwave_palette.terminal.BRIGHT_GREEN,
  bright_yellow = laserwave_palette.terminal.BRIGHT_YELLOW,
  bright_blue = laserwave_palette.terminal.BRIGHT_BLUE,
  bright_magenta = laserwave_palette.terminal.BRIGHT_MAGENTA,
  bright_cyan = laserwave_palette.terminal.BRIGHT_CYAN,
  bright_white = laserwave_palette.terminal.BRIGHT_WHITE,

  url = "#0087bd",

  border_active = "#00ff00",
  border_inactive = "#cccccc",
  border_bell = "#ff5a00",

  tab_active_fg = laserwave_palette.FG,
  tab_active_bg = laserwave_palette.BG.lighten(7),
  tab_inactive_fg = laserwave_palette.IGNORE,
  tab_inactive_bg = laserwave_palette.BG.darken(70),
  tab_bg = laserwave_palette.BG.darken(70),

  mark1_fg = laserwave_palette.terminal.BLACK,
  mark1_bg = "#98d3cb",
  mark2_fg = laserwave_palette.terminal.BLACK,
  mark2_bg = "#f2dcd3",
  mark3_fg = laserwave_palette.terminal.BLACK,
  mark3_bg = "#f274bc",
})))
