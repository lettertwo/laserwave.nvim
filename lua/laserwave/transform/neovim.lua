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

-- Load config and apply colors

vim.cmd("highlight clear")

vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "$name"

require("laserwave").set_flavor("$flavor")
local cfg = require("laserwave").get_config()

apply_colors(specs.spec)

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

if cfg.treesitter and specs.plugins.treesitter then
  apply_colors(specs.plugins.treesitter)
end

if cfg.semantic_highlights and specs.plugins.semantic_highlights then
  apply_colors(specs.plugins.semantic_highlights)
end

for key, value in pairs(cfg.plugins) do
  if value and specs.plugins[key] then
    apply_colors(specs.plugins[key])
  end
end
]])
