local theme = require("lush_theme.laserwave")

local laserwave = {}

laserwave.normal = {
  a = { bg = theme.ModeNormal.fg.hex, fg = theme.StatusLine.bg.hex },
  b = { bg = theme.StatusLine.bg.hex, fg = theme.ModeNormal.fg.hex },
  c = { bg = theme.StatusLine.bg.hex, fg = theme.StatusLine.fg.hex },
}

laserwave.insert = {
  a = { bg = theme.ModeInsert.fg.hex, fg = theme.StatusLine.bg.hex },
  b = { bg = theme.StatusLine.bg.hex, fg = theme.ModeInsert.fg.hex },
}

laserwave.command = {
  a = { bg = theme.ModeCommand.fg.hex, fg = theme.StatusLine.bg.hex },
  b = { bg = theme.StatusLine.bg.hex, fg = theme.ModeCommand.fg.hex },
}

laserwave.visual = {
  a = { bg = theme.ModeVisual.fg.hex, fg = theme.StatusLine.bg.hex },
  b = { bg = theme.StatusLine.bg.hex, fg = theme.ModeVisual.fg.hex },
}

laserwave.replace = {
  a = { bg = theme.ModeReplace.fg.hex, fg = theme.StatusLine.bg.hex },
  b = { bg = theme.StatusLine.bg.hex, fg = theme.ModeReplace.fg.hex },
}

laserwave.inactive = {
  a = { bg = theme.StatusLineNC.bg.hex, fg = theme.StatusLineNC.fg.hex },
  b = { bg = theme.StatusLineNC.bg.hex, fg = theme.StatusLineNC.fg.hex, gui = "bold" },
  c = { bg = theme.StatusLineNC.bg.hex, fg = theme.StatusLineNC.fg.hex },
}

return laserwave
