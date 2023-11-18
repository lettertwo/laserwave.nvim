---@class LaserwaveDev: Laserwave
local M = {}

function M.reset()
  for name, _ in pairs(package.loaded) do
    if name:match("^laserwave.") then
      vim.notify("Unloading " .. name, vim.log.levels.DEBUG, { title = "Laserwave" })
      package.loaded[name] = nil
    end
  end

  local mt = getmetatable(M)
  if mt then
    mt.__index = require("laserwave")
  end

  vim.cmd("highlight clear")
end

---@param cfg ParsedLaserwaveConfig
---@param flavor LASERWAVE_FLAVOR_NAME
function M.apply(cfg, flavor)
  local lush = require("lush")

  ---@type CompiledLaserwaveSpecs
  local compiled = require("laserwave.compiler").compile(cfg, flavor)

  local palette = require("laserwave.spec.palette")

  vim.o.background = "dark"
  vim.o.termguicolors = true
  vim.g.colors_name = compiled.colorscheme

  vim.g.terminal_color_0 = palette.terminal.BLACK.hex
  vim.g.terminal_color_1 = palette.terminal.RED.hex
  vim.g.terminal_color_2 = palette.terminal.GREEN.hex
  vim.g.terminal_color_3 = palette.terminal.YELLOW.hex
  vim.g.terminal_color_4 = palette.terminal.BLUE.hex
  vim.g.terminal_color_5 = palette.terminal.MAGENTA.hex
  vim.g.terminal_color_6 = palette.terminal.CYAN.hex
  vim.g.terminal_color_7 = palette.terminal.WHITE.hex
  vim.g.terminal_color_8 = palette.terminal.BRIGHT_BLACK.hex
  vim.g.terminal_color_9 = palette.terminal.BRIGHT_RED.hex
  vim.g.terminal_color_10 = palette.terminal.BRIGHT_GREEN.hex
  vim.g.terminal_color_11 = palette.terminal.BRIGHT_YELLOW.hex
  vim.g.terminal_color_12 = palette.terminal.BRIGHT_BLUE.hex
  vim.g.terminal_color_13 = palette.terminal.BRIGHT_MAGENTA.hex
  vim.g.terminal_color_14 = palette.terminal.BRIGHT_CYAN.hex
  vim.g.terminal_color_15 = palette.terminal.BRIGHT_WHITE.hex

  local spec = compiled.spec

  spec = lush.extends({ spec }).with(function()
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
    ---@diagnostic enable: undefined-global
  end)

  if cfg.treesitter then
    spec = lush.merge({ spec, compiled.plugins.treesitter })
  end

  if cfg.semantic_highlights then
    spec = lush.merge({ spec, compiled.plugins.semantic_highlights })
  end

  for plugin, plugin_enabled in pairs(cfg.plugins) do
    if plugin_enabled then
      local plugin_spec = compiled.plugins[plugin]
      if plugin_spec then
        spec = lush.merge({ spec, plugin_spec })
      else
        vim.notify("Failed to load plugin: " .. plugin, vim.log.levels.ERROR, { title = "Laserwave" })
      end
    end
  end

  lush.apply(spec, { force_clean = false })
  vim.cmd.colorscheme(compiled.colorscheme)
end

---@param options ?LaserwaveOptions
function M.setup(options)
  require("laserwave").setup(options)

  -- TODO: Make this a subcommand of Laserwave
  vim.api.nvim_create_user_command("LaserwaveCompile", function()
    M.reset()
    M.apply(M.get_config(), M.get_flavor())
    vim.notify("Reloaded!", vim.log.levels.DEBUG, { title = "Laserwave" })
  end, {})

  vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("laserwave", { clear = true }),
    pattern = "*/laserwave/*",
    callback = function()
      vim.schedule(function()
        vim.cmd("LaserwaveCompile")
      end)
    end,
  })

  M.apply(M.get_config(), M.get_flavor())
end

setmetatable(M, { __index = require("laserwave") })

return M
