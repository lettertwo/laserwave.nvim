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
local neotree = lush(function()
  --stylua: ignore start
  return {
    -- NeoTreeBufferNumber       {}, -- The buffer number shown in the buffers source.
    -- NeoTreeCursorLine         {}, -- |hl-CursorLine| override in Neo-tree window.
    -- NeoTreeDimText            {}, -- Greyed out text used in various places.
    -- NeoTreeDirectoryIcon      {}, -- Directory icon.
    -- NeoTreeDirectoryName      {}, -- Directory name.
    -- NeoTreeDotfile            {}, -- Used for icons and names when dotfiles are filtered.
    -- NeoTreeFileIcon           {}, -- File icon, when not overridden by devicons.
    -- NeoTreeFileName           {}, -- File name, when not overwritten by another status.
    -- NeoTreeFileNameOpened     {}, -- File name when the file is open. Not used yet.
    -- NeoTreeFilterTerm         {}, -- The filter term, as displayed in the root node.
    NeoTreeFloatBorder        { ui.FloatBorder }, -- The border for pop-up windows.
    NeoTreeFloatTitle         { ui.FloatTitle }, -- Used for the title text of pop-ups when the border-style is set to another style than "NC". This is derived from NeoTreeFloatBorder.
    -- NeoTreeTitleBar           { ui.FloatTitle }, -- Used for the title bar of pop-ups, when the border-style is set to "NC". This is derived from NeoTreeFloatBorder.
    NeoTreeGitAdded           { gui = "bold", fg = palette.ADD }, -- File name when the git status is added.
    NeoTreeGitConflict        { gui = "bold", fg = palette.CONFLICT }, -- File name when the git status is conflict.
    NeoTreeGitDeleted         { gui = "bold", fg = palette.DELETE }, -- File name when the git status is deleted.
    NeoTreeGitIgnored         { gui = "bold", fg = palette.IGNORE }, -- File name when the git status is ignored.
    NeoTreeGitModified        { gui = "bold", fg = palette.CHANGE }, -- File name when the git status is modified.
    NeoTreeGitUntracked       { fg = palette.HINT }, -- File name when the git status is untracked.
    -- NeoTreeGitUnstaged        {}, -- Used for git unstaged symbol.
    -- NeoTreeGitStaged          {}, -- Used for git staged symbol.
    -- NeoTreeHiddenByName       {}, -- Used for icons and names when `hide_by_name` is used.
    -- NeoTreeIndentMarker       {}, -- The style of indentation markers (guides). By default, the "Normal" highlight is used.
    -- NeoTreeExpander           {}, -- Used for collapsed/expanded icons.
    -- NeoTreeNormal             {}, -- |hl-Normal| override in Neo-tree window.
    -- NeoTreeNormalNC           {}, -- |hl-NormalNC| override in Neo-tree window.
    -- NeoTreeSignColumn         {}, -- |hl-SignColumn| override in Neo-tree window.
    -- NeoTreeStatusLine         {}, -- |hl-StatusLine| override in Neo-tree window.
    -- NeoTreeStatusLineNC       {}, -- |hl-StatusLineNC| override in Neo-tree window.
    -- NeoTreeVertSplit          {}, -- |hl-VertSplit| override in Neo-tree window.
    -- NeoTreeWinSeparator       {}, -- |hl-WinSeparator| override in Neo-tree window.
    -- NeoTreeEndOfBuffer        {}, -- |hl-EndOfBuffer| override in Neo-tree window.
    -- NeoTreeRootName           {}, -- The name of the root node.
    -- NeoTreeSymbolicLinkTarget {}, -- Symbolic link target.
    -- NeoTreeWindowsHidden      {}, -- Used for icons and names that are hidden on Windows.
  }
  --stylua: ignore end
end)

return neotree
