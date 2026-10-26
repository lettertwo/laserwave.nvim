local template = require("laserwave.template")

-- Hunk ships a built-in `laserwave` theme, and extension themes can't reuse a built-in id.
return template
  .with_context(function(ctx, input)
    local palette = input.palette
    return {
      id = ctx.name .. "-nvim",
      label = (ctx.flavor == "original" and "LaserWave" or "LaserWave " .. ctx.flavor) .. " (nvim)",
      panel_bg = palette.BG_FLOAT,
      panel_alt_bg = palette.BG:lighten(7),
      border = palette.LINE_NUM,
      moved_added_bg = palette.CHANGE:mix(palette.BG, 90),
      moved_removed_bg = palette.AFRICAN_VIOLET:mix(palette.BG, 90),
      added_line_bg = palette.ADD:mix(palette.BG, 90),
      deleted_line_bg = palette.DELETE:mix(palette.BG, 90),
      added_text_bg = palette.ADD:mix(palette.BG, 70),
      deleted_text_bg = palette.DELETE:mix(palette.BG, 70),
      selected_hunk_bg = palette.AFRICAN_VIOLET:mix(palette.BG, 60),
      warn_fg = palette.WARN,
    }
  end)
  .create([[
// GENERATED ON $date AT $time

// name:     $name
// author:   $author
// license:  $license
// upstream: $upstream
// blurb:    $blurb

import type { HunkExtensionAPI } from "hunkdiff/extension";

export default function (hunk: HunkExtensionAPI) {
  hunk.registerTheme({
    id: "$id",
    label: "$label",
    base: "laserwave",

    background: "$bg",
    panel: "$panel_bg",
    panelAlt: "$panel_alt_bg",
    border: "$border",

    accent: "$accent",
    accentMuted: "$selection_bg",
    text: "$fg",
    muted: "$comment_fg",

    addedBg: "$added_line_bg",
    removedBg: "$deleted_line_bg",
    movedAddedBg: "$moved_added_bg",
    movedRemovedBg: "$moved_removed_bg",
    contextBg: "$bg",
    addedContentBg: "$added_text_bg",
    removedContentBg: "$deleted_text_bg",
    contextContentBg: "$bg",

    addedSignColor: "$added_fg",
    removedSignColor: "$deleted_fg",
    lineNumberBg: "$bg",
    lineNumberFg: "$ignore_fg",

    selectedHunk: "$selected_hunk_bg",
    badgeAdded: "$added_fg",
    badgeRemoved: "$deleted_fg",
    badgeNeutral: "$ignore_fg",

    fileNew: "$added_fg",
    fileDeleted: "$deleted_fg",
    fileRenamed: "$type_fg",
    fileModified: "$changed_fg",
    fileUntracked: "$warn_fg",

    noteBorder: "$accent",
    noteBackground: "$panel_bg",
    noteTitleBackground: "$panel_alt_bg",
    noteTitleText: "$constant_fg",
  });
}
]])
