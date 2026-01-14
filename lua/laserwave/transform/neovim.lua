local template = require("laserwave.template")

-- Generate the Laserwave colorscheme for neovim.
return template.create([[
-- GENERATED ON $date AT $time

-- name:     $name
-- author:   $author
-- license:  $license
-- upstream: $upstream
-- blurb:    $blurb

local function apply_terminal_colors()
  vim.g.terminal_color_0 = "$black"
  vim.g.terminal_color_1 = "$red"
  vim.g.terminal_color_2 = "$blue"
  vim.g.terminal_color_3 = "$yellow"
  vim.g.terminal_color_4 = "$blue"
  vim.g.terminal_color_5 = "$magenta"
  vim.g.terminal_color_6 = "$cyan"
  vim.g.terminal_color_7 = "$white"
  vim.g.terminal_color_8 = "$bright_black"
  vim.g.terminal_color_9 = "$bright_red"
  vim.g.terminal_color_10 = "$bright_green"
  vim.g.terminal_color_11 = "$bright_yellow"
  vim.g.terminal_color_12 = "$bright_blue"
  vim.g.terminal_color_13 = "$bright_magenta"
  vim.g.terminal_color_14 = "$bright_cyan"
  vim.g.terminal_color_15 = "$bright_white"
end

local function apply_colors(groups, extend)
  for group, attrs in pairs(groups) do
    if extend then
      local base = vim.api.nvim_get_hl(0, { name = group }) or {}
      vim.api.nvim_set_hl(0, group, vim.tbl_extend("force", base, attrs))
    else
      vim.api.nvim_set_hl(0, group, attrs)
    end
  end
end

-- Load config and apply colors

vim.cmd("highlight clear")

vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "$name"

require("laserwave").set_flavor("$flavor")
local cfg = require("laserwave").get_config()

apply_colors({
--%% begin spec %%--
--%% end spec %%--
})

if cfg.options.transparent then
  apply_colors({ Normal = { bg = nil } }, true)
end

apply_colors({
  Comment = { italic = cfg.options.italic_comments },
  Function = { italic = cfg.options.italic_functions },
  Statement = { italic = cfg.options.italic_keywords },
  Keyword = { italic = cfg.options.italic_keywords },
  Include = { italic = cfg.options.italic_keywords },
  Identifier = { italic = cfg.options.italic_variables },
}, true)

if cfg.treesitter then apply_colors({
--%% begin treesitter %%--
--%% end treesitter %%--
}) end

if cfg.semantic_highlights then apply_colors({
--%% begin semantic_highlights %%--
--%% end semantic_highlights %%--
}) end

if cfg.plugins.alpha then apply_colors({
--%% begin alpha %%--
--%% end alpha %%--
}) end

if cfg.plugins.blink then apply_colors({
--%% begin blink %%--
--%% end blink %%--
}) end

if cfg.plugins.cmp then apply_colors({
--%% begin cmp %%--
--%% end cmp %%--
}) end

if cfg.plugins.git then apply_colors({
--%% begin git %%--
--%% end git %%--
}) end

if cfg.plugins.lsp then apply_colors({
--%% begin lsp %%--
--%% end lsp %%--
}) end

if cfg.plugins.mini_pick then apply_colors({
--%% begin mini_pick %%--
--%% end mini_pick %%--
}) end

if cfg.plugins.neotree then apply_colors({
--%% begin neotree %%--
--%% end neotree %%--
}) end

if cfg.plugins.obsidian then apply_colors({
--%% begin obsidian %%--
--%% end obsidian %%--
}) end

if cfg.plugins.occurrence then apply_colors({
--%% begin occurrence %%--
--%% end occurrence %%--
}) end

if cfg.plugins.package_info then apply_colors({
--%% begin package_info %%--
--%% end package_info %%--
}) end

if cfg.plugins.snacks then apply_colors({
--%% begin snacks %%--
--%% end snacks %%--
}) end

if cfg.plugins.space then apply_colors({
--%% begin space %%--
--%% end space %%--
}) end

if cfg.plugins.telescope then apply_colors({
--%% begin telescope %%--
--%% end telescope %%--
}) end
]])
