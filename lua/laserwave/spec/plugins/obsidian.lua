local palette = require("laserwave.palette")

---@type LaserwaveSpec
--stylua: ignore
local obsidian = {
  ObsidianTodo          = { fg = palette.INFO },
  ObsidianDone          = { fg = palette.HINT },
  ObsidianRightArrow    = { fg = palette.WARNING },
  ObsidianTilde         = { fg = palette.ERROR },
  ObsidianRefText       = { underline = true, fg = palette.STRING },
  ObsidianExtLinkIcon   = { fg = palette.HINT },
  ObsidianTag           = { italic = true, fg = palette.OPERATOR },
  ObsidianHighlightText = { bg = palette.HIGHLIGHT },
}

return obsidian
