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

---@param value laserwave.SpecValue | string
---@return vim.api.keyset.highlight
local function spec_value_to_highlight(value)
  if type(value) == "string" then
    return { link = value }
  end
  return vim.iter(value):fold({}, function(acc, key)
    local val = value[key]
    if type(val) == "number" or type(val) == "boolean" then
      acc[key] = val
    else
      acc[key] = tostring(val)
    end
    return acc
  end)
end

---@module "laserwave.spec"
local M = {}

---@param spec laserwave.Spec
---@param extend boolean?
function M.apply_spec(spec, extend)
  for group, value in pairs(spec) do
    local highlight = spec_value_to_highlight(value)
    if extend then
      local base = vim.api.nvim_get_hl(0, { name = group }) or {}
      highlight = vim.tbl_extend("force", base, highlight)
    end
    if not pcall(vim.api.nvim_set_hl, 0, group, highlight) then
      vim.notify(
        "Failed to set highlight for group: " .. vim.inspect(highlight),
        vim.log.levels.WARN,
        { title = "Laserwave" }
      )
    end
  end
end

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

---@param flavor laserwave.FLAVOR
---@param config laserwave.Config?
function M.apply(flavor, config)
  -- Reset all highlights to the defaults
  vim.cmd("highlight clear")
  -- Reset all semantic highlights
  for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
  end

  config = config or require("laserwave").get_config()
  require("laserwave.flavor").set(flavor)
  local palette = require("laserwave.palette")

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

  vim.o.background = palette.background
  vim.o.termguicolors = true
  vim.g.colors_name = flavor == "original" and "laserwave" or "laserwave-" .. flavor

  M.apply_spec(specs.spec)

  if config.terminal_colors then
    vim.g.terminal_color_0 = tostring(palette.terminal.BLACK)
    vim.g.terminal_color_1 = tostring(palette.terminal.RED)
    vim.g.terminal_color_2 = tostring(palette.terminal.BLUE)
    vim.g.terminal_color_3 = tostring(palette.terminal.YELLOW)
    vim.g.terminal_color_4 = tostring(palette.terminal.BLUE)
    vim.g.terminal_color_5 = tostring(palette.terminal.MAGENTA)
    vim.g.terminal_color_6 = tostring(palette.terminal.CYAN)
    vim.g.terminal_color_7 = tostring(palette.terminal.WHITE)
    vim.g.terminal_color_8 = tostring(palette.terminal.BRIGHT_BLACK)
    vim.g.terminal_color_9 = tostring(palette.terminal.BRIGHT_RED)
    vim.g.terminal_color_10 = tostring(palette.terminal.BRIGHT_GREEN)
    vim.g.terminal_color_11 = tostring(palette.terminal.BRIGHT_YELLOW)
    vim.g.terminal_color_12 = tostring(palette.terminal.BRIGHT_BLUE)
    vim.g.terminal_color_13 = tostring(palette.terminal.BRIGHT_MAGENTA)
    vim.g.terminal_color_14 = tostring(palette.terminal.BRIGHT_CYAN)
    vim.g.terminal_color_15 = tostring(palette.terminal.BRIGHT_WHITE)
  end

  if config.transparent then
    M.apply_spec({ Normal = { bg = nil } }, true)
  end

  M.apply_spec({
    Comment = { italic = config.italic_comments },
    Function = { italic = config.italic_functions },
    Statement = { italic = config.italic_keywords },
    Keyword = { italic = config.italic_keywords },
    Include = { italic = config.italic_keywords },
    Identifier = { italic = config.italic_variables },
  }, true)

  for key, value in pairs(config.plugins) do
    if value and specs.plugins[key] then
      M.apply_spec(specs.plugins[key])
    end
  end

  -- all syntax modes except "vim" use treesitter highlights
  if config.syntax_mode ~= "vim" then
    M.apply_spec(specs.plugins.treesitter)
  end

  if config.syntax_mode == "lsp" then
    M.apply_spec(specs.plugins.semantic_highlights)
  end
end

return M
