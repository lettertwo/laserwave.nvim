local template = require("laserwave.transform.template")

return template.create([[
## GENERATED ON $date AT $time

[delta "$name"]
    # author: $author
    # license: $license
    # upstream: $upstream
    # blurb: $blurb

    syntax-theme = "$name"

    # settings
    dark = true
    keep-plus-minus-markers = false
    line-numbers = true
    decorations = true
    hyperlinks = true
    relative-paths = true
    navigate = true
    side-by-side = false
    width = -4
    tabs = 2

    # icons
    file-added-label = []
    file-copied-label = []
    file-modified-label = [󰛄]
    file-removed-label = []
    file-renamed-label = []
    merge-conflict-begin-symbol = 
    merge-conflict-end-symbol = 

    # blame
    blame-code-style = syntax
    blame-format = "{author:<18} {commit:<6} {timestamp:<15}"
    blame-palette = "$line_bg $selection_bg"
    blame-separator-format = "{n:^4}│"
    blame-separator-style = "$accent"

    # commit
    commit-decoration-style = "$accent" box
    commit-style = "$accent" bold italic

    # hunk header
    file-style = omit
    hunk-header-style = file line-number syntax dim italic
    hunk-header-decoration-style = "$ignore_fg" ul
    hunk-header-file-style = "$bright_black" box bold
    hunk-header-line-number-style = "$yellow" box bold

    # hunks
    plus-style = "$added_fg"
    plus-emph-style = "$added_bg" "$added_fg"
    minus-style = "$deleted_fg"
    minus-emph-style = "$deleted_bg" "$deleted_fg"
    zero-style = syntax dim
    whitespace-error-style = reverse "$bright_red"

    # line numbers
    line-numbers-minus-style = "$deleted_fg"
    line-numbers-plus-style = "$added_fg"
    line-numbers-left-style = "$ignore_fg"
    line-numbers-right-style = "$ignore_fg"
    line-numbers-zero-style = "$ignore_fg" dim

    # merge conflicts
    merge-conflict-ours-diff-header-style = "$yellow" bold
    merge-conflict-ours-diff-header-decoration-style = "$bright_red" box
    merge-conflict-theirs-diff-header-style = "$yellow" bold
    merge-conflict-theirs-diff-header-decoration-style = "$bright_red" box
]])
