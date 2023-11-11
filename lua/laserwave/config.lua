---@class Config
---@field options ?Options
---@field treesitter ?boolean
---@field semantic_highlights ?boolean
---@field terminal_colors ?boolean
---@field plugins ?table<string, boolean>
---@field debug ?boolean
---@field flavor ?FLAVOR_NAME

---@class ParsedConfig
---@field options ParsedOptions
---@field treesitter boolean
---@field semantic_highlights boolean
---@field terminal_colors boolean
---@field plugins table<string, boolean>
---@field debug boolean
---@field flavor FLAVOR_NAME

---@class Options
---@field transparent ?boolean
---@field italic_comments ?boolean
---@field italic_functions ?boolean
---@field italic_keywords ?boolean
---@field italic_variables ?boolean

---@class ParsedOptions
---@field transparent boolean
---@field italic_comments boolean
---@field italic_functions boolean
---@field italic_keywords boolean
---@field italic_variables boolean

---@class DefaultConfig
local config = {
  flavor = "original",
  ---@type ParsedOptions
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
    alpha = true,
    cmp = true,
    git = true,
    lsp = true,
    neotree = true,
    package_info = true,
    space = true,
    telescope = true,
  },
  debug = false,
  -- TODO: Support lanaguage-specific highlights?
  -- filetypes = {}
}

---@param config_table ?Config
---@return ParsedConfig
function config.parse(config_table)
  ---@type ParsedOptions
  local options = config.options
  local treesitter = config.treesitter
  local semantic_highlights = config.semantic_highlights
  local terminal_colors = config.terminal_colors
  local plugins = config.plugins
  local debug = config.debug
  local flavor = config.flavor

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

    if config_table.debug ~= nil then
      debug = config_table.debug
    end

    if config_table.flavor ~= nil then
      flavor = config_table.flavor
    end
  end

  ---@type ParsedConfig
  return vim.tbl_extend("force", config, {
    options = options,
    debug = debug,
    flavor = flavor,
    treesitter = treesitter,
    semantic_highlights = semantic_highlights,
    terminal_colors = terminal_colors,
    plugins = plugins,
  })
end

return config
