# Lupine.nvim

A light Neovim colorscheme with magenta-blue accents.

## Requirements

Neovim 0.8 or later with true color support enabled:

```lua
vim.opt.termguicolors = true
```

## Install

### lazy.nvim

```lua
{
    "bjarneo/lupine.nvim",
    priority = 1000,
    config = function()
        require("lupine").setup()
        vim.cmd.colorscheme("lupine")
    end,
}
```

### LazyVim

Create `~/.config/nvim/lua/plugins/colorscheme.lua`:

```lua
return {
    {
        "bjarneo/lupine.nvim",
        name = "lupine",
        priority = 1000,
        opts = {},
        config = function(_, opts)
            require("lupine").setup(opts)
            vim.cmd.colorscheme("lupine")
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "lupine",
        },
    },
}
```

## Configuration

All options and their defaults:

```lua
require("lupine").setup({
    transparent = false,
    terminal_colors = true,
    dim_inactive = false,
    lualine_bold = false,

    styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",     -- "dark", "transparent", or "normal"
        floats = "dark",       -- "dark", "transparent", or "normal"
    },

    on_highlights = function(highlights, colors) end,

    plugins = {
        all = package.loaded.lazy == nil,
        auto = true,
    },
})
```

## Color Palette

### Backgrounds

| Name | Hex | Purpose |
| --- | --- | --- |
| `bg` | `#fafafa` | Editor background |
| `dark_bg` | `#f0f0f0` | Sidebars, statusline |
| `darker_bg` | `#e8e8e8` | Darkest background |
| `lighter_bg` | `#ececec` | Cursor line, highlights |

### Foregrounds

| Name | Hex | Purpose |
| --- | --- | --- |
| `fg` | `#212121` | Default text |
| `light_fg` | `#2f2f2f` | Light foreground |
| `bright_fg` | `#000000` | Brightest foreground |
| `dark_fg` | `#6e6e6e` | Secondary text |
| `muted` | `#9a9a9a` | Comments, line numbers |

### Accents

| Name | Hex | Purpose |
| --- | --- | --- |
| `accent` | `#3264eb` | Primary accent |
| `red` | `#c900c4` | Errors, deletions |
| `yellow` | `#026fde` | Types, warnings |
| `orange` | `#d126cd` | Constants, numbers |
| `green` | `#0a8fb8` | Strings, additions |
| `cyan` | `#0c67de` | Regex, hints |
| `blue` | `#3264eb` | Keywords, info |
| `purple` | `#8a4ad7` | Storage, tags |
| `brown` | `#7d177b` | Escape sequences |

### Bright Variants

| Name | Hex |
| --- | --- |
| `bright_red` | `#f930fb` |
| `bright_yellow` | `#358fff` |
| `bright_green` | `#2bb3d9` |
| `bright_cyan` | `#3986ff` |
| `bright_blue` | `#5482ff` |
| `bright_purple` | `#b363ff` |

### Selection

| Name | Hex | Purpose |
| --- | --- | --- |
| `cursor` | `#212121` | Cursor color |
| `selection` | `#c8d4ff` | Visual selection |
| `selection_foreground` | `#212121` | Selection text |
| `selection_background` | `#c8d4ff` | Selection background |

## Advanced Customization

### Override highlight groups

```lua
require("lupine").setup({
    on_highlights = function(hl, colors)
        hl.Comment = { fg = colors.muted, italic = true }
        hl.Function = { fg = colors.bright_blue, bold = true }
    end,
})
```

### Transparent background

```lua
require("lupine").setup({
    transparent = true,
    styles = {
        sidebars = "transparent",
        floats = "transparent",
    },
})
```

### Disable italics

```lua
require("lupine").setup({
    styles = {
        comments = {},
        keywords = {},
    },
})
```

## Lualine

```lua
require("lualine").setup({
    options = {
        theme = "lupine",
    },
})
```

## Supported Plugins

Blink.cmp, Comment.nvim, conform.nvim, Diffview, Fidget, Flash, Gitsigns, indent blankline, Mason, Mini.nvim, Neo tree, Noice, nvim dap, nvim lint, nvim tree, Snacks, Telescope, Trouble, Which Key

Core support is always loaded for LSP diagnostics, Treesitter, Markdown, and Git.

## License

MIT

## Author

Bjarne Øverli ([@iamdothash](https://x.com/iamdothash))
