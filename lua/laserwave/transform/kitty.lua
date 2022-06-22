local helpers = require("shipwright.transform.helpers")

local meta = {
  name = "laserwave",
  author = "Eric Eldredge <lettertwo@gmail.com>",
  license = "MIT",
  upstream = "https://github.com/lettertwo/laserwave.nvim/extra/kitty/laserwave.conf",
  blurb = "Based on LaserWave for VSCode by Jared Jones",
}

local spec = {
  "name",
  "author",
  "license",
  "upstream",
  "blurb",
  "background",
  "foreground",
  "selection_background",
  "black",
  "bright_black",
  "red",
  "bright_red",
  "green",
  "bright_green",
  "yellow",
  "bright_yellow",
  "blue",
  "bright_blue",
  "magenta",
  "bright_magenta",
  "cyan",
  "bright_cyan",
  "white",
  "bright_white",
  "cursor",
  "cursor_text_color",
  "selection_foreground",
  "url_color",
  "active_border_color",
  "inactive_border_color",
  "bell_border_color",
  "visual_bell_color",
  "wayland_titlebar_color",
  "macos_titlebar_color",
  "active_tab_foreground",
  "active_tab_background",
  "inactive_tab_foreground",
  "inactive_tab_background",
  "tab_bar_background",
  "tab_bar_margin_color",
  "mark1_foreground",
  "mark1_background",
  "mark2_foreground",
  "mark2_background",
  "mark3_foreground",
  "mark3_background",
}

-- stylua: ignore start
local defaults = {
  cursor                  = 'none',
  cursor_text_color       = 'background',
  selection_foreground    = 'none',
  url_color               = '#0087bd',
  active_border_color     = '#00ff00',
  inactive_border_color   = '#cccccc',
  bell_border_color       = '#ff5a00',
  visual_bell_color       = 'none',
  wayland_titlebar_color  = 'system',
  macos_titlebar_color    = 'system',
  active_tab_foreground   = '#000',
  active_tab_background   = '#eee',
  inactive_tab_foreground = '#444',
  inactive_tab_background = '#999',
  tab_bar_background      = 'none',
  tab_bar_margin_color    = 'none',
  mark1_foreground        = 'black',
  mark1_background        = '#98d3cb',
  mark2_foreground        = 'black',
  mark2_background        = '#f2dcd3',
  mark3_foreground        = 'black',
  mark3_background        = '#f274bc',
}
-- stylua: ignore end

local template = [[
# vim:fileencoding=utf-8:ft=kitty.conf:foldmethod=marker

## name:     $name
## author:   $author
## license:  $license
## upstream: $upstream
## blurb:    $blurb

#: The basic colors

foreground                      $foreground
background                      $background
selection_foreground            $selection_foreground
selection_background            $selection_background


#: Cursor colors

cursor                          $cursor
cursor_text_color               $cursor_text_color


#: URL underline color when hovering with mouse

url_color                       $url_color


#: kitty window border colors and terminal bell colors

active_border_color             $active_border_color
inactive_border_color           $inactive_border_color
bell_border_color               $bell_border_color
visual_bell_color               $visual_bell_color


#: OS Window titlebar colors

wayland_titlebar_color          $wayland_titlebar_color
macos_titlebar_color            $macos_titlebar_color


#: Tab bar colors

active_tab_foreground           $active_tab_foreground
active_tab_background           $active_tab_background
inactive_tab_foreground         $inactive_tab_foreground
inactive_tab_background         $inactive_tab_background
tab_bar_background              $tab_bar_background
tab_bar_margin_color            $tab_bar_margin_color


#: Colors for marks (marked text in the terminal)

mark1_foreground $mark1_foreground
mark1_background $mark1_background
mark2_foreground $mark2_foreground
mark2_background $mark2_background
mark3_foreground $mark3_foreground
mark3_background $mark3_background


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
]]

---@param colors table<string, LushColor>
---@return table<string, string>
local function stringify_colors(colors)
  local extracted = {}
  for key, value in pairs(colors) do
    if type(value) == "string" then
      extracted[key] = value
    elseif type(value.hex) == "string" then
      extracted[key] = value.hex
    else
      error("Invalid color value type " .. type(value) .. " for " .. key)
    end
  end
  return extracted
end

---@param context table<string, string>
---@returns string[]
local function apply(context)
  local stringified = helpers.apply_template(template, context)
  local lines = {}
  for s in string.gmatch(stringified, "(.*)\n") do
    table.insert(lines, s)
  end
  return lines
end

---@param palette LaserwaveColors
---@return string
local function transform(palette)
  local colors = stringify_colors({
    background = palette.BG,
    foreground = palette.FG,
    selection_background = palette.VISUAL.mix(palette.BG, 75),
    black = palette.terminal.BLACK,
    bright_black = palette.terminal.BRIGHT_BLACK,
    red = palette.terminal.RED,
    bright_red = palette.terminal.BRIGHT_RED,
    green = palette.terminal.GREEN,
    bright_green = palette.terminal.BRIGHT_GREEN,
    yellow = palette.terminal.YELLOW,
    bright_yellow = palette.terminal.BRIGHT_YELLOW,
    blue = palette.terminal.BLUE,
    bright_blue = palette.terminal.BRIGHT_BLUE,
    magenta = palette.terminal.MAGENTA,
    bright_magenta = palette.terminal.BRIGHT_MAGENTA,
    cyan = palette.terminal.CYAN,
    bright_cyan = palette.terminal.BRIGHT_CYAN,
    white = palette.terminal.WHITE,
    bright_white = palette.terminal.BRIGHT_WHITE,

    active_tab_foreground = palette.FG,
    active_tab_background = palette.BG.lighten(7),
    inactive_tab_foreground = palette.IGNORE,
    inactive_tab_background = palette.BG.darken(70),
    tab_bar_background = palette.BG.darken(70),
    tab_bar_margin_color = palette.BG.darken(70),
  })

  colors = vim.tbl_extend("force", defaults, meta, colors)

  for _, key in ipairs(spec) do
    assert(colors[key] ~= nil, "key " .. key .. " is missing")
  end

  return apply(colors)
end

return transform
