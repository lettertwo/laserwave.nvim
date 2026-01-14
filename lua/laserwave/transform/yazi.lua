local template = require("laserwave.template")

return template.create([[
"$schema" = "https://yazi-rs.github.io/schemas/theme.json"

## GENERATED ON $date AT $time

## name:     $name
## author:   $author
## license:  $license
## upstream: $upstream
## blurb:    $blurb

# : Manager {{{

[mgr]
cwd = { fg = "$cyan" }

# Hovered
hovered = { reversed = true }
preview_hovered = { reversed = true }

# Find
find_keyword = { reversed = true, bold = true }
find_position = { bg = "$cyan", fg = "$bright_black", bold = true }

# Symlink
symlink_target = { italic = true }

# Marker
marker_copied = { fg = "$bright_green", bg = "$bright_green" }
marker_cut = { fg = "$bright_red", bg = "$bright_red" }
marker_marked = { fg = "$bright_cyan", bg = "$bright_cyan" }
marker_selected = { fg = "$bright_black", bg = "$bright_black" }

# Count
count_copied = { fg = "$white", bg = "$blue" }
count_cut = { fg = "$white", bg = "$red" }
count_selected = { fg = "$white", bg = "$bright_black" }

# Border
border_style = { fg = "$bright_magenta" }

# : }}}


# : Tabs {{{

[tabs]
active = { fg = "$bg", bg = "$blue", bold = true }
inactive = { fg = "$black", bg = "$bg" }

# : }}}


# : Mode {{{

[mode]
normal_main = { fg = "$bg", bg = "$blue", bold = true }
normal_alt = { fg = "$blue", bg = "$bg" }

# Select mode
select_main = { fg = "$bg", bg = "$bright_black", bold = true }
select_alt = { fg = "$bright_black", bg = "$bg" }

# Unset mode
unset_main = { fg = "$bg", bg = "$red", bold = true }
unset_alt = { fg = "$red", bg = "$bg" }

# : }}}


# : Status bar {{{

[status]

# Permissions
perm_sep = { fg = "$black" }
perm_type = { fg = "$blue" }
perm_read = { fg = "$yellow" }
perm_write = { fg = "$red" }
perm_exec = { fg = "$cyan" }

# Progress
progress_label = { bold = true }
progress_normal = { fg = "$blue", bg = "$bg" }
progress_error = { fg = "$red", bg = "$bg" }

# : }}}


# : Which {{{

[which]
mask = { bg = "$bg" }
cand = { fg = "$bright_cyan" }
rest = { fg = "$black" }
desc = { fg = "$bright_magenta" }
separator_style = { fg = "$black" }

# : }}}


# : Confirmation {{{

[confirm]
border = { fg = "$bright_magenta" }
title = { fg = "$bright_magenta" }

# : }}}


# : Spotter {{{

[spot]
border = { fg = "$bright_magenta" }
title = { fg = "$bright_magenta" }

# Table
tbl_col = { fg = "$blue" }
tbl_cell = { fg = "$yellow", reversed = true }

# : }}}


# : Notification {{{

[notify]
title_info = { fg = "$blue" }
title_warn = { fg = "$yellow" }
title_error = { fg = "$red" }

# : }}}


# : Picker {{{

[pick]
border = { fg = "$bright_magenta" }
active = { fg = "$bright_magenta", bold = true }
inactive = {}

# : }}}


# : Input {{{

[input]
border = { fg = "$bright_magenta" }
title = {}
value = {}
selected = { reversed = true }

# : }}}


# : Completion {{{

[cmp]
border = { fg = "$bright_magenta" }
active = { reversed = true }

# : }}}


# : Task manager {{{

[tasks]
border = { fg = "$bright_magenta" }
title = {}
hovered = { fg = "$magenta", underline = true }

# : }}}


# : Help menu {{{

[help]
on = { fg = "$cyan" }
run = { fg = "$magenta" }
hovered = { reversed = true, bold = true }
footer = { fg = "$black", bg = "$bg" }

# : }}}


# : File-specific styles {{{

[filetype]
rules = [
  # Images
  { mime = "image/*", fg = "$yellow" },

  # Media
  { mime = "{audio,video}/*", fg = "$magenta" },

  # Archives
  { mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}", fg = "$red" },

  # Documents
  { mime = "application/{pdf,doc,rtf}", fg = "$cyan" },

  # Empty files
  # { mime = "inode/empty", fg = "$red" },

  # Special files
  { name = "*", is = "orphan", bg = "$red" },
  { name = "*", is = "exec", fg = "$blue" },

  # Dummy files
  { name = "*", is = "dummy", bg = "$red" },
  { name = "*/", is = "dummy", bg = "$red" },

  # Fallback
  # { name = "*", fg = "$white" },
  { name = "*/", fg = "$blue" },
]

# : }}}
]])
