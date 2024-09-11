-- GENERATED ON 2024-09-11 AT 13:00:17
-- name:     laserwave
-- author:   Eric Eldredge <lettertwo@gmail.com>
-- license:  MIT
-- upstream: https://github.com/lettertwo/laserwave.nvim/lua/lualine/themes/laserwave.lua
-- blurb:    Based on LaserWave for VSCode by Jared Jones
local laserwave = {}
laserwave.normal = {
  a = { bg = "#41B5C5", fg = "#251F2C" },
  b = { bg = "#251F2C", fg = "#41B5C5" },
  c = { bg = "#251F2C", fg = "#FFFFFF" },
}
laserwave.insert = {
  a = { bg = "#75DFC4", fg = "#251F2C" },
  b = { bg = "#251F2C", fg = "#75DFC4" },
}
laserwave.command = {
  a = { bg = "#FFE25F", fg = "#251F2C" },
  b = { bg = "#251F2C", fg = "#FFE25F" },
}
laserwave.visual = {
  a = { bg = "#B381C5", fg = "#251F2C" },
  b = { bg = "#251F2C", fg = "#B381C5" },
}
laserwave.replace = {
  a = { bg = "#EB65B9", fg = "#251F2C" },
  b = { bg = "#251F2C", fg = "#EB65B9" },
}
laserwave.select = {
  a = { bg = "#B381C5", fg = "#251F2C" },
  b = { bg = "#251F2C", fg = "#B381C5" },
}
laserwave.terminal = {
  a = { bg = "#FFE25F", fg = "#251F2C" },
  b = { bg = "#251F2C", fg = "#FFE25F" },
}
laserwave.terminal_normal = {
  a = { bg = "#FFE25F", fg = "#251F2C" },
  b = { bg = "#251F2C", fg = "#FFE25F" },
}
laserwave.inactive = {
  a = { bg = "#251F2C", fg = "#7C6A96" },
  b = { bg = "#251F2C", fg = "#7C6A96", gui = "bold" },
  c = { bg = "#251F2C", fg = "#7C6A96" },
}
return laserwave
