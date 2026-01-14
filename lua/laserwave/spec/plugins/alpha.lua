local palette = require("laserwave.palette")

-- alpha (dashboard) header
---@type LaserwaveSpec
--stylua: ignore
local alpha = {
  StartLogo1  = { fg = palette.INFO:mix(palette.HIGHLIGHT, 0):mix(palette.BG, 0) },
  StartLogo2  = { fg = palette.INFO:mix(palette.HIGHLIGHT, 10):mix(palette.BG, 5) },
  StartLogo3  = { fg = palette.INFO:mix(palette.HIGHLIGHT, 20):mix(palette.BG, 10) },
  StartLogo4  = { fg = palette.INFO:mix(palette.HIGHLIGHT, 30):mix(palette.BG, 15) },
  StartLogo5  = { fg = palette.INFO:mix(palette.HIGHLIGHT, 40):mix(palette.BG, 20) },
  StartLogo6  = { fg = palette.INFO:mix(palette.HIGHLIGHT, 50):mix(palette.BG, 25) },
  StartLogo7  = { fg = palette.INFO:mix(palette.HIGHLIGHT, 60):mix(palette.BG, 30) },
  StartLogo8  = { fg = palette.INFO:mix(palette.HIGHLIGHT, 70):mix(palette.BG, 35) },
  StartLogo9  = { fg = palette.INFO:mix(palette.HIGHLIGHT, 80):mix(palette.BG, 40) },
  StartLogo10 = { fg = palette.INFO:mix(palette.HIGHLIGHT, 90):mix(palette.BG, 45) },
  StartLogo11 = { fg = palette.INFO:mix(palette.HIGHLIGHT, 100):mix(palette.BG, 50) },
  StartLogo12 = { fg = palette.ERROR:mix(palette.INFO, 10):mix(palette.BG, 55) },
  StartLogo13 = { fg = palette.ERROR:mix(palette.INFO, 20):mix(palette.BG, 60) },
  StartLogo14 = { fg = palette.ERROR:mix(palette.INFO, 30):mix(palette.BG, 65) },
  StartLogo15 = { fg = palette.ERROR:mix(palette.INFO, 40):mix(palette.BG, 70) },
  StartLogo16 = { fg = palette.ERROR:mix(palette.INFO, 50):mix(palette.BG, 75) },
  StartLogo17 = { fg = palette.ERROR:mix(palette.INFO, 60):mix(palette.BG, 80) },
  StartLogo18 = { fg = palette.ERROR:mix(palette.INFO, 70):mix(palette.BG, 85) },
  StartLogo19 = { fg = palette.ERROR:mix(palette.INFO, 80):mix(palette.BG, 90) },
  StartLogo20 = { fg = palette.ERROR:mix(palette.INFO, 90):mix(palette.BG, 95) },
}

return alpha
