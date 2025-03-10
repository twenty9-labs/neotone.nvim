# NeoTone.nvim

Tune your Neovim to the perfect tone—light or dark, system-synced or manual.

NeoTone is a lightweight Neovim plugin that switches between light and dark themes, either by syncing with your system appearance (macOS supported) or via manual configuration. In art, "tone" refers to how light or dark a color is—NeoTone brings that concept to your editor.

## Features
- Syncs with macOS system appearance.
- Configure a theme for dark and light mode.
- Works with any installed themes.
- Reload on demand with `:ReloadNeoTone` if appearance changes.

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
{
  "twenty9-labs/neotone.nvim",
  config = function()
    require("neotone").setup()
  end
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)
```lua 
use {
  "twenty9-labs/neotone.nvim",
  config = function()
    require("neotone").setup()
  end
}
```

Run your plugin manager’s install command (e.g., `:Lazy sync`, `:PackerSync`).

## Usage

Basic setup with defaults:  
```lua
require("neotone").setup()
```  
*-- Uses "system" mode with "default" (dark) and "default" (light) themes*

Custom configuration:  
```lua
require("neotone").setup({
    mode = "system",
    themes = {
        dark = "tokyonight",
        light = "gruvbox-light",
    },
})
```

Reload the theme anytime if the appearance has changed while having neovim open:  
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
