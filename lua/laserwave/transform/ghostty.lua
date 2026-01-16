local template = require("laserwave.template")

return template
  .with_context({
    cursor_fg = "cell-background",
    cursor_bg = "cell-foreground",
    selection_fg = "cell-foreground",
  })
  .create([[
# vim:fileencoding=utf-8:ft=kitty.conf:foldmethod=marker

## GENERATED ON $date AT $time

## name:     $name
## author:   $author
## license:  $license
## upstream: $upstream
## blurb:    $blurb

palette = 0=$black
palette = 1=$red
palette = 2=$blue
palette = 3=$yellow
palette = 4=$blue
palette = 5=$magenta
palette = 6=$cyan
palette = 7=$white
palette = 8=$bright_black
palette = 9=$bright_red
palette = 10=$bright_green
palette = 11=$bright_yellow
palette = 12=$bright_blue
palette = 13=$bright_magenta
palette = 14=$bright_cyan
palette = 15=$bright_white

background = $bg
foreground = $fg
cursor-color = $cursor_bg
cursor-text = $cursor_fg
selection-background = $selection_bg
selection-foreground = $selection_fg
split-divider-color = $bright_magenta
]])
