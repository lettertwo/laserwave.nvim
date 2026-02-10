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

---@param groups laserwave.Groups
---@param highlights table<string, vim.api.keyset.highlight>
---@param extend boolean?
local function collect_groups(groups, highlights, extend)
  for name, group in pairs(groups) do
    local highlight = group_to_highlight(group)
    if extend and highlights[name] then
      highlight = vim.tbl_extend("force", highlights[name], highlight)
    end
    highlights[name] = highlight
  end
end

---@module "laserwave.groups"
local M = {}

---@param flavor laserwave.FLAVOR
---@param config laserwave.Config
---@return { highlights: table<string, vim.api.keyset.highlight>, terminal_colors: table<string, string> }
function M.collect(flavor, config)
  require("laserwave.flavor").set(flavor)
  local palette = require("laserwave.palette")

  local highlights = {}

  collect_groups(require("laserwave.groups.syntax"), highlights)
  collect_groups(require("laserwave.groups.ui"), highlights)

  if config.transparent then
    collect_groups({ Normal = { bg = nil } }, highlights, true)
  end

  collect_groups({
    Comment = { italic = config.italic_comments },
    Function = { italic = config.italic_functions },
    Statement = { italic = config.italic_keywords },
    Keyword = { italic = config.italic_keywords },
    Include = { italic = config.italic_keywords },
    Identifier = { italic = config.italic_variables },
  }, highlights, true)

  for key, value in pairs(config.plugins) do
    if value then
      local plugin_ok, plugin_result = pcall(require, "laserwave.groups.plugins." .. key)
      if plugin_ok and plugin_result then
        collect_groups(plugin_result, highlights)
      else
        vim.notify(
          "Failed to load plugin highlights for " .. key .. ":\n" .. tostring(plugin_result),
          vim.log.levels.WARN,
          { title = "Laserwave" }
        )
      end
    end
  end

  if config.syntax_mode ~= "vim" then
    collect_groups(require("laserwave.groups.treesitter"), highlights)
  end

  if config.syntax_mode == "lsp" then
    collect_groups(require("laserwave.groups.semantic_highlights"), highlights)
  end

  local terminal_colors = {}
  terminal_colors["0"] = tostring(palette.terminal.BLACK)
  terminal_colors["1"] = tostring(palette.terminal.RED)
  terminal_colors["2"] = tostring(palette.terminal.GREEN)
  terminal_colors["3"] = tostring(palette.terminal.YELLOW)
  terminal_colors["4"] = tostring(palette.terminal.BLUE)
  terminal_colors["5"] = tostring(palette.terminal.MAGENTA)
  terminal_colors["6"] = tostring(palette.terminal.CYAN)
  terminal_colors["7"] = tostring(palette.terminal.WHITE)
  terminal_colors["8"] = tostring(palette.terminal.BRIGHT_BLACK)
  terminal_colors["9"] = tostring(palette.terminal.BRIGHT_RED)
  terminal_colors["10"] = tostring(palette.terminal.BRIGHT_GREEN)
  terminal_colors["11"] = tostring(palette.terminal.BRIGHT_YELLOW)
  terminal_colors["12"] = tostring(palette.terminal.BRIGHT_BLUE)
  terminal_colors["13"] = tostring(palette.terminal.BRIGHT_MAGENTA)
  terminal_colors["14"] = tostring(palette.terminal.BRIGHT_CYAN)
  terminal_colors["15"] = tostring(palette.terminal.BRIGHT_WHITE)

  return {
    background = palette.background,
    highlights = highlights,
    terminal_colors = terminal_colors,
  }
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

  local cache = require("laserwave.cache")
  ---@class laserwave.CacheInputs
  local inputs = {
    cache_version = require("laserwave").CACHE_VERSION,
    flavor = config.flavor,
    syntax_mode = config.syntax_mode,
    transparent = config.transparent,
    terminal_colors = config.terminal_colors,
    italic_comments = config.italic_comments,
    italic_functions = config.italic_functions,
    italic_keywords = config.italic_keywords,
    italic_variables = config.italic_variables,
    plugins = config.plugins,
  }

  local data
  local cached = cache.read(flavor)
  if cached and vim.deep_equal(cached.inputs, inputs) then
    data = cached
  else
    data = M.collect(flavor, config)
    ---@cast data +{ inputs: laserwave.CacheInputs }
    data.inputs = inputs
    cache.write(flavor, data)
  end

  vim.o.background = data.background
  vim.o.termguicolors = true
  vim.g.colors_name = flavor == "original" and "laserwave" or "laserwave-" .. flavor

  if config.terminal_colors then
    for i = 0, 15 do
      vim.g["terminal_color_" .. i] = data.terminal_colors[tostring(i)]
    end
  end

  for name, highlight in pairs(data.highlights) do
    if not pcall(vim.api.nvim_set_hl, 0, name, highlight) then
      vim.notify(
        "Failed to set highlight for group: " .. vim.inspect(highlight),
        vim.log.levels.WARN,
        { title = "Laserwave" }
      )
    end
  end
end

return M
