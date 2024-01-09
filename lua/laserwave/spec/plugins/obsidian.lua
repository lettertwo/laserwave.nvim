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
local obsidian = lush(function()
  --stylua: ignore start
  return {
    -- Obsidian
    ObsidianTodo           { fg = palette.INFO },
    ObsidianDone           { fg = palette.HINT },
    ObsidianRightArrow     { fg = palette.WARNING },
    ObsidianTilde          { fg = palette.ERROR },
    ObsidianRefText        { gui = "underline", fg = palette.STRING },
    ObsidianExtLinkIcon    { fg = palette.HINT },
    ObsidianTag            { gui = "italic", fg = palette.OPERATOR },
    ObsidianHighlightText  { bg = palette.HIGHLIGHT },
  --stylua: ignore end
  }
end)

return obsidian
