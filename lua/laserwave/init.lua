---@param options Config
local function config(options)
  package.loaded["laserwave.base"] = nil
  package.loaded["laserwave.config"] = nil

  local palette = require("laserwave.palette")
  local base = require("laserwave.base")
  local defaults = require("laserwave.config")

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

  return defaults.apply(base, options)
end

local function apply()
  require("lush")(config(), { force_clean = false })
end

return { config = config, apply = apply }
