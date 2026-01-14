local helpers = require("shipwright.transform.helpers")

---@class LaserwaveTemplate
local Template = {}

---@class LaserwaveTemplateMetaOptions
---@field name? string
---@field flavor? string
---@field author? string
---@field license? string
---@field upstream? string
---@field blurb? string
---@field date? string
---@field time? string

---@class LaserwaveTemplateMeta
---@field name string
---@field flavor string
---@field author string
---@field license string
---@field upstream string
---@field blurb string
---@field date string
---@field time string

---@class LaserwaveTemplateMetaSpec
local meta_spec = {
  "name",
  "flavor",
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

---@param spec LaserwaveSpec
---@return LaserwaveTemplateMeta
local function meta_defaults(spec)
  return Template.validate_meta({
    name = spec.name or "laserwave",
    flavor = spec.flavor or "original",
    author = spec.author or "Eric Eldredge <lettertwo@gmail.com>",
    license = spec.license or "MIT",
    upstream = spec.upstream or "https://github.com/lettertwo/laserwave.nvim",
    blurb = spec.blurb or "Based on LaserWave for VSCode by Jared Jones",
    date = spec.date or "UNKNOWN",
    time = spec.time or "UNKNOWN",
  })
end

---@class LaserwaveTemplatePaletteOptions
---@field bg? LaserwaveColor | string
---@field fg? LaserwaveColor | string
---@field cursor_fg? LaserwaveColor | string
---@field cursor_bg? LaserwaveColor | string
---@field line_bg? LaserwaveColor | string
---@field selection_fg? LaserwaveColor | string
---@field selection_bg? LaserwaveColor | string
---@field black? LaserwaveColor | string
---@field red? LaserwaveColor | string
---@field green? LaserwaveColor | string
---@field yellow? LaserwaveColor | string
---@field blue? LaserwaveColor | string
---@field magenta? LaserwaveColor | string
---@field cyan? LaserwaveColor | string
---@field white? LaserwaveColor | string
---@field bright_black? LaserwaveColor | string
---@field bright_red? LaserwaveColor | string
---@field bright_green? LaserwaveColor | string
---@field bright_yellow? LaserwaveColor | string
---@field bright_blue? LaserwaveColor | string
---@field bright_magenta? LaserwaveColor | string
---@field bright_cyan? LaserwaveColor | string
---@field bright_white? LaserwaveColor | string
---@field attribute_fg? LaserwaveColor | string
---@field class_fg? LaserwaveColor | string
---@field character_fg? LaserwaveColor | string
---@field comment_fg? LaserwaveColor | string
---@field constant_fg? LaserwaveColor | string
---@field error_fg? LaserwaveColor | string
---@field function_fg? LaserwaveColor | string
---@field ignore_fg? LaserwaveColor | string
---@field keyword_fg? LaserwaveColor | string
---@field number_fg? LaserwaveColor | string
---@field operator_fg? LaserwaveColor | string
---@field string_fg? LaserwaveColor | string
---@field tag_fg? LaserwaveColor | string
---@field type_fg? LaserwaveColor | string
---@field identifier_fg? LaserwaveColor | string
---@field added_fg? LaserwaveColor | string
---@field added_bg? LaserwaveColor | string
---@field deleted_fg? LaserwaveColor | string
---@field deleted_bg? LaserwaveColor | string
---@field changed_fg? LaserwaveColor | string
---@field changed_bg? LaserwaveColor | string
---@field url? LaserwaveColor | string
---@field border_active? LaserwaveColor | string
---@field border_inactive? LaserwaveColor | string
---@field border_bell? LaserwaveColor | string
---@field tab_active_fg? LaserwaveColor | string
---@field tab_active_bg? LaserwaveColor | string
---@field tab_inactive_fg? LaserwaveColor | string
---@field tab_inactive_bg? LaserwaveColor | string
---@field tab_bg? LaserwaveColor | string
---@field mark1_fg? LaserwaveColor | string
---@field mark1_bg? LaserwaveColor | string
---@field mark2_fg? LaserwaveColor | string
---@field mark2_bg? LaserwaveColor | string
---@field mark3_fg? LaserwaveColor | string
---@field mark3_bg? LaserwaveColor | string

---@class LaserwaveTemplatePalette
---@field bg LaserwaveColor | string
---@field fg LaserwaveColor | string
---@field cursor_fg LaserwaveColor | string
---@field cursor_bg LaserwaveColor | string
---@field line_bg LaserwaveColor | string
---@field selection_fg LaserwaveColor | string
---@field selection_bg LaserwaveColor | string
---@field black LaserwaveColor | string
---@field red LaserwaveColor | string
---@field green LaserwaveColor | string
---@field yellow LaserwaveColor | string
---@field blue LaserwaveColor | string
---@field magenta LaserwaveColor | string
---@field cyan LaserwaveColor | string
---@field white LaserwaveColor | string
---@field bright_black LaserwaveColor | string
---@field bright_red LaserwaveColor | string
---@field bright_green LaserwaveColor | string
---@field bright_yellow LaserwaveColor | string
---@field bright_blue LaserwaveColor | string
---@field bright_magenta LaserwaveColor | string
---@field bright_cyan LaserwaveColor | string
---@field bright_white LaserwaveColor | string
---@field attribute_fg LaserwaveColor | string
---@field class_fg LaserwaveColor | string
---@field character_fg LaserwaveColor | string
---@field comment_fg LaserwaveColor | string
---@field constant_fg LaserwaveColor | string
---@field error_fg LaserwaveColor | string
---@field function_fg LaserwaveColor | string
---@field ignore_fg LaserwaveColor | string
---@field keyword_fg LaserwaveColor | string
---@field number_fg LaserwaveColor | string
---@field operator_fg LaserwaveColor | string
---@field string_fg LaserwaveColor | string
---@field tag_fg LaserwaveColor | string
---@field type_fg LaserwaveColor | string
---@field identifier_fg LaserwaveColor | string
---@field added_fg LaserwaveColor | string
---@field added_bg LaserwaveColor | string
---@field deleted_fg LaserwaveColor | string
---@field deleted_bg LaserwaveColor | string
---@field changed_fg LaserwaveColor | string
---@field changed_bg LaserwaveColor | string
---@field url LaserwaveColor | string
---@field border_active LaserwaveColor | string
---@field border_inactive LaserwaveColor | string
---@field border_bell LaserwaveColor | string
---@field tab_active_fg LaserwaveColor | string
---@field tab_active_bg LaserwaveColor | string
---@field tab_inactive_fg LaserwaveColor | string
---@field tab_inactive_bg LaserwaveColor | string
---@field tab_bg LaserwaveColor | string
---@field mark1_fg LaserwaveColor | string
---@field mark1_bg LaserwaveColor | string
---@field mark2_fg LaserwaveColor | string
---@field mark2_bg LaserwaveColor | string
---@field mark3_fg LaserwaveColor | string
---@field mark3_bg LaserwaveColor | string

---@class LaserwaveTemplatePaletteSpec
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

---@param spec LaserwaveSpec
---@return LaserwaveTemplatePalette
local function palette_defaults(spec)
  return Template.validate_palette(Template.stringify_colors({
    bg = spec.Normal.bg,
    fg = spec.Normal.fg,

    accent = spec.WinSeparator.fg,

    cursor_fg = spec.Cursor.fg,
    cursor_bg = spec.Cursor.bg,

    line_bg = spec.CursorLine.bg,

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

    attribute_fg = spec.Attribute.fg,
    class_fg = spec.Type.fg,
    character_fg = spec.Character.fg,
    comment_fg = spec.Comment.fg,
    constant_fg = spec.Constant.fg,
    error_fg = spec.Error.fg,
    function_fg = spec.Function.fg,
    ignore_fg = spec.Ignore.fg,
    keyword_fg = spec.Keyword.fg,
    number_fg = spec.Number.fg,
    operator_fg = spec.Operator.fg,
    string_fg = spec.String.fg,
    tag_fg = spec.Tag.fg,
    type_fg = spec.Type.fg,
    identifier_fg = spec.Identifier.fg,

    added_fg = spec.Add.fg,
    added_bg = spec.DiffAdd.bg,
    deleted_fg = spec.Delete.fg,
    deleted_bg = spec.DiffDelete.bg,
    changed_fg = spec.Change.fg,
    changed_bg = spec.DiffChange.bg,

    -- FIXME: These hardcoded colors should  be derived from the spec
    url = spec.TerminalBrightBlue.fg,

    border_active = spec.TerminalBrightRed.fg,
    border_inactive = spec.TerminalBrightBlack.fg,
    border_bell = spec.TerminalBrightRed.fg,

    tab_active_fg = spec.Normal.fg,
    tab_active_bg = spec.Normal.bg:lighten(7),
    tab_inactive_fg = spec.NonText.fg,
    tab_inactive_bg = spec.Normal.bg:darken(70),
    tab_bg = spec.Normal.bg:darken(70),

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

---@param with_context LaserwaveTemplateOptions | fun(ctx: LaserwaveTemplateContext, spec: LaserwaveSpec):LaserwaveTemplateOptions
function Template.with_context(with_context)
  ---@class BoundLaserwaveTemplate
  local BoundTemplate = {}

  ---@param template string
  ---@return fun(spec: LaserwaveSpec): string[]
  function BoundTemplate.create(template)
    ---@param spec LaserwaveSpec
    local function apply(spec)
      local default_context = vim.tbl_extend("force", palette_defaults(spec), meta_defaults(spec))

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
        vim.notify(string.format("Failed to apply spec:\n%s", result), vim.log.levels.ERROR, { title = "Laserwave" })
        error(result)
      end

      return result
    end
  end

  return BoundTemplate
end

Template.create = Template.with_context({}).create

return Template
