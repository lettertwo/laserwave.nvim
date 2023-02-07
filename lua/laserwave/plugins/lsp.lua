-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")

local palette = require("laserwave.palette")
local ui = require("laserwave.ui")

---@diagnostic disable: undefined-global
local lsp = lush(function()
  --stylua: ignore start
  return {
    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!

    LspReferenceText            { gui = "underline", bg = ui.Visual.bg }, -- Used for highlighting "text" references
    LspReferenceRead            { gui = "underline", bg = ui.Visual.bg }, -- Used for highlighting "read" references
    LspReferenceWrite           { gui = "underline", bg = ui.Visual.bg }, -- Used for highlighting "write" references
    LspCodeLens                 { ui.VirtualText }, -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    LspCodeLensSeparator        { ui.VirtualText }, -- Used to color the seperator between two or more code lens.
    LspSignatureActiveParameter { ui.VirtualText }, -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!

    DiagnosticError            { fg = palette.ERROR },   -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn             { fg = palette.WARNING }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo             { fg = palette.INFO },    -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint             { fg = palette.HINT },    -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticVirtualTextError { fg = palette.ERROR, bg = palette.ERROR.darken(75) },     -- Used for "Error" diagnostic virtual text.
    DiagnosticVirtualTextWarn  { fg = palette.WARNING, bg = palette.WARNING.darken(75) }, -- Used for "Warn" diagnostic virtual text.
    DiagnosticVirtualTextInfo  { fg = palette.INFO, bg = palette.INFO.darken(75) },       -- Used for "Info" diagnostic virtual text.
    DiagnosticVirtualTextHint  { fg = palette.HINT, bg = palette.HINT.darken(75) },       -- Used for "Hint" diagnostic virtual text.
    DiagnosticUnderlineError   { gui = "undercurl", sp = palette.ERROR },   -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn    { gui = "undercurl", sp = palette.WARNING }, -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo    { gui = "undercurl", sp = palette.INFO },    -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint    { gui = "undercurl", sp = palette.HINT },    -- Used to underline "Hint" diagnostics.
    -- DiagnosticFloatingError    { }, -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { }, -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { }, -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { }, -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { }, -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { }, -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { }, -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { }, -- Used for "Hint" signs in sign column.
  }
  --stylua: ignore end
end)

return lsp
