local template = require("laserwave.transform.template")

return template
  .with_context(function(_, spec)
    return {
      normal_fg = spec.ModeNormal.fg,
      insert_fg = spec.ModeInsert.fg,
      command_fg = spec.ModeCommand.fg,
      visual_fg = spec.ModeVisual.fg,
      replace_fg = spec.ModeReplace.fg,
      select_fg = spec.ModeSelect.fg,
      terminal_fg = spec.ModeTerminal.fg,
      terminal_normal_fg = spec.ModeTerminalNormal.fg,
      statusline_bg = spec.StatusLine.bg,
      statusline_fg = spec.StatusLine.fg,
      statusline_inactive_bg = spec.StatusLineNC.bg,
      statusline_inactive_fg = spec.StatusLineNC.fg,
      statusline_bg_b = spec.StatusLine.bg:lighten(10),
    }
  end)
  .create([[
-- GENERATED ON $date AT $time

-- name:     $name
-- author:   $author
-- license:  $license
-- upstream: $upstream
-- blurb:    $blurb
local laserwave = {}

laserwave.normal = {
  a = { bg = "$normal_fg", fg = "$statusline_bg" },
  b = { bg = "$statusline_bg_b", fg = "$normal_fg" },
  c = { bg = "$statusline_bg", fg = "$statusline_fg" },
}

laserwave.insert = {
  a = { bg = "$insert_fg", fg = "$statusline_bg" },
  b = { bg = "$statusline_bg_b", fg = "$insert_fg" },
}

laserwave.command = {
  a = { bg = "$command_fg", fg = "$statusline_bg" },
  b = { bg = "$statusline_bg_b", fg = "$command_fg" },
}

laserwave.visual = {
  a = { bg = "$visual_fg", fg = "$statusline_bg" },
  b = { bg = "$statusline_bg_b", fg = "$visual_fg" },
}

laserwave.replace = {
  a = { bg = "$replace_fg", fg = "$statusline_bg" },
  b = { bg = "$statusline_bg_b", fg = "$replace_fg" },
}

laserwave.select = {
  a = { bg = "$select_fg", fg = "$statusline_bg" },
  b = { bg = "$statusline_bg_b", fg = "$select_fg" },
}

laserwave.terminal = {
  a = { bg = "$terminal_fg", fg = "$statusline_bg" },
  b = { bg = "$statusline_bg_b", fg = "$terminal_fg" },
}

laserwave.terminal_normal = {
  a = { bg = "$terminal_normal_fg", fg = "$statusline_bg" },
  b = { bg = "$statusline_bg_b", fg = "$terminal_normal_fg" },
}

laserwave.inactive = {
  a = { bg = "$statusline_inactive_bg", fg = "$statusline_inactive_fg" },
  b = { bg = "$statusline_inactive_bg", fg = "$statusline_inactive_fg", gui = "bold" },
  c = { bg = "$statusline_inactive_bg", fg = "$statusline_inactive_fg" },
}

return laserwave
]])
