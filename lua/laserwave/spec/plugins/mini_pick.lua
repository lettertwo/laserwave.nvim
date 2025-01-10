-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")

local palette = require("laserwave.spec.palette")
local syntax = require("laserwave.spec.syntax")
local ui = require("laserwave.spec.ui")

---@diagnostic disable: undefined-global
local mini_pick = lush(function()
  --stylua: ignore start
  return {
    MiniPickBorder        { ui.FloatBorder }, -- window border.
    MiniPickBorderBusy    { ui.FloatBorder, fg = palette.WARNING }, -- window border while picker is busy processing.
    MiniPickBorderText    { ui.FloatTitle }, -- non-prompt on border.
    MiniPickCursor        { ui.NormalFloat, fg = palette.HIGHLIGHT }, -- cursor during active picker (hidden by default).
    -- MiniPickIconDirectory { }, -- default icon for directory.
    -- MiniPickIconFile      { }, -- default icon for file.
    MiniPickHeader        { ui.Title }, -- headers in info buffer and previews.
    MiniPickMatchCurrent  { ui.CursorLine, bold = true }, -- current matched item.
    MiniPickMatchMarked   { ui.Visual }, -- marked matched items.
    MiniPickMatchRanges   { fg = palette.HIGHLIGHT, bold = true }, -- ranges matching query elements.
    MiniPickNormal        { ui.NormalFloat }, -- basic foreground/background highlighting.
    MiniPickPreviewLine   { ui.CursorLine }, -- target line in preview.
    MiniPickPreviewRegion { ui.Visual, fg = palette.HIGHLIGHT, bold = true }, -- target region in preview.
    MiniPickPrompt        { ui.Title }, -- prompt.
  }
  --stylua: ignore end
end)

return mini_pick
