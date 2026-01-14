local palette = require("laserwave.palette")

---@type LaserwaveSpec
--stylua: ignore
local mini_pick = {
    MiniPickBorder        = "FloatBorder", -- window border.
    MiniPickBorderBusy    = { fg = palette.WARNING, bg = palette.BG:darken(10) }, -- window border while picker is busy processing.
    MiniPickBorderText    = "FloatTitle", -- non-prompt on border.
    MiniPickCursor        = { fg = palette.HIGHLIGHT, bg = palette.BG:darken(10) }, -- cursor during active picker (hidden by default).
    -- MiniPickIconDirectory = { }, -- default icon for directory.
    -- MiniPickIconFile      = { }, -- default icon for file.
    MiniPickHeader        = "Title", -- headers in info buffer and previews.
    MiniPickMatchCurrent  = { bg = palette.VISUAL:mix(palette.BG, 85), bold = true }, -- current matched item.
    MiniPickMatchMarked   = "Visual", -- marked matched items.
    MiniPickMatchRanges   = { fg = palette.HIGHLIGHT, bold = true }, -- ranges matching query elements.
    MiniPickNormal        = "NormalFloat", -- basic foreground/background highlighting.
    MiniPickPreviewLine   = "CursorLine", -- target line in preview.
    MiniPickPreviewRegion = { fg = palette.HIGHLIGHT, bg = palette.VISUAL:mix(palette.BG, 80), bold = true }, -- target region in preview.
    MiniPickPrompt        = "Title", -- prompt.
}

return mini_pick
