local lush = require("lush")

local M = {}

---@class CompiledLaserwaveSpecs
---@field colorscheme string
---@field spec ParsedLushSpec
---@field plugins table<string, ParsedLushSpec>

---@param config ParsedLaserwaveConfig
---@return CompiledLaserwaveSpecs
function M.compile(config)
  local colorscheme = config.flavor ~= "original" and "laserwave-" .. config.flavor or "laserwave"

  -- clear specs from module cache
  for k, _ in pairs(package.loaded) do
    if k:match("^laserwave.spec") then
      vim.notify("Unloading " .. k, vim.log.levels.DEBUG, { title = "Laserwave" })
      package.loaded[k] = nil
    end
  end

  require("laserwave.spec.flavor").set(config.flavor)

  local result = {
    colorscheme = colorscheme,
    spec = lush.merge({
      require("laserwave.spec.syntax"),
      require("laserwave.spec.ui"),
      require("laserwave.spec.terminal"),
    }),
    plugins = {
      treesitter = require("laserwave.spec.treesitter"),
      semantic_highlights = require("laserwave.spec.semantic_highlights"),
    },
  }

  for plugin in pairs(config.plugins) do
    local plugin_ok, plugin_spec = pcall(require, "laserwave.spec.plugins." .. plugin)
    if plugin_ok then
      result.plugins[plugin] = plugin_spec
    else
      vim.notify("Failed to load plugin: " .. plugin, vim.log.levels.ERROR, { title = "Laserwave" })
    end
  end

  return result
end

return M
