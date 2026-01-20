local palette = require("laserwave.palette")

-- These groups are for the native LSP client and diagnostic system. Some
-- other LSP clients may use these groups, or use their own. Consult your
-- LSP client's documentation.
---@type laserwave.Spec
--stylua: ignore
local lsp = {
  -- LSP Semantic Token Groups that preserve treesitter highlights
  -- from https://gist.github.com/swarn/fb37d9eefe1bc616c2a7e476c0bc0316
  ["@lsp.type.boolean"]                      = "@boolean",
  ["@lsp.type.builtinType"]                  = "@type.builtin",
  ["@lsp.type.comment"]                      = "@comment",
  ["@lsp.type.decorator"]                    = "@attribute",
  ["@lsp.type.deriveHelper"]                 = "@attribute",
  ["@lsp.type.enum"]                         = "@type",
  ["@lsp.type.enumMember"]                   = "@constant",
  ["@lsp.type.escapeSequence"]               = "@string.escape",
  ["@lsp.type.formatSpecifier"]              = "@markup.list",
  ["@lsp.type.generic"]                      = "@variable",
  ["@lsp.type.interface"]                    = "@type",
  ["@lsp.type.keyword"]                      = "@keyword",
  ["@lsp.type.keyword.lua"]                  = "@keyword",
  ["@lsp.type.lifetime"]                     = "@keyword.storage",
  ["@lsp.type.namespace"]                    = "@module",
  ["@lsp.type.namespace.python"]             = "@variable",
  ["@lsp.type.number"]                       = "@number",
  ["@lsp.type.operator"]                     = "@operator",
  ["@lsp.type.parameter"]                    = "@variable.parameter",
  ["@lsp.type.property"]                     = "@property",
  ["@lsp.type.selfKeyword"]                  = "@variable.builtin",
  ["@lsp.type.selfTypeKeyword"]              = "@variable.builtin",
  ["@lsp.type.string"]                       = "@string",
  ["@lsp.type.typeAlias"]                    = "@type.definition",
  ["@lsp.type.unresolvedReference"]          = { undercurl = true, sp = palette.ERROR },
  ["@lsp.type.variable"]                     = {}, -- use treesitter styles for regular variables
  ["@lsp.typemod.class.defaultLibrary"]      = "@type.builtin",
  ["@lsp.typemod.enum.defaultLibrary"]       = "@type.builtin",
  ["@lsp.typemod.enumMember.defaultLibrary"] = "@constant.builtin",
  ["@lsp.typemod.function.defaultLibrary"]   = "@function.builtin",
  ["@lsp.typemod.keyword.async"]             = "@keyword.coroutine",
  ["@lsp.typemod.keyword.injected"]          = "@keyword",
  ["@lsp.typemod.macro.defaultLibrary"]      = "@function.builtin",
  ["@lsp.typemod.method.defaultLibrary"]     = "@function.builtin",
  ["@lsp.typemod.operator.injected"]         = "@operator",
  ["@lsp.typemod.string.injected"]           = "@string",
  ["@lsp.typemod.struct.defaultLibrary"]     = "@type.builtin",
  ["@lsp.typemod.type.defaultLibrary"]       = "@type.builtin",
  ["@lsp.typemod.typeAlias.defaultLibrary"]  = "@type.builtin",
  ["@lsp.typemod.variable.callable"]         = "@function",
  ["@lsp.typemod.variable.defaultLibrary"]   = "@variable.builtin",
  ["@lsp.typemod.variable.injected"]         = "@variable",
  ["@lsp.typemod.variable.static"]           = "@constant",

  LspReferenceText            = { bg = palette.BG_VISUAL }, -- Used for highlighting "text" references
  LspReferenceRead            = { bg = palette.BG_VISUAL }, -- Used for highlighting "read" references
  LspReferenceWrite           = { bg = palette.BG_VISUAL }, -- Used for highlighting "write" references
  LspCodeLensSeparator        = { fg = palette.IGNORE, bg = palette.BG_VISUAL }, -- Used to color the seperator between two or more code lens.
  LspSignatureActiveParameter = { fg = palette.IGNORE, bg = palette.BG_VISUAL }, -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.
  LspInfoBorder               = "FloatBorder",

  DiagnosticError            = { fg = palette.ERROR },   -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
  DiagnosticWarn             = { fg = palette.WARN }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
  DiagnosticInfo             = { fg = palette.INFO },    -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
  DiagnosticHint             = { fg = palette.HINT },    -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
  DiagnosticOk               = { fg = palette.OK },      -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
  DiagnosticVirtualTextError = { fg = palette.ERROR, bg = palette.BG_ERROR },     -- Used for "Error" diagnostic virtual text.
  DiagnosticVirtualTextWarn  = { fg = palette.WARN, bg = palette.BG_WARN }, -- Used for "Warn" diagnostic virtual text.
  DiagnosticVirtualTextInfo  = { fg = palette.INFO, bg = palette.BG_INFO },       -- Used for "Info" diagnostic virtual text.
  DiagnosticVirtualTextHint  = { fg = palette.HINT, bg = palette.BG_HINT },       -- Used for "Hint" diagnostic virtual text.
  DiagnosticVirtualTextOk    = { fg = palette.OK, bg = palette.BG_OK },           -- Used for "Ok" diagnostic virtual text.
  DiagnosticUnderlineError   = { undercurl = true, sp = palette.ERROR },   -- Used to underline "Error" diagnostics.
  DiagnosticUnderlineWarn    = { undercurl = true, sp = palette.WARN }, -- Used to underline "Warn" diagnostics.
  DiagnosticUnderlineInfo    = { undercurl = true, sp = palette.INFO },    -- Used to underline "Info" diagnostics.
  DiagnosticUnderlineHint    = { undercurl = true, sp = palette.HINT },    -- Used to underline "Hint" diagnostics.
  DiagnosticUnderlineOk      = { undercurl = true, sp = palette.OK },      -- Used to underline "Ok" diagnostics.
  -- DiagnosticFloatingError    = { }, -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
  -- DiagnosticFloatingWarn     = { }, -- Used to color "Warn" diagnostic messages in diagnostics float.
  -- DiagnosticFloatingInfo     = { }, -- Used to color "Info" diagnostic messages in diagnostics float.
  -- DiagnosticFloatingHint     = { }, -- Used to color "Hint" diagnostic messages in diagnostics float.
  -- DiagnosticFloatingOk       = { }, -- Used to color "Ok" diagnostic messages in diagnostics float.
  -- DiagnosticSignError        = { }, -- Used for "Error" signs in sign column.
  -- DiagnosticSignWarn         = { }, -- Used for "Warn" signs in sign column.
  -- DiagnosticSignInfo         = { }, -- Used for "Info" signs in sign column.
  -- DiagnosticSignHint         = { }, -- Used for "Hint" signs in sign column.
  -- DiagnosticSignOk           = { }, -- Used for "Ok" signs in sign column.
  }

return lsp
