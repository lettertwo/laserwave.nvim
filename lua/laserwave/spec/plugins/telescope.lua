local palette = require("laserwave.palette")

---@type LaserwaveSpec
--stylua: ignore
local telescope = {
  TelescopeNormal       = "NormalFloat",
  TelescopeSelection    = "Visual",
  TelescopePromptNormal = "NormalFloat",
  TelescopePromptPrefix = { fg = palette.HIGHLIGHT, bg = palette.BG:darken(10) },
  TelescopePromptBorder = "FloatBorder",
  TelescopePromptTitle  = "FloatTitle",
  TelescopeBorder       = "FloatBorder",
  TelescopePreviewTitle = "FloatTitle",
  TelescopeResultsTitle = "FloatTitle",
}

return telescope
