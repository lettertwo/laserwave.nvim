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

    -- diff
    diffAdded       { fg = palette.ADD },
    diffRemoved     { fg = palette.DELETE },
    diffChanged     { fg = palette.CHANGE },
    diffOldFile     { fg = palette.DELETE },
    diffNewFile     { fg = palette.ADD },
    diffFile        { fg = palette.CONSTANT },
    diffLine        { fg = palette.COMMENT },
    diffIndexLine   { fg = palette.COMMENT },

    -- GitGutter
    GitGutterAdd         { fg = palette.ADD }, -- diff mode: Added line |diff.txt|
    GitGutterChange      { fg = palette.CHANGE }, -- diff mode: Changed line |diff.txt|
    GitGutterDelete      { fg = palette.DELETE }, -- diff mode: Deleted line |diff.txt|

    -- GitSigns
    GitSignsAdd          { fg = palette.ADD }, -- diff mode: Added line |diff.txt|
    GitSignsChange       { fg = palette.CHANGE }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete       { fg = palette.DELETE }, -- diff mode: Deleted line |diff.txt|
  }
  --stylua: ignore end
end)

return plugins
