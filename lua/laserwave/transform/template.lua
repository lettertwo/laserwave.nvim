local helpers = require("shipwright.transform.helpers")

local M = {}

---@class LaserwaveTemplateMetaOptions
---@field name? string
---@field author? string
---@field license? string
---@field upstream? string
---@field blurb? string

---@class LaserwaveTemplateMetaSpec
local meta_spec = {
  "name",
  "author",
  "license",
  "upstream",
  "blurb",
}

---@class LaserwaveTemplateMeta
M.meta_defaults = {
  name = "laserwave",
  author = "Eric Eldredge <lettertwo@gmail.com>",
  license = "MIT",
  upstream = "https://github.com/lettertwo/laserwave.nvim",
  blurb = "Based on LaserWave for VSCode by Jared Jones",
}

---@class LaserwaveTemplateContext: LaserwaveTemplateMetaOptions, LaserwaveTransformPaletteOptions

---@param fn_or_ctx LaserwaveTemplateContext | fun(ctx: LaserwaveTemplateContext): LaserwaveTemplateContext
local function create_with_context(fn_or_ctx)
  ---@class LaserwaveTemplate
  local C = {}
  ---@param template string
  ---@param meta? LaserwaveTemplateContext?
  ---@return fun(palette: LaserwaveTransformPalette): string[]
  function C.create(template, meta)
    meta = vim.tbl_extend("force", M.meta_defaults, meta or {})

    for _, key in ipairs(meta_spec) do
      assert(meta[key] ~= nil, "meta key " .. key .. " is missing")
    end

    return function(palette)
      local context = vim.tbl_extend("force", palette, meta)
      context = vim.tbl_extend("force", context, type(fn_or_ctx) == "function" and fn_or_ctx(context) or fn_or_ctx)

      local stringified = helpers.apply_template(template, context)
      local lines = {}

      for s in string.gmatch(stringified, "(.*)\n") do
        table.insert(lines, s)
      end

      return lines
    end
  end
  return C
end

M.with_context = create_with_context
M.create = create_with_context({})

return M
