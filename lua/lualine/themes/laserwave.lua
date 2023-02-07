local palette = require("laserwave.palette")
local ui = require("laserwave.ui")

local laserwave = {}

laserwave.normal = {
  a = { bg = palette.NORMAL.hex, fg = ui.StatusLine.bg.hex },
  b = { bg = ui.StatusLine.bg.hex, fg = palette.NORMAL.hex },
  c = { bg = ui.StatusLine.bg.hex, fg = ui.StatusLine.fg.hex },
}

laserwave.insert = {
  a = { bg = palette.INSERT.hex, fg = ui.StatusLine.bg.hex },
  b = { bg = ui.StatusLine.bg.hex, fg = palette.INSERT.hex },
}

laserwave.command = {
  a = { bg = palette.COMMAND.hex, fg = ui.StatusLine.bg.hex },
  b = { bg = ui.StatusLine.bg.hex, fg = palette.COMMAND.hex },
}

laserwave.visual = {
  a = { bg = palette.VISUAL.hex, fg = ui.StatusLine.bg.hex },
  b = { bg = ui.StatusLine.bg.hex, fg = palette.VISUAL.hex },
}

laserwave.replace = {
  a = { bg = palette.REPLACE.hex, fg = ui.StatusLine.bg.hex },
  b = { bg = ui.StatusLine.bg.hex, fg = palette.REPLACE.hex },
}

laserwave.inactive = {
  a = { bg = ui.StatusLineNC.bg.hex, fg = ui.StatusLineNC.fg.hex },
  b = { bg = ui.StatusLineNC.bg.hex, fg = ui.StatusLineNC.fg.hex, gui = "bold" },
  c = { bg = ui.StatusLineNC.bg.hex, fg = ui.StatusLineNC.fg.hex },
}

return laserwave
