local palette = require("laserwave.palette")

---@type laserwave.Spec
--stylua: ignore
local neotree = {
  -- NeoTreeBufferNumber       = {}, -- The buffer number shown in the buffers source.
  -- NeoTreeCursorLine         = {}, -- |hl-CursorLine| override in Neo-tree window.
  -- NeoTreeDimText            = {}, -- Greyed out text used in various places.
  -- NeoTreeDirectoryIcon      = {}, -- Directory icon.
  -- NeoTreeDirectoryName      = {}, -- Directory name.
  -- NeoTreeDotfile            = {}, -- Used for icons and names when dotfiles are filtered.
  -- NeoTreeFileIcon           = {}, -- File icon, when not overridden by devicons.
  -- NeoTreeFileName           = {}, -- File name, when not overwritten by another status.
  -- NeoTreeFileNameOpened     = {}, -- File name when the file is open. Not used yet.
  -- NeoTreeFilterTerm         = {}, -- The filter term, as displayed in the root node.
  NeoTreeFloatBorder        = "FloatBorder", -- The border for pop-up windows.
  NeoTreeFloatTitle         = "FloatTitle", -- Used for the title text of pop-ups when the border-style is set to another style than "NC". This is derived from NeoTreeFloatBorder.
  NeoTreeTitleBar           = "FloatTitle", -- Used for the title bar of pop-ups, when the border-style is set to "NC". This is derived from NeoTreeFloatBorder.
  NeoTreeGitAdded           = { bold = true, fg = palette.ADD }, -- File name when the git status is added.
  NeoTreeGitConflict        = { bold = true, fg = palette.CONFLICT }, -- File name when the git status is conflict.
  NeoTreeGitDeleted         = { bold = true, fg = palette.DELETE }, -- File name when the git status is deleted.
  NeoTreeGitIgnored         = { bold = true, fg = palette.IGNORE }, -- File name when the git status is ignored.
  NeoTreeGitModified        = { bold = true, fg = palette.CHANGE }, -- File name when the git status is modified.
  NeoTreeGitUntracked       = { fg = palette.HINT }, -- File name when the git status is untracked.
  -- NeoTreeGitUnstaged        = {}, -- Used for git unstaged symbol.
  -- NeoTreeGitStaged          = {}, -- Used for git staged symbol.
  -- NeoTreeHiddenByName       = {}, -- Used for icons and names when `hide_by_name` is used.
  -- NeoTreeIndentMarker       = {}, -- The style of indentation markers (guides). By default, the "Normal" highlight is used.
  -- NeoTreeExpander           = {}, -- Used for collapsed/expanded icons.
  -- NeoTreeNormal             = {}, -- |hl-Normal| override in Neo-tree window.
  -- NeoTreeNormalNC           = {}, -- |hl-NormalNC| override in Neo-tree window.
  -- NeoTreeSignColumn         = {}, -- |hl-SignColumn| override in Neo-tree window.
  -- NeoTreeStatusLine         = {}, -- |hl-StatusLine| override in Neo-tree window.
  -- NeoTreeStatusLineNC       = {}, -- |hl-StatusLineNC| override in Neo-tree window.
  -- NeoTreeVertSplit          = {}, -- |hl-VertSplit| override in Neo-tree window.
  -- NeoTreeWinSeparator       = {}, -- |hl-WinSeparator| override in Neo-tree window.
  -- NeoTreeEndOfBuffer        = {}, -- |hl-EndOfBuffer| override in Neo-tree window.
  -- NeoTreeRootName           = {}, -- The name of the root node.
  -- NeoTreeSymbolicLinkTarget = {}, -- Symbolic link target.
  -- NeoTreeWindowsHidden      = {}, -- Used for icons and names that are hidden on Windows.

}

return neotree
