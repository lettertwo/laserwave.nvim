local palette = require("laserwave.palette")

---@type laserwave.Groups
--stylua: ignore
local telescope = {
  TelescopeNormal       = "NormalFloat",
  TelescopeSelection    = "Visual",
  TelescopePromptNormal = "NormalFloat",
  TelescopePromptPrefix = { fg = palette.HIGHLIGHT, bg = palette.BG_FLOAT },
  TelescopePromptBorder = "FloatBorder",
  TelescopePromptTitle  = "FloatTitle",
  TelescopeBorder       = "FloatBorder",
  TelescopePreviewTitle = "FloatTitle",
  TelescopeResultsTitle = "FloatTitle",
}

return telescope
