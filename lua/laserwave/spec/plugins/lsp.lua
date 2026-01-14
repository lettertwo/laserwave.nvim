local palette = require("laserwave.palette")

-- These groups are for the native LSP client and diagnostic system. Some
-- other LSP clients may use these groups, or use their own. Consult your
-- LSP client's documentation.
---@type LaserwaveSpec
--stylua: ignore
local lsp = {
  -- LSP Semantic Token Groups that preserve treesitter highlights
  -- from https://gist.github.com/swarn/fb37d9eefe1bc616c2a7e476c0bc0316
  ["@lsp.type.namespace"]  = '@namespace',
  ["@lsp.type.type"]       = '@type',
  ["@lsp.type.class"]      = '@type',
  ["@lsp.type.enum"]       = '@type',
  ["@lsp.type.interface"]  = '@type',
  ["@lsp.type.struct"]     = '@structure',
  ["@lsp.type.parameter"]  = '@parameter',
  ["@lsp.type.variable"]   = '@variable',
  ["@lsp.type.property"]   = '@property',
  ["@lsp.type.enumMember"] = '@constant',
  ["@lsp.type.function"]   = '@function',
  ["@lsp.type.method"]     = '@method',
  ["@lsp.type.macro"]      = '@macro',
  ["@lsp.type.decorator"]  = '@function',

  LspReferenceText            = { bg = palette.VISUAL:mix(palette.BG, 80) }, -- Used for highlighting "text" references
  LspReferenceRead            = { bg = palette.VISUAL:mix(palette.BG, 80) }, -- Used for highlighting "read" references
  LspReferenceWrite           = { bg = palette.VISUAL:mix(palette.BG, 80) }, -- Used for highlighting "write" references
  LspCodeLensSeparator        = "VirtualText", -- Used to color the seperator between two or more code lens.
  LspSignatureActiveParameter = "VirtualText", -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.
  LspInfoBorder               = "FloatBorder",

  DiagnosticError            = { fg = palette.ERROR },   -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
  DiagnosticWarn             = { fg = palette.WARNING }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
  DiagnosticInfo             = { fg = palette.INFO },    -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
  DiagnosticHint             = { fg = palette.HINT },    -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
  DiagnosticOk               = { fg = palette.OK },      -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
  DiagnosticVirtualTextError = { fg = palette.ERROR, bg = palette.ERROR:darken(75) },     -- Used for "Error" diagnostic virtual text.
  DiagnosticVirtualTextWarn  = { fg = palette.WARNING, bg = palette.WARNING:darken(75) }, -- Used for "Warn" diagnostic virtual text.
  DiagnosticVirtualTextInfo  = { fg = palette.INFO, bg = palette.INFO:darken(75) },       -- Used for "Info" diagnostic virtual text.
  DiagnosticVirtualTextHint  = { fg = palette.HINT, bg = palette.HINT:darken(75) },       -- Used for "Hint" diagnostic virtual text.
  DiagnosticVirtualTextOk    = { fg = palette.OK, bg = palette.OK:darken(75) },           -- Used for "Ok" diagnostic virtual text.
  DiagnosticUnderlineError   = { undercurl = true, sp = palette.ERROR },   -- Used to underline "Error" diagnostics.
  DiagnosticUnderlineWarn    = { undercurl = true, sp = palette.WARNING }, -- Used to underline "Warn" diagnostics.
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
