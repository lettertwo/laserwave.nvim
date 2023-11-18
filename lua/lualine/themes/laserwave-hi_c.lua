-- GENERATED ON 2023-11-18 AT 15:17:37
-- name:     laserwave-hi_c
-- author:   Eric Eldredge <lettertwo@gmail.com>
-- license:  MIT
-- upstream: https://github.com/lettertwo/laserwave.nvim/lua/lualine/laserwave-hi_c.lua
-- blurb:    Based on LaserWave for VSCode by Jared Jones
local laserwave = {}
laserwave.normal = {
  a = { bg = "#1CD4ED", fg = "#18141D" },
  b = { bg = "#18141D", fg = "#1CD4ED" },
  c = { bg = "#18141D", fg = "#FFFFFF" },
}
laserwave.insert = {
  a = { bg = "#3FEBBF", fg = "#18141D" },
  b = { bg = "#18141D", fg = "#3FEBBF" },
}
laserwave.command = {
  a = { bg = "#FFE25F", fg = "#18141D" },
  b = { bg = "#18141D", fg = "#FFE25F" },
}
laserwave.visual = {
  a = { bg = "#D686F4", fg = "#18141D" },
  b = { bg = "#18141D", fg = "#D686F4" },
}
laserwave.replace = {
  a = { bg = "#FF55C0", fg = "#18141D" },
  b = { bg = "#18141D", fg = "#FF55C0" },
}
laserwave.inactive = {
  a = { bg = "#18141D", fg = "#B5A9C8" },
  b = { bg = "#18141D", fg = "#B5A9C8", gui = "bold" },
  c = { bg = "#18141D", fg = "#B5A9C8" },
}
return laserwave
