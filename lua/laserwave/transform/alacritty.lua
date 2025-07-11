local template = require("laserwave.transform.template")

return template
  .with_context({
    cursor_fg = "CellBackground",
    cursor_bg = "CellForeground",
    selection_fg = "CellForeground",
  })
  .create([[
# GENERATED ON $date AT $time

# name:     $name
# author:   $author
# license:  $license
# upstream: $upstream
# blurb:    $blurb

colors:
  primary:
    foreground: '$fg'
    background: '$bg'
  cursor:
    cursor: '$cursor_bg'
    text:   '$cursor_fg'
  selection:
    text: '$selection_fg'
    background: '$selection_bg'
  normal:
    black:   '$black'
    red:     '$red'
    green:   '$blue'
    yellow:  '$yellow'
    blue:    '$blue'
    magenta: '$magenta'
    cyan:    '$cyan'
    white:   '$white'
  bright:
    black:   '$bright_black'
    red:     '$bright_red'
    green:   '$bright_green'
    yellow:  '$bright_yellow'
    blue:    '$bright_blue'
    magenta: '$bright_magenta'
    cyan:    '$bright_cyan'
    white:   '$bright_white'
]])
