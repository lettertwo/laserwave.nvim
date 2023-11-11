local lush = require("lush")
local palette = require("laserwave.spec.palette")

---@diagnostic disable: undefined-global
--stylua: ignore
local terminal = lush(function()
  return {
    TerminalBlack         { fg = palette.terminal.BLACK },
    TerminalBrightBlack   { fg = palette.terminal.BRIGHT_BLACK },
    TerminalRed           { fg = palette.terminal.RED },
    TerminalBrightRed     { fg = palette.terminal.BRIGHT_RED },
    TerminalGreen         { fg = palette.terminal.GREEN },
    TerminalBrightGreen   { fg = palette.terminal.BRIGHT_GREEN },
    TerminalYellow        { fg = palette.terminal.YELLOW },
    TerminalBrightYellow  { fg = palette.terminal.BRIGHT_YELLOW },
    TerminalBlue          { fg = palette.terminal.BLUE },
    TerminalBrightBlue    { fg = palette.terminal.BRIGHT_BLUE },
    TerminalMagenta       { fg = palette.terminal.MAGENTA },
    TerminalBrightMagenta { fg = palette.terminal.BRIGHT_MAGENTA },
    TerminalCyan          { fg = palette.terminal.CYAN },
    TerminalBrightCyan    { fg = palette.terminal.BRIGHT_CYAN },
    TerminalWhite         { fg = palette.terminal.WHITE },
    TerminalBrightWhite   { fg = palette.terminal.BRIGHT_WHITE },
  }
end)

return terminal
