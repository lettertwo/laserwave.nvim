---@class laserwave.Options
---@field treesitter ?boolean
---@field semantic_highlights ?boolean
---@field terminal_colors ?boolean
---@field transparent ?boolean
---@field italic_comments ?boolean
---@field italic_functions ?boolean
---@field italic_keywords ?boolean
---@field italic_variables ?boolean
---@field plugins ?table<string, boolean>

---@class laserwave.Config: laserwave.Options
---@field treesitter boolean
---@field semantic_highlights boolean
---@field terminal_colors boolean
---@field transparent boolean
---@field italic_comments boolean
---@field italic_functions boolean
---@field italic_keywords boolean
---@field italic_variables boolean
---@field plugins table<string, boolean>
---@field clone fun(self: laserwave.Config): laserwave.Config
local Config = {
  transparent = false,
  terminal_colors = true,
  treesitter = true,
  semantic_highlights = true,
  italic_comments = true,
  italic_keywords = true,
  italic_functions = false,
  italic_variables = false,
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
}

---@module "laserwave.config"
local config = {}

---Validate the given options.
---Returns error message if the options represent an invalid configuration.
---@param opts laserwave.Options
---@return string? error_message
function config.validate(opts)
  local ok, err = pcall(function()
    vim.validate("config", opts, "table")
    vim.validate("treesitter", opts.treesitter, "boolean", true)
    vim.validate("semantic_highlights", opts.semantic_highlights, "boolean", true)
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
  end)

  if not ok then
    return tostring(err)
  end

  return nil
end

---@param opts ?laserwave.Options
---@return laserwave.Config
function config.parse(opts)
  if opts ~= nil then
    local err = config.validate(opts)
    if err then
      vim.notify_once(
        "Invalid laserwave config: " .. err .. ". Falling back to default configuration.",
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
