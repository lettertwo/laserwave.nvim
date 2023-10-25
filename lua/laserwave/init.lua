--                  (&&&&&&&&&&&&&&&&&&&(
--             ,&&&&&&&&&&&&&&&&&&&&&&&&&&&&&,
--          &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
--        &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
--      &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
--    &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
--   &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
--  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
--
-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
--
-- *%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*
--
--   ###################################################
--
--     ###############################################
--       ###########################################
--
--            #######(#############(##########(
--
--       _      _   ___ ___ _____      _____   _____
--      | |    /_\ / __| __| _ \ \    / /_\ \ / / __|
--      | |__ / _ \\__ \ _||   /\ \/\/ / _ \ V /| _|
--      |____/_/ \_\___/___|_|_\ \_/\_/_/ \_\_/ |___|
--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--
local M = {}

function M.apply()
  if M.spec == nil then
    M.setup(M.options)
  end

  if M.spec == nil then
    error("Laserwave: Spec is nil")
  end

  local palette = require("laserwave.palette")

  ---@diagnostic disable: undefined-global
  vim.o.background = "dark"
  vim.g.colors_name = "laserwave"

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
  ---@diagnostic enable: undefined-global

  require("lush")(M.spec, { force_clean = false })
end

---@param options ?Config
function M.setup(options)
  M.options = options

  ---@type ParsedConfig
  local cfg = require("laserwave.config").parse(options)

  M.spec = require("laserwave.config").apply({
    require("laserwave.syntax"),
    require("laserwave.ui"),
  }, cfg)

  vim.api.nvim_create_user_command("LaserwaveCompile", function()
    for name, _ in pairs(package.loaded) do
      if name:match("^laserwave.") then
        vim.notify("Unloading " .. name, vim.log.levels.DEBUG, { title = "Laserwave" })
        package.loaded[name] = nil
      end
    end
    M.spec = nil
    M.apply()
    vim.notify("Reloaded!", vim.log.levels.INFO, { title = "Laserwave" })
    vim.cmd.colorscheme("laserwave")
  end, {})

  if cfg.debug then
    vim.api.nvim_create_autocmd("BufWritePost", {
      group = vim.api.nvim_create_augroup("laserwave", { clear = true }),
      pattern = "*/laserwave/*",
      callback = function()
        vim.schedule(function()
          vim.cmd("LaserwaveCompile")
        end)
      end,
    })
  end
end

return M
