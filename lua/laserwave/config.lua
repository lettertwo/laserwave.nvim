---@class laserwave.Config
---@field options ?laserwave.Options
---@field treesitter ?boolean
---@field semantic_highlights ?boolean
---@field terminal_colors ?boolean
---@field plugins ?table<string, boolean>
---@field dev ?boolean

---@class laserwave.ParsedConfig
---@field options laserwave.ParsedOptions
---@field treesitter boolean
---@field semantic_highlights boolean
---@field terminal_colors boolean
---@field plugins table<string, boolean>
---@field dev boolean

---@class laserwave.Options
---@field transparent ?boolean
---@field italic_comments ?boolean
---@field italic_functions ?boolean
---@field italic_keywords ?boolean
---@field italic_variables ?boolean

---@class laserwave.ParsedOptions
---@field transparent boolean
---@field italic_comments boolean
---@field italic_functions boolean
---@field italic_keywords boolean
---@field italic_variables boolean

---@class laserwave.DefaultConfig
local config = {
  ---@type laserwave.ParsedOptions
  options = {
    transparent = false,
    italic_comments = true,
    italic_keywords = true,
    italic_functions = false,
    italic_variables = false,
  },
  terminal_colors = true,
  treesitter = true,
  semantic_highlights = true,
  plugins = {
    alpha = false,
    blink = true,
    cmp = false,
    git = true,
    lsp = true,
    mini_pick = true,
    neotree = false,
    obsidian = true,
    occurrence = true,
    package_info = false,
    snacks = true,
    space = true,
    telescope = true,
  },
  dev = false,
  -- TODO: Support lanaguage-specific highlights?
  -- filetypes = {}
}

---@param config_table ?laserwave.Config
---@return laserwave.ParsedConfig
function config.parse(config_table)
  ---@type laserwave.ParsedOptions
  local options = config.options
  local treesitter = config.treesitter
  local semantic_highlights = config.semantic_highlights
  local terminal_colors = config.terminal_colors
  local plugins = config.plugins
  local dev = config.dev

  if config_table then
    if config_table.options then
      ---@diagnostic disable-next-line: undefined-global
      options = vim.tbl_extend("force", options, config_table.options)
    end

    if config_table.treesitter ~= nil then
      treesitter = config_table.treesitter
    end

    if config_table.semantic_highlights ~= nil then
      semantic_highlights = config_table.semantic_highlights
    end

    if config_table.terminal_colors ~= nil then
      terminal_colors = config_table.terminal_colors
    end

    if config_table.plugins then
      plugins = config_table.plugins
    end

    if config_table.dev ~= nil then
      dev = config_table.dev
    end
  end

  ---@type laserwave.ParsedConfig
  return vim.tbl_extend("force", config, {
    options = options,
    dev = dev,
    treesitter = treesitter,
    semantic_highlights = semantic_highlights,
    terminal_colors = terminal_colors,
    plugins = plugins,
  })
end

return config
