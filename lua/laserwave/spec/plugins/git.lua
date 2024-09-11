-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")

local palette = require("laserwave.spec.palette")
local ui = require("laserwave.spec.ui")

---@diagnostic disable: undefined-global
local plugins = lush(function()
  --stylua: ignore start
  return {
    -- gitblame
    gitblame             { ui.VirtualText },

    -- GitGutter
    GitGutterAdd         { fg = palette.ADD }, -- diff mode: Added line |diff.txt|
    GitGutterChange      { fg = palette.CHANGE }, -- diff mode: Changed line |diff.txt|
    GitGutterDelete      { fg = palette.DELETE }, -- diff mode: Deleted line |diff.txt|

    -- GitSigns
    GitSignsAdd          { fg = palette.ADD }, -- Used for the 'add' signs in sign column.
    GitSignsChange       { fg = palette.CHANGE }, -- Used for the 'change' signs in sign column.
    GitSignsDelete       { fg = palette.DELETE }, -- Used for the 'delete' signs in sign column.
  }
  --stylua: ignore end
end)

return plugins
