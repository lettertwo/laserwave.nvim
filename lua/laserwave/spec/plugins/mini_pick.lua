local palette = require("laserwave.palette")

---@type laserwave.Spec
--stylua: ignore
local mini_pick = {
    MiniPickBorder        = "FloatBorder", -- window border.
    MiniPickBorderBusy    = { fg = palette.WARN, bg = palette.BG_FLOAT }, -- window border while picker is busy processing.
    MiniPickBorderText    = "FloatTitle", -- non-prompt on border.
    MiniPickCursor        = { fg = palette.HIGHLIGHT, bg = palette.BG_FLOAT }, -- cursor during active picker (hidden by default).
    -- MiniPickIconDirectory = { }, -- default icon for directory.
    -- MiniPickIconFile      = { }, -- default icon for file.
    MiniPickHeader        = "Title", -- headers in info buffer and previews.
    MiniPickMatchCurrent  = { bg = palette.BG_VISUAL, bold = true }, -- current matched item.
    MiniPickMatchMarked   = "Visual", -- marked matched items.
    MiniPickMatchRanges   = { fg = palette.HIGHLIGHT, bold = true }, -- ranges matching query elements.
    MiniPickNormal        = "NormalFloat", -- basic foreground/background highlighting.
    MiniPickPreviewLine   = "CursorLine", -- target line in preview.
    MiniPickPreviewRegion = { fg = palette.HIGHLIGHT, bg = palette.BG_VISUAL, bold = true }, -- target region in preview.
    MiniPickPrompt        = "Title", -- prompt.
}

return mini_pick
