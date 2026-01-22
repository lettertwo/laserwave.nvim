-- Semantic highlights for LSP.
-- Note that the majority of common semantic tokens are linked to
-- Tree-sitter highlight groups by default in Neovim, so only overrides
-- and additions are necessary here.
--
-- NOTE: Treesitter must be enabled for LSP semantic highlighting to work as intended.
--
-- See: :h lsp-semantic-highlight
--
---@type laserwave.Groups
--stylua: ignore
local semantics = {
	["@lsp.type.enumMember"]                 = "@constant",
	["@lsp.type.variable"]                   = {}, -- Use treesitter's variable highlighting
	["@lsp.typemod.function.defaultLibrary"] = "@function.builtin",
	["@lsp.typemod.function.builtin"]        = "@function.builtin",
  ["@lsp.typemod.variable.static"]         = "@constant",
}

return semantics
