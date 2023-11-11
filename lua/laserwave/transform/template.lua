local helpers = require("shipwright.transform.helpers")

---@class LaserwaveTemplate
local Template = {}

---@class LaserwaveTemplateMetaOptions
---@field name? string
---@field author? string
---@field license? string
---@field upstream? string
---@field blurb? string
---@field date? string
---@field time? string

---@class LaserwaveTemplateMeta
---@field name string
---@field author string
---@field license string
---@field upstream string
---@field blurb string
---@field date string
---@field time string

---@class LaserwaveTemplateMetaSpec
local meta_spec = {
  "name",
  "author",
  "license",
  "upstream",
  "blurb",
  "date",
  "time",
}

---@param meta unknown
---@return LaserwaveTemplateMeta
function Template.validate_meta(meta)
  for _, key in ipairs(meta_spec) do
    if meta[key] == nil then
      error("meta key " .. key .. " is missing")
    end
  end
  return meta
end

local meta_defaults = Template.validate_meta({
  name = "laserwave",
  author = "Eric Eldredge <lettertwo@gmail.com>",
  license = "MIT",
  upstream = "https://github.com/lettertwo/laserwave.nvim",
  blurb = "Based on LaserWave for VSCode by Jared Jones",
  date = "UNKNOWN",
  time = "UNKNOWN",
})

---@class LaserwaveTemplatePaletteOptions
---@field bg? string | HslValue | HsluvValue
---@field fg? string | HslValue | HsluvValue
---@field cursor_fg? string | HslValue | HsluvValue
---@field cursor_bg? string | HslValue | HsluvValue
---@field selection_fg? string | HslValue | HsluvValue
---@field selection_bg? string | HslValue | HsluvValue
---@field black? string | HslValue | HsluvValue
---@field red? string | HslValue | HsluvValue
---@field green? string | HslValue | HsluvValue
---@field yellow? string | HslValue | HsluvValue
---@field blue? string | HslValue | HsluvValue
---@field magenta? string | HslValue | HsluvValue
---@field cyan? string | HslValue | HsluvValue
---@field white? string | HslValue | HsluvValue
---@field bright_black? string | HslValue | HsluvValue
---@field bright_red? string | HslValue | HsluvValue
---@field bright_green? string | HslValue | HsluvValue
---@field bright_yellow? string | HslValue | HsluvValue
---@field bright_blue? string | HslValue | HsluvValue
---@field bright_magenta? string | HslValue | HsluvValue
---@field bright_cyan? string | HslValue | HsluvValue
---@field bright_white? string | HslValue | HsluvValue
---@field url? string | HslValue | HsluvValue
---@field border_active? string | HslValue | HsluvValue
---@field border_inactive? string | HslValue | HsluvValue
---@field border_bell? string | HslValue | HsluvValue
---@field tab_active_fg? string | HslValue | HsluvValue
---@field tab_active_bg? string | HslValue | HsluvValue
---@field tab_inactive_fg? string | HslValue | HsluvValue
---@field tab_inactive_bg? string | HslValue | HsluvValue
---@field tab_bg? string | HslValue | HsluvValue
---@field mark1_fg? string | HslValue | HsluvValue
---@field mark1_bg? string | HslValue | HsluvValue
---@field mark2_fg? string | HslValue | HsluvValue
---@field mark2_bg? string | HslValue | HsluvValue
---@field mark3_fg? string | HslValue | HsluvValue
---@field mark3_bg? string | HslValue | HsluvValue

---@class LaserwaveTemplatePalette
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

---@class LaserwaveTemplatePaletteSpec
local palette_spec = {
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

---@param data unknown
---@return LaserwaveTemplatePalette
function Template.validate_palette(data)
  for _, key in ipairs(palette_spec) do
    if data[key] == nil then
      error("key " .. key .. " is missing")
    end
  end
  return data
end

---@param colors LaserwaveTemplatePaletteOptions
---@return LaserwaveTemplatePaletteOptions
function Template.stringify_colors(colors)
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

---@param spec ParsedLushSpec
---@return LaserwaveTemplatePalette
local function palette_defaults(spec)
  -- vim.print(spec.TerminalBrightBlack.fg)

  return Template.validate_palette(Template.stringify_colors({
    bg = spec.Normal.bg,
    fg = spec.Normal.fg,

    cursor_fg = spec.Cursor.fg,
    cursor_bg = spec.Cursor.bg,

    selection_fg = spec.Normal.fg,
    selection_bg = spec.Visual.bg,

    black = spec.TerminalBlack.fg,
    red = spec.TerminalRed.fg,
    green = spec.TerminalGreen.fg,
    yellow = spec.TerminalYellow.fg,
    blue = spec.TerminalBlue.fg,
    magenta = spec.TerminalMagenta.fg,
    cyan = spec.TerminalCyan.fg,
    white = spec.TerminalWhite.fg,

    bright_black = spec.TerminalBrightBlack.fg,
    bright_red = spec.TerminalBrightRed.fg,
    bright_green = spec.TerminalBrightGreen.fg,
    bright_yellow = spec.TerminalBrightYellow.fg,
    bright_blue = spec.TerminalBrightBlue.fg,
    bright_magenta = spec.TerminalBrightMagenta.fg,
    bright_cyan = spec.TerminalBrightCyan.fg,
    bright_white = spec.TerminalBrightWhite.fg,

    url = "#0087bd",

    border_active = "#00ff00",
    border_inactive = "#cccccc",
    border_bell = "#ff5a00",

    tab_active_fg = spec.Normal.fg,
    tab_active_bg = spec.Normal.bg.lighten(7),
    tab_inactive_fg = spec.NonText.fg,
    tab_inactive_bg = spec.Normal.bg.darken(70),
    tab_bg = spec.Normal.bg.darken(70),

    mark1_fg = spec.TerminalBlack.fg,
    mark1_bg = "#98d3cb",
    mark2_fg = spec.TerminalBlack.fg,
    mark2_bg = "#f2dcd3",
    mark3_fg = spec.TerminalBlack.fg,
    mark3_bg = "#f274bc",
  }))
end

---@class LaserwaveTemplateOptions : LaserwaveTemplateMetaOptions, LaserwaveTemplatePaletteOptions
---@class LaserwaveTemplateContext : LaserwaveTemplateMeta, LaserwaveTemplatePalette

---@param opts unknown
---@return LaserwaveTemplateContext
function Template.validate_context(opts)
  Template.validate_palette(opts)
  Template.validate_meta(opts)
  return opts
end

---@param with_context LaserwaveTemplateOptions | fun(ctx: LaserwaveTemplateContext, spec: ParsedLushSpec):LaserwaveTemplateOptions
function Template.with_context(with_context)
  ---@class BoundLaserwaveTemplate
  local BoundTemplate = {}

  ---@param template string
  ---@return fun(spec: ParsedLushSpec): string[]
  function BoundTemplate.create(template)
    ---@param spec ParsedLushSpec
    local function apply(spec)
      local default_context = vim.tbl_extend("force", palette_defaults(spec), meta_defaults)

      local bound_context
      if type(with_context) == "function" then
        bound_context = with_context(default_context, spec)
      else
        bound_context = with_context or {}
      end

      local context =
        Template.validate_context(vim.tbl_extend("force", default_context, Template.stringify_colors(bound_context), {
          date = os.date("%Y-%m-%d"),
          time = os.date("%H:%M:%S"),
        }))

      local text = helpers.apply_template(template, context)
      return helpers.split_newlines(text)
    end

    return function(spec)
      local ok, result = pcall(apply, spec)

      if not ok then
        vim.notify(result, vim.log.levels.ERROR, { title = "Laserwave" })
        error(result)
      end

      return result
    end
  end

  return BoundTemplate
end

Template.create = Template.with_context({}).create

return Template
