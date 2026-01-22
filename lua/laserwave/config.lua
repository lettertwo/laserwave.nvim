---@enum (key) laserwave.SYNTAX_MODE
local SYNTAX_MODE = {
  vim = "vim",
  treesitter = "treesitter",
  lsp = "lsp",
}

---@class laserwave.Options
---@field flavor laserwave.FLAVOR?
---@field syntax_mode laserwave.SYNTAX_MODE?
---@field terminal_colors boolean?
---@field transparent boolean?
---@field italic_comments boolean?
---@field italic_functions boolean?
---@field italic_keywords boolean?
---@field italic_variables boolean?
---@field plugins table<string, boolean>?

---@class laserwave.Config: laserwave.Options
---@field flavor laserwave.FLAVOR
---@field syntax_mode laserwave.SYNTAX_MODE
---@field terminal_colors boolean
---@field transparent boolean
---@field italic_comments boolean
---@field italic_functions boolean
---@field italic_keywords boolean
---@field italic_variables boolean
---@field plugins table<string, boolean>
---@field clone fun(self: laserwave.Config): laserwave.Config
local Config = {
  flavor = "original",
  syntax_mode = SYNTAX_MODE.lsp,
  transparent = false,
  terminal_colors = true,
  italic_comments = true,
  italic_keywords = true,
  italic_functions = false,
  italic_variables = false,
  plugins = {
    blink = true,
    cmp = false,
    git = true,
    mini_pick = true,
    neotree = false,
    obsidian = true,
    occurrence = true,
    package_info = false,
    snacks = true,
    space = true,
    telescope = true,
  },
}

---@module "laserwave.config"
local config = {}

config.SYNTAX_MODE = SYNTAX_MODE

-- Validate the given options.
-- Errors if the options represent an invalid configuration.
---@param opts laserwave.Options
function config.validate(opts)
  vim.validate("config", opts, "table")
  if opts.flavor ~= nil then
    require("laserwave.flavor").validate(opts.flavor)
  end
  vim.validate("syntax_mode", opts.syntax_mode, function(a)
    return vim.tbl_contains(vim.tbl_values(SYNTAX_MODE), a)
  end, true, string.format("one of: %s", table.concat(vim.tbl_values(SYNTAX_MODE), ", ")))
  vim.validate("terminal_colors", opts.terminal_colors, "boolean", true)
  vim.validate("transparent", opts.transparent, "boolean", true)
  vim.validate("italic_comments", opts.italic_comments, "boolean", true)
  vim.validate("italic_functions", opts.italic_functions, "boolean", true)
  vim.validate("italic_keywords", opts.italic_keywords, "boolean", true)
  vim.validate("italic_variables", opts.italic_variables, "boolean", true)
  vim.validate("plugins", opts.plugins, "table", true)
  if opts.plugins then
    vim.validate("plugins", opts.plugins, function(a)
      for plugin_name, enabled in pairs(a) do
        if Config.plugins[plugin_name] == nil then
          error("unsupported plugin: " .. plugin_name)
        else
          vim.validate("plugin." .. plugin_name, enabled, "boolean", true)
        end
      end
      return true
    end, "supported plugin")
  end
end

---@param opts ?laserwave.Options
---@return laserwave.Config
function config.parse(opts)
  if opts ~= nil then
    local ok, err = pcall(config.validate, opts)
    if not ok then
      vim.notify_once(
        string.format("Invalid laserwave config:\n%q\nFalling back to default configuration.", err),
        vim.log.levels.WARN,
        { title = "Laserwave" }
      )
      opts = nil
    end
  end

  local self = vim.tbl_deep_extend("force", {}, Config, opts or {})

  ---@type laserwave.Config
  return setmetatable(self, {
    __index = {
      clone = function()
        return config.parse(self)
      end,
    },
  })
end

return config
