-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")

local palette = require("laserwave.spec.palette")
local ui = require("laserwave.spec.ui")

---@diagnostic disable: undefined-global
local snacks = lush(function()
  --stylua: ignore start
  return {
    SnacksDashboardDesc     { ui.Normal },
    -- SnacksDashboardDir      { },
    -- SnacksDashboardFile     { },
    SnacksDashboardFooter   { fg = palette.GUTTER },
    SnacksDashboardHeader   { fg = palette.INFO },
    SnacksDashboardIcon     { fg = palette.STRING },
    -- SnacksDashboardKey      { },
    -- SnacksDashboardNormal   { },
    -- SnacksDashboardSpecial  { },
    -- SnacksDashboardTerminal { },
    -- SnacksDashboardTitle    { },

    SnacksDashboardHeader1  { fg = palette.INFO.mix(palette.HIGHLIGHT, 0).mix(palette.BG, 0) },
    SnacksDashboardHeader2  { fg = palette.INFO.mix(palette.HIGHLIGHT, 10).mix(palette.BG, 5) },
    SnacksDashboardHeader3  { fg = palette.INFO.mix(palette.HIGHLIGHT, 20).mix(palette.BG, 10) },
    SnacksDashboardHeader4  { fg = palette.INFO.mix(palette.HIGHLIGHT, 30).mix(palette.BG, 15) },
    SnacksDashboardHeader5  { fg = palette.INFO.mix(palette.HIGHLIGHT, 40).mix(palette.BG, 20) },
    SnacksDashboardHeader6  { fg = palette.INFO.mix(palette.HIGHLIGHT, 50).mix(palette.BG, 25) },
    SnacksDashboardHeader7  { fg = palette.INFO.mix(palette.HIGHLIGHT, 60).mix(palette.BG, 30) },
    SnacksDashboardHeader8  { fg = palette.INFO.mix(palette.HIGHLIGHT, 70).mix(palette.BG, 35) },
    SnacksDashboardHeader9  { fg = palette.INFO.mix(palette.HIGHLIGHT, 80).mix(palette.BG, 40) },
    SnacksDashboardHeader10 { fg = palette.INFO.mix(palette.HIGHLIGHT, 90).mix(palette.BG, 45) },
    SnacksDashboardHeader11 { fg = palette.INFO.mix(palette.HIGHLIGHT, 100).mix(palette.BG, 50) },
    SnacksDashboardHeader12 { fg = palette.ERROR.mix(palette.INFO, 10).mix(palette.BG, 55) },
    SnacksDashboardHeader13 { fg = palette.ERROR.mix(palette.INFO, 20).mix(palette.BG, 60) },
    SnacksDashboardHeader14 { fg = palette.ERROR.mix(palette.INFO, 30).mix(palette.BG, 65) },
    SnacksDashboardHeader15 { fg = palette.ERROR.mix(palette.INFO, 40).mix(palette.BG, 70) },
    SnacksDashboardHeader16 { fg = palette.ERROR.mix(palette.INFO, 50).mix(palette.BG, 75) },
    SnacksDashboardHeader17 { fg = palette.ERROR.mix(palette.INFO, 60).mix(palette.BG, 80) },
    SnacksDashboardHeader18 { fg = palette.ERROR.mix(palette.INFO, 70).mix(palette.BG, 85) },
    SnacksDashboardHeader19 { fg = palette.ERROR.mix(palette.INFO, 80).mix(palette.BG, 90) },
    SnacksDashboardHeader20 { fg = palette.ERROR.mix(palette.INFO, 90).mix(palette.BG, 95) },

  }
  --stylua: ignore end
end)

return snacks
