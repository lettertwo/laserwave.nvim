local template = require("laserwave.transform.template")

return template
  .with_context(function(_, spec)
    return {
      normal_fg = spec.ModeNormal.fg,
      insert_fg = spec.ModeInsert.fg,
      command_fg = spec.ModeCommand.fg,
      visual_fg = spec.ModeVisual.fg,
      replace_fg = spec.ModeReplace.fg,
      statusline_bg = spec.StatusLine.bg,
      statusline_fg = spec.StatusLine.fg,
      statusline_inactive_bg = spec.StatusLineNC.bg,
      statusline_inactive_fg = spec.StatusLineNC.fg,
    }
  end)
  .create([[
-- GENERATED ON $date AT $time

-- name:     $name
-- author:   $author
-- license:  $license
-- upstream: https://github.com/lettertwo/laserwave.nvim/lua/lualine/$name.lua
-- blurb:    $blurb
local laserwave = {}

laserwave.normal = {
  a = { bg = "$normal_fg", fg = "$statusline_bg" },
  b = { bg = "$statusline_bg", fg = "$normal_fg" },
  c = { bg = "$statusline_bg", fg = "$statusline_fg" },
}

laserwave.insert = {
  a = { bg = "$insert_fg", fg = "$statusline_bg" },
  b = { bg = "$statusline_bg", fg = "$insert_fg" },
}

laserwave.command = {
  a = { bg = "$command_fg", fg = "$statusline_bg" },
  b = { bg = "$statusline_bg", fg = "$command_fg" },
}

laserwave.visual = {
  a = { bg = "$visual_fg", fg = "$statusline_bg" },
  b = { bg = "$statusline_bg", fg = "$visual_fg" },
}

laserwave.replace = {
  a = { bg = "$replace_fg", fg = "$statusline_bg" },
  b = { bg = "$statusline_bg", fg = "$replace_fg" },
}

laserwave.inactive = {
  a = { bg = "$statusline_inactive_bg", fg = "$statusline_inactive_fg" },
  b = { bg = "$statusline_inactive_bg", fg = "$statusline_inactive_fg", gui = "bold" },
  c = { bg = "$statusline_inactive_bg", fg = "$statusline_inactive_fg" },
}

return laserwave
]])
