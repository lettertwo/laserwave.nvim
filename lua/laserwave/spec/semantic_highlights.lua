-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")

local syntax = require("laserwave.spec.syntax")

-- WIP: These group names lifted from: https://github.com/folke/tokyonight.nvim/blob/f247ee7/lua/tokyonight/theme.lua#L271
---@diagnostic disable: undefined-global
--stylua: ignore
local semantics = lush(function(injected)
  local sym = injected.sym
  return {
    -- sym"@lsp.type.boolean"                      { link = sym"@boolean" },
    -- sym"@lsp.type.builtinType"                  { link = sym"@type.builtin" },
    -- sym"@lsp.type.comment"                      { link = sym"@comment" },
    sym"@lsp.type.decorator"                    { syntax.Define },
    -- sym"@lsp.type.deriveHelper"                 { link = sym"@attribute" },
    -- sym"@lsp.type.enum"                         { link = sym"@type" },
    -- sym"@lsp.type.enumMember"                   { link = sym"@constant" },
    -- sym"@lsp.type.escapeSequence"               { link = sym"@string.escape" },
    -- sym"@lsp.type.formatSpecifier"              { link = sym"@punctuation.special" },
    -- sym"@lsp.type.generic"                      { link = sym"@variable" },
    -- sym"@lsp.type.interface"                    { fg = util.lighten(c.blue1, 0.7) },
    sym"@lsp.type.keyword"                      { syntax.Type },
    sym"@lsp.type.class"                      { syntax.Type },
    -- sym"@lsp.type.lifetime"                     { link = sym"@storageclass" },
    -- sym"@lsp.type.namespace"                    { link = sym"@namespace" },
    -- sym"@lsp.type.number"                       { link = sym"@number" },
    -- sym"@lsp.type.operator"                     { link = sym"@operator" },
    -- sym"@lsp.type.parameter"                    { link = sym"@parameter" },
    -- sym"@lsp.type.property"                     { link = sym"@property" },
    -- sym"@lsp.type.selfKeyword"                  { link = sym"@variable.builtin" },
    -- sym"@lsp.type.selfTypeKeyword"              { link = sym"@variable.builtin" },
    -- sym"@lsp.type.string"                       { link = sym"@string" },
    -- sym"@lsp.type.typeAlias"                    { link = sym"@type.definition" },
    -- sym"@lsp.type.unresolvedReference"          { undercurl = true, sp = c.error },
    sym"@lsp.type.variable"                     { }, -- use treesitter styles for regular variables,
    -- sym"@lsp.typemod.class.defaultLibrary"      { link = sym"@type.builtin" },
    -- sym"@lsp.typemod.enum.defaultLibrary"       { link = sym"@type.builtin" },
    -- sym"@lsp.typemod.enumMember.defaultLibrary" { link = sym"@constant.builtin" },
    -- sym"@lsp.typemod.function.defaultLibrary"   { link = sym"@function.builtin" },
    -- sym"@lsp.typemod.keyword.async"             { link = sym"@keyword.coroutine" },
    -- sym"@lsp.typemod.keyword.injected"          { link = sym"@keyword" },
    -- sym"@lsp.typemod.macro.defaultLibrary"      { link = sym"@function.builtin" },
    -- sym"@lsp.typemod.method.defaultLibrary"     { link = sym"@function.builtin" },
    -- sym"@lsp.typemod.operator.injected"         { link = sym"@operator" },
    -- sym"@lsp.typemod.string.injected"           { link = sym"@string" },
    -- sym"@lsp.typemod.struct.defaultLibrary"     { link = sym"@type.builtin" },
    -- sym"@lsp.typemod.type.defaultLibrary"       { fg = util.darken(c.blue1, 0.8) },
    -- sym"@lsp.typemod.typeAlias.defaultLibrary"  { fg = util.darken(c.blue1, 0.8) },
    sym"@lsp.typemod.variable.callable"         { syntax.Function },
    sym"@lsp.typemod.variable.defaultLibrary"   { syntax.Constant },
    sym"@lsp.typemod.variable.injected"         { syntax.Identifier },
    sym"@lsp.typemod.variable.static"           { syntax.Constant },
  }
end)

return semantics
