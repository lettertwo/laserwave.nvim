# laserwave.nvim

A clean 80's synthwave / outrun inspired theme written in Lua ported from
the Visual Studio Code [LaserWave](https://github.com/Jaredk3nt/laserwave) theme.

# Installation

### Requirements

- Neovim >= 0.10.0

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "lettertwo/laserwave.nvim",
  lazy = false,
  priority = 1000,
}
```

### Using :h vim.pack

```lua
vim.pack.add("lettertwo/laserwave.nvim")
```

# Usage

Try it out using the `:Laserwave` command:

```vim
:Laserwave original
:Laserwave hi_c
```

To use the theme by default, add the following line to your `init.lua`:

```lua
vim.cmd.colorscheme("laserwave")
# or the high contrast version
vim.cmd.colorscheme("laserwave-hi_c")
```

## Lualine

```lua
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'laserwave'
    -- ... your lualine config
  }
}
```

# Configuration

Setup is completely optional. If you want to change them, be sure to call `laserwave.setup({})` before loading the theme.

Here are the default settings:

```lua
require("laserwave").setup({
  flavor = "original", -- "original" | "hi_c"
  -- possible modes: "lsp" (semantic highlights) | "treesitter" (no semantic highlights) | "vim" (builtins only)
  syntax_mode = "lsp"
  transparent = false,
  terminal_colors = true,
  italic_comments = true,
  italic_keywords = true,
  italic_functions = false,
  italic_variables = false,
  plugins = {
    blink = true,
    cmp = false,
    git = true,
    mini_pick = true,
    neotree = false,
    obsidian = true,
    occurrence = true,
    package_info = false,
    snacks = true,
    space = true,
    telescope = true,
  },
})
```

# Extras

Laserwave themes for other applications are bundled in [dist](https://github.com/lettertwo/laserwave.nvim/blob/main/dist)

<!-- panvimdoc-ignore-start -->

# License

MIT License. See [LICENSE](https://github.com/lettertwo/laserwave.nvim/blob/main/LICENSE) for details.

# Contributing

Contributions are welcome! See [CONTRIBUTING](https://github.com/lettertwo/laserwave.nvim/blob/main/CONTRIBUTING.md) for details.

<!-- panvimdoc-ignore-end -->
