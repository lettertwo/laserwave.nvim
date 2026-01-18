local template = require("laserwave.template")

return template
  .with_context(function(_, input)
    return {
      normal_fg = input.palette.NORMAL,
      insert_fg = input.palette.INSERT,
      command_fg = input.palette.COMMAND,
      visual_fg = input.palette.VISUAL,
      replace_fg = input.palette.REPLACE,
      select_fg = input.palette.VISUAL,
      terminal_fg = input.palette.COMMAND,
      terminal_normal_fg = input.palette.COMMAND,
      statusline_bg = input.palette.BG_FLOAT,
      statusline_fg = input.palette.COMMENT,
      statusline_inactive_bg = input.palette.BG_FLOAT,
      statusline_inactive_fg = input.palette.IGNORE,
      statusline_bg_b = input.palette.BG,
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
