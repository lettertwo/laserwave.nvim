local lush = require("lush")

---@class Config
---@field options ?Options
---@field treesitter ?boolean
---@field semantic_highlights ?boolean
---@field plugins ?string[]

---@class ParsedConfig
---@field options ParsedOptions
---@field treesitter boolean
---@field semantic_highlights boolean
---@field plugins string[]

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
  ---@type ParsedOptions
  options = {
    transparent = false,
    italic_comments = true,
    italic_keywords = true,
    italic_functions = false,
    italic_variables = false,
  },
  treesitter = true,
  semantic_highlights = true,
  plugins = {
    "alpha",
    "cmp",
    "git",
    "lsp",
    "neotree",
    "package_info",
    "space",
    "telescope",
  },
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
  local plugins = config.plugins

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

    if config_table.plugins then
      plugins = config_table.plugins
    end
  end

  return {
    options = options,
    treesitter = treesitter,
    semantic_highlights = semantic_highlights,
    plugins = plugins,
  }
end

---@param specs ParsedLushSpec[]
---@param config_table ?Config
---@return ParsedLushSpec
function config.apply(specs, config_table)
  local cfg = config.parse(config_table)

  local spec = lush.merge(specs)

  spec = lush.extends(specs).with(function()
    ---@diagnostic disable: undefined-global
    --stylua: ignore start
    return {
      Normal     { spec.Normal,     bg =  cfg.options.transparent and "NONE" or spec.Normal.bg },
      Comment    { spec.Comment,    gui = cfg.options.italic_comments and "italic" or "NONE" },
      Function   { spec.Function,   gui = cfg.options.italic_functions and "italic" or "NONE" },
      Statement  { spec.Statement,  gui = cfg.options.italic_keywords and "italic" or "NONE" },
      Identifier { spec.Identifier, gui = cfg.options.italic_variables and "italic" or "NONE" },
    }
    --stylua: ignore end
  end)

  if cfg.treesitter then
    spec = lush.merge({ spec, require("laserwave.treesitter") })
  end

  if cfg.semantic_highlights then
    spec = lush.merge({ spec, require("laserwave.semantic_highlights") })
  end

  for _, plugin in ipairs(cfg.plugins) do
    local plugin_ok, plugin_spec = pcall(require, "laserwave.plugins." .. plugin)
    if plugin_ok then
      spec = lush.merge({ spec, plugin_spec })
    else
      vim.notify("Failed to load plugin: " .. plugin, vim.log.levels.ERROR, { title = "Laserwave" })
    end
  end

  return spec
end

return config
