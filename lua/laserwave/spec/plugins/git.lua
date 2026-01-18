local palette = require("laserwave.palette")

---@type laserwave.Spec
--stylua: ignore
local git = {
  -- gitblame
  gitblame = { fg = palette.IGNORE, bg = palette.BG_VISUAL },

  -- GitGutter
  GitGutterAdd    = { fg = palette.ADD }, -- diff mode: Added line |diff.txt|
  GitGutterChange = { fg = palette.CHANGE }, -- diff mode: Changed line |diff.txt|
  GitGutterDelete = { fg = palette.DELETE }, -- diff mode: Deleted line |diff.txt|

  -- GitSigns
  GitSignsAdd    = { fg = palette.ADD }, -- Used for the 'add' signs in sign column.
  GitSignsChange = { fg = palette.CHANGE }, -- Used for the 'change' signs in sign column.
  GitSignsDelete = { fg = palette.DELETE }, -- Used for the 'delete' signs in sign column.
}

return git
