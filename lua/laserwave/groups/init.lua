---@class laserwave.Group
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

---@alias laserwave.Groups table<string, laserwave.Group | string>

---@param value laserwave.Group | string
---@return vim.api.keyset.highlight
local function group_to_highlight(value)
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

---@module "laserwave.groups"
local M = {}

---@param groups laserwave.Groups
---@param extend boolean?
function M.apply_groups(groups, extend)
  for name, group in pairs(groups) do
    local highlight = group_to_highlight(group)
    if extend then
      local base = vim.api.nvim_get_hl(0, { name = name }) or {}
      highlight = vim.tbl_extend("force", base, highlight)
    end
    if not pcall(vim.api.nvim_set_hl, 0, name, highlight) then
      vim.notify(
        "Failed to set highlight for group: " .. vim.inspect(highlight),
        vim.log.levels.WARN,
        { title = "Laserwave" }
      )
    end
  end
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

  vim.o.background = palette.background
  vim.o.termguicolors = true
  vim.g.colors_name = flavor == "original" and "laserwave" or "laserwave-" .. flavor

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

  M.apply_groups(require("laserwave.groups.syntax"))
  M.apply_groups(require("laserwave.groups.ui"))

  if config.transparent then
    M.apply_groups({ Normal = { bg = nil } }, true)
  end

  M.apply_groups({
    Comment = { italic = config.italic_comments },
    Function = { italic = config.italic_functions },
    Statement = { italic = config.italic_keywords },
    Keyword = { italic = config.italic_keywords },
    Include = { italic = config.italic_keywords },
    Identifier = { italic = config.italic_variables },
  }, true)

  -- apply enabled plugin highlights
  for key, value in pairs(config.plugins) do
    if value then
      local plugin_ok, plugin_result = pcall(require, "laserwave.groups.plugins." .. key)
      if plugin_ok and plugin_result then
        M.apply_groups(plugin_result)
      else
        vim.notify(
          "Failed to load plugin highlights for " .. key .. ":\n" .. tostring(plugin_result),
          vim.log.levels.WARN,
          { title = "Laserwave" }
        )
      end
    end
  end

  -- all syntax modes except "vim" use treesitter highlights
  if config.syntax_mode ~= "vim" then
    M.apply_groups(require("laserwave.groups.treesitter"))
  end

  if config.syntax_mode == "lsp" then
    M.apply_groups(require("laserwave.groups.semantic_highlights"))
  end
end

return M
