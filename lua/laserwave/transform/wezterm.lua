local template = require("laserwave.transform.template")

return template.create([[
## GENERATED ON $date AT $time

[metadata]
aliases = []
author = "$author"
license = "$license"
upstream = "$upstream"
name = "$name"
blurb = "$blurb"

[colors]
foreground = "$fg"
background = "$bg"
cursor_bg = "$cursor_bg"
cursor_border = "$cursor_bg"
cursor_fg = "$cursor_fg"
selection_bg = "$selection_bg"
selection_fg = "$selection_fg"

split = "$border_active"
compose_cursor = "$mark1_bg"
scrollbar_thumb = "$border_active"

ansi = [
"$black",
"$red",
"$blue",
"$yellow",
"$blue",
"$magenta",
"$cyan",
"$white"
]

brights = [
"$bright_black",
"$bright_red",
"$bright_green",
"$bright_yellow",
"$bright_blue",
"$bright_magenta",
"$bright_cyan",
"$bright_white"
]

[colors.tab_bar]
inactive_tab_edge = "$tab_bg"
background = "$tab_bg"

[colors.tab_bar.active_tab]
fg_color = "$tab_active_fg"
bg_color = "$tab_active_bg"

[colors.tab_bar.inactive_tab]
fg_color = "$tab_inactive_fg"
bg_color = "$tab_inactive_bg"
italic = true

[colors.tab_bar.inactive_tab_hover]
fg_color = "$tab_inactive_fg"
bg_color = "$tab_inactive_bg"

[colors.tab_bar.new_tab_hover]
fg_color = "$tab_active_fg"
bg_color = "$tab_active_bg"
intensity = "Bold"

[colors.tab_bar.new_tab]
fg_color = "$tab_active_fg"
bg_color = "$tab_active_bg"

]])
