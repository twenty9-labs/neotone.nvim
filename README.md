# NeoTone.nvim

Tune your Neovim to the perfect tone—light or dark, system-synced or manual.

![NeoTone Demo](https://via.placeholder.com/600x200.png?text=NeoTone+Demo)

NeoTone is a lightweight Neovim plugin that switches between light and dark themes, either by syncing with your system appearance (macOS supported) or via manual configuration. In art, "tone" refers to how light or dark a color is—NeoTone brings that concept to your editor.

## Features
- Syncs with macOS system appearance.
- Configure a theme for dark and light mode.
- Works with any installed themes.
- Reload on demand with `:ReloadNeoTone` if appearance changes.

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)
`{ "twenty9-labs/neotone.nvim", config = function() require("neotone").setup() end }`

### [packer.nvim](https://github.com/wbthomason/packer.nvim)
`use { "twenty9-labs/neotone.nvim", config = function() require("neotone").setup() end }`

### [vim-plug](https://github.com/junegunn/vim-plug)
`Plug 'twenty9-labs/neotone.nvim'`  
Then in your `init.lua`: `require("neotone").setup()`

Run your plugin manager’s install command (e.g., `:Lazy sync`, `:PackerSync`, or `:PlugInstall`).

## Usage

Basic setup with defaults:  
`require("neotone").setup()`  
*-- Uses "system" mode with "default" (dark) and "default" (light) themes*

Custom configuration:  
`require("neotone").setup({ mode = "dark", -- Force dark mode themes = { dark = "tokyonight", -- Requires this theme to be installed light = "gruvbox-light", -- Requires this theme to be installed }, })`

Reload the theme anytime:  
`:ReloadNeoTone`

## Configuration

| Option         | Description                              | Default         |
|----------------|------------------------------------------|-----------------|
| `mode`         | `"system"`, `"dark"`, or `"light"`       | `"system"`      |
| `themes.dark`  | Name of the dark theme                   | `"default"`     |
| `themes.light` | Name of the light theme                  | `"default"`       |

- `"system"`: Syncs with macOS appearance (falls back to `"dark"` on other OSes).
- `"dark"`: Forces dark mode.
- `"light"`: Forces light mode.

See `:help neotone` for more details after installation.

## Requirements
- Neovim 0.9+ (may work on older versions, but not tested)
- macOS

## Contributing
Found a bug? Want a feature? Open an issue or PR at [twenty9-labs/neotone.nvim](https://github.com/twenty9-labs/neotone.nvim)!

## License
MIT © twenty9-labs
