local template = require("laserwave.template")

-- Generate the Laserwave colorscheme for neovim.
return template.create([[
-- GENERATED ON $date AT $time

-- name:     $name
-- author:   $author
-- license:  $license
-- upstream: $upstream
-- blurb:    $blurb

local specs = {
--%% begin compiled_specs %%--
--%% end compiled_specs %%--
}

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

-- Load config and apply colors

vim.cmd("highlight clear")

vim.o.background = "$background"
vim.o.termguicolors = true
vim.g.colors_name = "$name"

require("laserwave").set_flavor("$flavor")
local cfg = require("laserwave").get_config()

apply_colors(specs.spec)

if cfg.terminal_colors then
  apply_terminal_colors()
end

if cfg.transparent then
  apply_colors({ Normal = { bg = nil } }, true)
end

apply_colors({
  Comment = { italic = cfg.italic_comments },
  Function = { italic = cfg.italic_functions },
  Statement = { italic = cfg.italic_keywords },
  Keyword = { italic = cfg.italic_keywords },
  Include = { italic = cfg.italic_keywords },
  Identifier = { italic = cfg.italic_variables },
}, true)

for key, value in pairs(cfg.plugins) do
  if value and specs.plugins[key] then
    apply_colors(specs.plugins[key])
  end
end

if cfg.treesitter and specs.plugins.treesitter then
  apply_colors(specs.plugins.treesitter)
end

if cfg.semantic_highlights and specs.plugins.semantic_highlights then
  apply_colors(specs.plugins.semantic_highlights)
end
]])
