local palette = require("laserwave.palette")

---@type laserwave.Groups
--stylua: ignore
local neogit = {
    -- STATUS BUFFER
    -- NeogitNormal      = {}, -- Normal text
    -- NeogitFloat       = {}, -- Normal text when using a floating window
    -- NeogitFloatBorder = {}, -- Border wen using a floating window
    -- NeogitBranch      = {}, -- Local branches
    -- NeogitBranchHead  = {}, -- Accent highlight for current HEAD in LogBuffer
    -- NeogitRemote      = {}, -- Remote branches
    -- NeogitObjectId    = {}, -- Object's SHA hash
    -- NeogitStash       = {}, -- Stash name
    -- NeogitFold        = {}, -- Folded text highlight
    -- NeogitFoldColumn  = {}, -- Column where folds are displayed
    -- NeogitSignColumn  = {}, -- Column where signs are displayed
    -- NeogitRebaseDone  = {}, -- Current position within rebase
    -- NeogitTagName     = {}, -- Closest Tag name
    -- NeogitTagDistance = {}, -- Number of commits between the tag and HEAD
    -- NeogitStatusHEAD  = {}, -- The left text in the HEAD section

    -- STATUS BUFFER SECTION HEADERS
    -- NeogitSectionHeader      = {},
    -- NeogitUnpushedTo         = {}, -- Linked to NeogitSectionHeader
    -- NeogitUnmergedInto       = {}, -- ^
    -- NeogitUnpulledFrom       = {}, -- ^
    -- NeogitUntrackedfiles     = {}, -- ^
    -- NeogitUnstagedchanges    = {}, -- ^
    -- NeogitUnmergedchanges    = {}, -- ^
    -- NeogitUnpushedchanges    = {}, -- ^
    -- NeogitUnpulledchanges    = {}, -- ^
    -- NeogitRecentcommits      = {}, -- ^
    -- NeogitStagedchanges      = {}, -- ^
    -- NeogitStashes            = {}, -- ^
    -- NeogitRebasing           = {}, -- ^
    -- NeogitReverting          = {}, -- ^
    -- NeogitPicking            = {}, -- ^
    -- NeogitMerging            = {}, -- ^
    -- NeogitBisecting          = {}, -- ^
    -- NeogitSectionHeaderCount = {}, -- The number, for sections with a number.

    -- STATUS BUFFER FILE
    -- Applied to the label on the left of filenames. These highlight groups are not
    -- used directly, but linked to by other groups:
    --
    -- NeogitChangeModified = {},
    -- NeogitChangeAdded    = {},
    -- NeogitChangeDeleted  = {},
    -- NeogitChangeRenamed  = {},
    -- NeogitChangeUpdated  = {},
    -- NeogitChangeCopied   = {},
    -- NeogitChangeNewFile  = {},
    -- NeogitChangeUnmerged = {},

    -- SIGNS FOR LINE HIGHLIGHTING
    -- Used to highlight different sections of the status buffer or commit buffer.
    NeogitHunkHeader  = { fg = palette.terminal.BRIGHT_BLACK, bold = true },
    NeogitDiffContext = { },
    NeogitDiffAdd     = { fg = palette.ADD },
    NeogitDiffDelete  = { fg = palette.DELETE },
    -- NeogitDiffHeader  = {},
    -- NeogitActiveItem  = {}, -- Highlight of current commit-ish open

    -- SIGNS FOR LINE HIGHLIGHTING CURRENT CONTEXT
    -- These are essentially an accented version of the above highlight groups. Only
    -- applies to the current context the cursor is within.
    --
    -- The "Cursor" suffix applies only to the Cursor line
    --
    NeogitHunkHeaderHighlight  = { bg = palette.BG_CURSOR_LINE, fg = palette.terminal.BRIGHT_BLACK, bold = true },
    NeogitDiffContextHighlight = { },
    NeogitDiffAddHighlight     = { fg = palette.ADD },
    NeogitDiffDeleteHighlight  = { fg = palette.DELETE },
    -- NeogitDiffHeaderHighlight  = {},
    -- NeogitHunkHeaderCursor     = {},
    -- NeogitDiffContextCursor    = {},
    -- NeogitDiffAddCursor        = {},
    -- NeogitDiffDeleteCursor     = {},
    -- NeogitDiffHeaderCursor     = {},

    -- COMMIT BUFFER
    -- NeogitFilePath         = {}, -- Applied to filepath
    -- NeogitCommitViewHeader = {}, -- Applied to header of Commit View

    -- LOG VIEW BUFFER
    -- NeogitGraphAuthor     = {}, -- Applied to the commit's author in graph view
    -- NeogitGraphBlack      = {}, -- Used when --colors is enabled for graph
    -- NeogitGraphBoldBlack  = {},
    -- NeogitGraphRed        = {},
    -- NeogitGraphBoldRed    = {},
    -- NeogitGraphGreen      = {},
    -- NeogitGraphBoldGreen  = {},
    -- NeogitGraphYellow     = {},
    -- NeogitGraphBoldYellow = {},
    -- NeogitGraphBlue       = {},
    -- NeogitGraphBoldBlue   = {},
    -- NeogitGraphPurple     = {},
    -- NeogitGraphBoldPurple = {},
    -- NeogitGraphCyan       = {},
    -- NeogitGraphBoldCyan   = {},
    -- NeogitGraphWhite      = {},
    -- NeogitGraphBoldWhite  = {},
    -- NeogitGraphGray       = {},
    -- NeogitGraphBoldGray   = {},
    -- NeogitGraphOrange     = {},

    -- NeogitSignatureGood           = {}, -- For highlighting the commit hash when
    -- NeogitSignatureBad            = {}, -- --show-signature is passed
    -- NeogitSignatureMissing        = {},
    -- NeogitSignatureNone           = {},
    -- NeogitSignatureGoodUnknown    = {},
    -- NeogitSignatureGoodExpired    = {},
    -- NeogitSignatureGoodExpiredKey = {},
    -- NeogitSignatureGoodRevokedKey = {},

    -- POPUPS
    -- NeogitPopupSectionTitle = {}, -- Applied to all section headers
    -- NeogitPopupBranchName   = {}, -- Applied to the current branch name for emphasis
    -- NeogitPopupBold         = {}, -- Applied on "@{upstream}" and "pushRemote" for emphasis (but less emphasis than BranchName)

    -- NeogitPopupSwitchKey      = {}, -- Applied to the key that will toggle switch
    -- NeogitPopupSwitchEnabled  = {}, -- Applied to the flag if enabled
    -- NeogitPopupSwitchDisabled = {}, -- Applied to the flag if disabled

    -- NeogitPopupOptionKey      = {}, -- Applied to the key that will trigger option
    -- NeogitPopupOptionEnabled  = {}, -- Applied if option is set
    -- NeogitPopupOptionDisabled = {}, -- Applied if option has no value

    -- NeogitPopupConfigKey      = {}, -- Applied to the key that triggers config
    -- NeogitPopupConfigEnabled  = {}, -- Applied to enabled config value
    -- NeogitPopupConfigDisabled = {}, -- Applied to config without value

    -- NeogitPopupActionKey      = {}, -- Applied to key that triggers function
    -- NeogitPopupActionDisabled = {}, -- Applied to key when function is unimplemented

    -- COMMAND HISTORY BUFFER
    -- NeogitCommandText       = {}, -- Git command that was run
    -- NeogitCommandTime       = {}, -- Execution time
    -- NeogitCommandCodeNormal = {}, -- Applied to a successful command's exit status (0)
    -- NeogitCommandCodeError  = {}, -- When command exits with non-zero status

    -- COMMIT SELECT BUFFER
    -- NeogitFloatHeader          = {}, -- Foreground/Background for header text at top of win
    -- NeogitFloatHeaderHighlight = {}, -- Emphasized text in header
}

return neogit
