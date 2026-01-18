local helpers = require("shipwright.transform.helpers")

---@class laserwave.Template
local Template = {}

---@class laserwave.TemplateMetaOptions
---@field name? string
---@field flavor? string
---@field author? string
---@field license? string
---@field upstream? string
---@field blurb? string
---@field date? string
---@field time? string

---@class laserwave.TemplateMeta
---@field name string
---@field flavor string
---@field author string
---@field license string
---@field upstream string
---@field blurb string
---@field date string
---@field time string
---@field background "dark" | "light"

---@class laserwave.TemplateMetaSpec
local meta_spec = {
  "name",
  "flavor",
  "background",
  "author",
  "license",
  "upstream",
  "blurb",
  "date",
  "time",
}

---@param meta unknown
---@return laserwave.TemplateMeta
function Template.validate_meta(meta)
  for _, key in ipairs(meta_spec) do
    if meta[key] == nil then
      error("meta key " .. key .. " is missing")
    end
  end
  return meta
end

---@param input laserwave.TemplateInput
---@return laserwave.TemplateMeta
local function meta_defaults(input)
  return Template.validate_meta({
    name = input.name or "laserwave",
    flavor = input.flavor or "original",
    background = input.background or "dark",
    author = input.author or "Eric Eldredge <lettertwo@gmail.com>",
    license = input.license or "MIT",
    upstream = input.upstream or "https://github.com/lettertwo/laserwave.nvim",
    blurb = input.blurb or "Based on LaserWave for VSCode by Jared Jones",
    date = input.date or "UNKNOWN",
    time = input.time or "UNKNOWN",
  })
end

---@class laserwave.TemplatePaletteOptions
---@field bg? laserwave.Color | string
---@field fg? laserwave.Color | string
---@field cursor_fg? laserwave.Color | string
---@field cursor_bg? laserwave.Color | string
---@field line_bg? laserwave.Color | string
---@field selection_fg? laserwave.Color | string
---@field selection_bg? laserwave.Color | string
---@field black? laserwave.Color | string
---@field red? laserwave.Color | string
---@field green? laserwave.Color | string
---@field yellow? laserwave.Color | string
---@field blue? laserwave.Color | string
---@field magenta? laserwave.Color | string
---@field cyan? laserwave.Color | string
---@field white? laserwave.Color | string
---@field bright_black? laserwave.Color | string
---@field bright_red? laserwave.Color | string
---@field bright_green? laserwave.Color | string
---@field bright_yellow? laserwave.Color | string
---@field bright_blue? laserwave.Color | string
---@field bright_magenta? laserwave.Color | string
---@field bright_cyan? laserwave.Color | string
---@field bright_white? laserwave.Color | string
---@field attribute_fg? laserwave.Color | string
---@field class_fg? laserwave.Color | string
---@field character_fg? laserwave.Color | string
---@field comment_fg? laserwave.Color | string
---@field constant_fg? laserwave.Color | string
---@field error_fg? laserwave.Color | string
---@field function_fg? laserwave.Color | string
---@field ignore_fg? laserwave.Color | string
---@field keyword_fg? laserwave.Color | string
---@field number_fg? laserwave.Color | string
---@field operator_fg? laserwave.Color | string
---@field string_fg? laserwave.Color | string
---@field tag_fg? laserwave.Color | string
---@field type_fg? laserwave.Color | string
---@field identifier_fg? laserwave.Color | string
---@field added_fg? laserwave.Color | string
---@field added_bg? laserwave.Color | string
---@field deleted_fg? laserwave.Color | string
---@field deleted_bg? laserwave.Color | string
---@field changed_fg? laserwave.Color | string
---@field changed_bg? laserwave.Color | string
---@field url? laserwave.Color | string
---@field border_active? laserwave.Color | string
---@field border_inactive? laserwave.Color | string
---@field border_bell? laserwave.Color | string
---@field tab_active_fg? laserwave.Color | string
---@field tab_active_bg? laserwave.Color | string
---@field tab_inactive_fg? laserwave.Color | string
---@field tab_inactive_bg? laserwave.Color | string
---@field tab_bg? laserwave.Color | string
---@field mark1_fg? laserwave.Color | string
---@field mark1_bg? laserwave.Color | string
---@field mark2_fg? laserwave.Color | string
---@field mark2_bg? laserwave.Color | string
---@field mark3_fg? laserwave.Color | string
---@field mark3_bg? laserwave.Color | string

---@class laserwave.TemplatePalette
---@field bg laserwave.Color | string
---@field fg laserwave.Color | string
---@field cursor_fg laserwave.Color | string
---@field cursor_bg laserwave.Color | string
---@field line_bg laserwave.Color | string
---@field selection_fg laserwave.Color | string
---@field selection_bg laserwave.Color | string
---@field black laserwave.Color | string
---@field red laserwave.Color | string
---@field green laserwave.Color | string
---@field yellow laserwave.Color | string
---@field blue laserwave.Color | string
---@field magenta laserwave.Color | string
---@field cyan laserwave.Color | string
---@field white laserwave.Color | string
---@field bright_black laserwave.Color | string
---@field bright_red laserwave.Color | string
---@field bright_green laserwave.Color | string
---@field bright_yellow laserwave.Color | string
---@field bright_blue laserwave.Color | string
---@field bright_magenta laserwave.Color | string
---@field bright_cyan laserwave.Color | string
---@field bright_white laserwave.Color | string
---@field attribute_fg laserwave.Color | string
---@field class_fg laserwave.Color | string
---@field character_fg laserwave.Color | string
---@field comment_fg laserwave.Color | string
---@field constant_fg laserwave.Color | string
---@field error_fg laserwave.Color | string
---@field function_fg laserwave.Color | string
---@field ignore_fg laserwave.Color | string
---@field keyword_fg laserwave.Color | string
---@field number_fg laserwave.Color | string
---@field operator_fg laserwave.Color | string
---@field string_fg laserwave.Color | string
---@field tag_fg laserwave.Color | string
---@field type_fg laserwave.Color | string
---@field identifier_fg laserwave.Color | string
---@field added_fg laserwave.Color | string
---@field added_bg laserwave.Color | string
---@field deleted_fg laserwave.Color | string
---@field deleted_bg laserwave.Color | string
---@field changed_fg laserwave.Color | string
---@field changed_bg laserwave.Color | string
---@field url laserwave.Color | string
---@field border_active laserwave.Color | string
---@field border_inactive laserwave.Color | string
---@field border_bell laserwave.Color | string
---@field tab_active_fg laserwave.Color | string
---@field tab_active_bg laserwave.Color | string
---@field tab_inactive_fg laserwave.Color | string
---@field tab_inactive_bg laserwave.Color | string
---@field tab_bg laserwave.Color | string
---@field mark1_fg laserwave.Color | string
---@field mark1_bg laserwave.Color | string
---@field mark2_fg laserwave.Color | string
---@field mark2_bg laserwave.Color | string
---@field mark3_fg laserwave.Color | string
---@field mark3_bg laserwave.Color | string

---@class laserwave.TemplatePaletteSpec
local palette_spec = {
  "bg",
  "fg",

  "cursor_fg",
  "cursor_bg",

  "line_bg",

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

  "attribute_fg",
  "class_fg",
  "character_fg",
  "comment_fg",
  "constant_fg",
  "error_fg",
  "function_fg",
  "ignore_fg",
  "keyword_fg",
  "number_fg",
  "operator_fg",
  "string_fg",
  "tag_fg",
  "type_fg",
  "identifier_fg",

  "added_fg",
  "added_bg",
  "deleted_fg",
  "deleted_bg",
  "changed_fg",
  "changed_bg",

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
---@return laserwave.TemplatePalette
function Template.validate_palette(data)
  for _, key in ipairs(palette_spec) do
    if data[key] == nil then
      error("key " .. key .. " is missing")
    end
  end
  return data
end

---@param colors laserwave.TemplatePaletteOptions
---@return laserwave.TemplatePaletteOptions
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

---@param palette laserwave.Palette
---@return laserwave.TemplatePalette
local function palette_defaults(palette)
  return Template.validate_palette(Template.stringify_colors({
    bg = palette.BG,
    fg = palette.FG,

    accent = palette.HIGHLIGHT,

    cursor_fg = palette.FG,
    cursor_bg = palette.BG_CURSOR,

    line_bg = palette.BG_CURSOR_LINE,

    selection_fg = palette.FG,
    selection_bg = palette.BG_VISUAL,

    black = palette.terminal.BLACK,
    red = palette.terminal.RED,
    green = palette.terminal.GREEN,
    yellow = palette.terminal.YELLOW,
    blue = palette.terminal.BLUE,
    magenta = palette.terminal.MAGENTA,
    cyan = palette.terminal.CYAN,
    white = palette.terminal.WHITE,

    bright_black = palette.terminal.BRIGHT_BLACK,
    bright_red = palette.terminal.BRIGHT_RED,
    bright_green = palette.terminal.BRIGHT_GREEN,
    bright_yellow = palette.terminal.BRIGHT_YELLOW,
    bright_blue = palette.terminal.BRIGHT_BLUE,
    bright_magenta = palette.terminal.BRIGHT_MAGENTA,
    bright_cyan = palette.terminal.BRIGHT_CYAN,
    bright_white = palette.terminal.BRIGHT_WHITE,

    attribute_fg = palette.HIGHLIGHT,
    class_fg = palette.TYPE,
    character_fg = palette.OPERATOR,
    comment_fg = palette.COMMENT,
    constant_fg = palette.CONSTANT,
    error_fg = palette.ERROR,
    function_fg = palette.FUNCTION,
    ignore_fg = palette.IGNORE,
    keyword_fg = palette.KEYWORD,
    number_fg = palette.NUMBER,
    operator_fg = palette.OPERATOR,
    string_fg = palette.STRING,
    tag_fg = palette.OPERATOR,
    type_fg = palette.TYPE,
    identifier_fg = palette.VARIABLE,

    added_fg = palette.ADD,
    added_bg = palette.BG_ADD,
    deleted_fg = palette.DELETE,
    deleted_bg = palette.BG_DELETE,
    changed_fg = palette.CHANGE,
    changed_bg = palette.BG_CHANGE,

    url = palette.terminal.BRIGHT_BLUE,

    border_active = palette.terminal.BRIGHT_RED,
    border_inactive = palette.terminal.BRIGHT_BLACK,
    border_bell = palette.terminal.BRIGHT_RED,

    tab_active_fg = palette.FG,
    tab_active_bg = palette.BG:lighten(7),
    tab_inactive_fg = palette.IGNORE,
    tab_inactive_bg = palette.BG:darken(70),
    tab_bg = palette.BG:darken(70),

    -- FIXME: These hardcoded colors should be derived from the palette
    mark1_fg = palette.terminal.BLACK,
    mark1_bg = "#98d3cb",
    mark2_fg = palette.terminal.BLACK,
    mark2_bg = "#f2dcd3",
    mark3_fg = palette.terminal.BLACK,
    mark3_bg = "#f274bc",
  }))
end

---@class laserwave.TemplateOptions : laserwave.TemplateMetaOptions, laserwave.TemplatePaletteOptions
---@class laserwave.TemplateContext : laserwave.TemplateMeta, laserwave.TemplatePalette

---@param opts unknown
---@return laserwave.TemplateContext
function Template.validate_context(opts)
  Template.validate_palette(opts)
  Template.validate_meta(opts)
  return opts
end

---@param with_context laserwave.TemplateOptions | fun(ctx: laserwave.TemplateContext, input: laserwave.TemplateInput):laserwave.TemplateOptions
function Template.with_context(with_context)
  ---@class laserwave.BoundTemplate
  local BoundTemplate = {}

  ---@param template string
  ---@return fun(input: laserwave.TemplateInput): string[]
  function BoundTemplate.create(template)
    ---@param input laserwave.TemplateInput
    local function apply(input)
      local default_context = vim.tbl_extend("force", palette_defaults(input.palette), meta_defaults(input))

      local bound_context
      if type(with_context) == "function" then
        bound_context = with_context(default_context, input)
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

    return function(input)
      local ok, result = pcall(apply, input)

      if not ok then
        vim.notify(string.format("Failed to apply palette:\n%s", result), vim.log.levels.ERROR, { title = "Laserwave" })
        error(result)
      end

      return result
    end
  end

  return BoundTemplate
end

Template.create = Template.with_context({}).create

return Template
