# Neovim Configuration

Personal Neovim configuration based on [NvChad v2.5](https://github.com/NvChad/NvChad).

## Quick Setup

### Linux/macOS
```bash
curl -fsSL https://raw.githubusercontent.com/renl/neovim-config/main/setup.sh | bash
```

### Windows (PowerShell)
```powershell
irm https://raw.githubusercontent.com/renl/neovim-config/main/setup.ps1 | iex
```

## Manual Installation

1. **Backup existing config** (if any):
   ```bash
   # Linux/macOS
   mv ~/.config/nvim ~/.config/nvim.backup
   
   # Windows (PowerShell)
   Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.backup
   ```

2. **Clone this repository**:
   ```bash
   # Linux/macOS
   git clone https://github.com/renl/neovim-config.git ~/.config/nvim
   
   # Windows (PowerShell)
   git clone https://github.com/renl/neovim-config.git $env:LOCALAPPDATA\nvim
   ```

3. **Launch Neovim** - plugins will install automatically on first run.

4. **Install LSP servers**:
   ```
   :MasonInstall html-lsp css-lsp stylua
   ```

## Requirements

- Neovim 0.10+
- Git
- A C compiler (for treesitter)
- [Nerd Font](https://www.nerdfonts.com/) (for icons)

### Optional (recommended)
- ripgrep (for telescope live grep)
- fd (for telescope file finder)
- Node.js (for some LSP servers)

## Structure

```
.
├── init.lua              # Entry point
├── lazy-lock.json        # Plugin version lock
├── .stylua.toml          # Lua formatter config
└── lua/
    ├── autocmds.lua      # Custom autocommands
    ├── chadrc.lua        # NvChad config (theme, UI)
    ├── mappings.lua      # Custom keybindings
    ├── options.lua       # Vim options
    ├── configs/
    │   ├── conform.lua   # Formatter settings
    │   ├── lazy.lua      # Plugin manager settings
    │   └── lspconfig.lua # LSP configuration
    └── plugins/
        ├── init.lua      # Main plugin specs
        └── copilot.lua   # GitHub Copilot
```

## Key Features

- **Theme**: OneDark
- **Plugin Manager**: lazy.nvim (lazy-loaded for fast startup)
- **LSP**: html, css (via nvim-lspconfig)
- **Formatter**: stylua (for Lua)
- **AI**: GitHub Copilot

## Custom Keybindings

| Key | Mode | Action |
|-----|------|--------|
| `;` | Normal | Enter command mode |
| `jk` | Insert | Escape to normal mode |
| `Ctrl+Up` | Insert | Accept Copilot suggestion |
| `Ctrl+Right/Left` | Insert | Next/Prev Copilot suggestion |
| `Ctrl+Down` | Insert | Accept word from Copilot |
| `Ctrl+e` | Insert | Dismiss Copilot suggestion |

## Credits

- [NvChad](https://github.com/NvChad/NvChad)
- [LazyVim](https://github.com/LazyVim/starter)
