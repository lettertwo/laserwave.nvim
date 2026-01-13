-- GENERATED ON 2026-01-13 AT 00:21:42
-- name:     laserwave
-- author:   Eric Eldredge <lettertwo@gmail.com>
-- license:  MIT
-- upstream: https://github.com/lettertwo/laserwave.nvim/lua/lualine/themes/laserwave.lua
-- blurb:    Based on LaserWave for VSCode by Jared Jones
local laserwave = {}
laserwave.normal = {
  a = { bg = "#40B4C4", fg = "#241E2B" },
  b = { bg = "#383041", fg = "#40B4C4" },
  c = { bg = "#241E2B", fg = "#FFFFFF" },
}
laserwave.insert = {
  a = { bg = "#74DFC4", fg = "#241E2B" },
  b = { bg = "#383041", fg = "#74DFC4" },
}
laserwave.command = {
  a = { bg = "#FFE261", fg = "#241E2B" },
  b = { bg = "#383041", fg = "#FFE261" },
}
laserwave.visual = {
  a = { bg = "#B381C5", fg = "#241E2B" },
  b = { bg = "#383041", fg = "#B381C5" },
}
laserwave.replace = {
  a = { bg = "#EB64B9", fg = "#241E2B" },
  b = { bg = "#383041", fg = "#EB64B9" },
}
laserwave.select = {
  a = { bg = "#B381C5", fg = "#241E2B" },
  b = { bg = "#383041", fg = "#B381C5" },
}
laserwave.terminal = {
  a = { bg = "#FFE261", fg = "#241E2B" },
  b = { bg = "#383041", fg = "#FFE261" },
}
laserwave.terminal_normal = {
  a = { bg = "#FFE261", fg = "#241E2B" },
  b = { bg = "#383041", fg = "#FFE261" },
}
laserwave.inactive = {
  a = { bg = "#241E2B", fg = "#7B6995" },
  b = { bg = "#241E2B", fg = "#7B6995", gui = "bold" },
  c = { bg = "#241E2B", fg = "#7B6995" },
}
return laserwave
