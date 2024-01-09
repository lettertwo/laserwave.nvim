local template = require("laserwave.transform.template")

return template
  .with_context({
    cursor_fg = "background",
    cursor_bg = "none",
    selection_fg = "none",
  })
  .create([[
# vim:fileencoding=utf-8:ft=kitty.conf:foldmethod=marker

## GENERATED ON $date AT $time

## name:     $name
## author:   $author
## license:  $license
## upstream: $upstream
## blurb:    $blurb

#: The basic colors

foreground                      $fg
background                      $bg
selection_foreground            $selection_fg
selection_background            $selection_bg


#: Cursor colors

cursor                          $cursor_bg
cursor_text_color               $cursor_fg


#: URL underline color when hovering with mouse

url_color                       $url


#: kitty window border colors and terminal bell colors

active_border_color             $border_active
inactive_border_color           $border_inactive
bell_border_color               $border_bell


#: Tab bar colors

active_tab_foreground           $tab_active_fg
active_tab_background           $tab_active_bg
inactive_tab_foreground         $tab_inactive_fg
inactive_tab_background         $tab_inactive_bg
tab_bar_background              $tab_bg
tab_bar_margin_color            $tab_bg


#: Colors for marks (marked text in the terminal)

mark1_foreground $mark1_fg
mark1_background $mark1_bg
mark2_foreground $mark2_fg
mark2_background $mark2_bg
mark3_foreground $mark3_fg
mark3_background $mark3_bg


#: The basic 16 colors

#: black
color0 $black
color8 $bright_black

#: red
color1 $red
color9 $bright_red

#: green
color2  $green
color10 $bright_green

#: yellow
color3  $yellow
color11 $bright_yellow

#: blue
color4  $blue
color12 $bright_blue

#: magenta
color5  $magenta
color13 $bright_magenta

#: cyan
color6  $cyan
color14 $bright_cyan

#: white
color7  $white
color15 $bright_white


#: You can set the remaining 240 colors as color16 to color255.
]])
