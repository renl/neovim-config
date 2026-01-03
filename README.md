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

---

## Keybindings & Usage Guide

> **Note:** `<leader>` is set to `Space` in this config.

### Essential Vim Motions

| Key | Mode | Action |
|-----|------|--------|
| `h/j/k/l` | Normal | Move left/down/up/right |
| `w/b` | Normal | Jump forward/backward by word |
| `0/$` | Normal | Jump to start/end of line |
| `gg/G` | Normal | Jump to start/end of file |
| `Ctrl+u/d` | Normal | Scroll half page up/down |
| `i/a` | Normal | Insert before/after cursor |
| `o/O` | Normal | New line below/above |
| `dd/yy/p` | Normal | Delete/yank/paste line |
| `u/Ctrl+r` | Normal | Undo/redo |
| `.` | Normal | Repeat last command |

### Custom Keybindings (This Config)

| Key | Mode | Action |
|-----|------|--------|
| `;` | Normal | Enter command mode (instead of `:`) |
| `jk` | Insert | Escape to normal mode |

### Window Management

| Key | Action |
|-----|--------|
| `Ctrl+w v` | Split window vertically |
| `Ctrl+w s` | Split window horizontally |
| `Ctrl+w h/j/k/l` | Navigate to left/down/up/right window |
| `Ctrl+w w` | Cycle through windows |
| `Ctrl+w q` | Close current window |
| `Ctrl+w =` | Make all windows equal size |
| `Ctrl+w >/<` | Increase/decrease window width |

### File Explorer (nvim-tree)

| Key | Action |
|-----|--------|
| `Ctrl+n` | Toggle file explorer |
| `<leader>e` | Focus file explorer |

**Inside nvim-tree:**

| Key | Action |
|-----|--------|
| `Enter` or `o` | Open file/folder |
| `a` | Create new file (end with `/` for folder) |
| `d` | Delete file/folder |
| `r` | Rename |
| `c` | Copy |
| `x` | Cut |
| `p` | Paste |
| `y` | Copy filename |
| `Y` | Copy relative path |
| `gy` | Copy absolute path |
| `H` | Toggle hidden files |
| `R` | Refresh tree |
| `q` | Close nvim-tree |
| `Ctrl+w l` | Jump back to editor (exit tree) |

### Telescope (Fuzzy Finder)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fw` | Live grep (search in files) |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Help tags |
| `<leader>fo` | Find old/recent files |
| `<leader>fz` | Find in current buffer |
| `<leader>gt` | Git status |
| `<leader>cm` | Git commits |
| `<leader>th` | Change theme |

**Inside Telescope:**

| Key | Action |
|-----|--------|
| `Ctrl+n/p` | Move to next/previous item |
| `Enter` | Open selected |
| `Ctrl+x` | Open in horizontal split |
| `Ctrl+v` | Open in vertical split |
| `Esc` | Close telescope |

### Buffers & Tabs (Tabufline)

| Key | Action |
|-----|--------|
| `Tab` | Next buffer |
| `Shift+Tab` | Previous buffer |
| `<leader>x` | Close current buffer |
| `<leader>b` | New buffer |

### LSP (Language Server Protocol)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<leader>ca` | Code actions |
| `<leader>ra` | Rename symbol |
| `<leader>fm` | Format file |
| `[d` / `]d` | Previous/next diagnostic |
| `<leader>q` | Diagnostic list |

### Git (gitsigns)

| Key | Action |
|-----|--------|
| `]c` / `[c` | Next/previous hunk |
| `<leader>rh` | Reset hunk |
| `<leader>ph` | Preview hunk |
| `<leader>gb` | Blame line |
| `<leader>td` | Toggle deleted |

### Comments (NvChad)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>/` | Normal | Toggle comment on line |
| `<leader>/` | Visual | Toggle comment on selection |

### Terminal

| Key | Action |
|-----|--------|
| `<leader>h` | Open horizontal terminal |
| `<leader>v` | Open vertical terminal |
| `Alt+h/v` | Toggle horizontal/vertical terminal |
| `Ctrl+x` | Exit terminal mode (then navigate away) |

### Which-Key

Press `<leader>` (Space) and wait a moment to see all available keybindings.

### GitHub Copilot

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+Up` | Insert | Accept suggestion |
| `Ctrl+Right` | Insert | Next suggestion |
| `Ctrl+Left` | Insert | Previous suggestion |
| `Ctrl+Down` | Insert | Accept word |
| `Ctrl+e` | Insert | Dismiss suggestion |

---

## Useful Commands

| Command | Action |
|---------|--------|
| `:w` | Save file |
| `:q` | Quit |
| `:wq` or `:x` | Save and quit |
| `:q!` | Quit without saving |
| `:e <file>` | Open file |
| `:vs <file>` | Open file in vertical split |
| `:sp <file>` | Open file in horizontal split |
| `:Lazy` | Open plugin manager |
| `:Mason` | Open LSP/formatter installer |
| `:LspInfo` | Show LSP status |
| `:checkhealth` | Diagnose issues |
| `:NvCheatsheet` | Show NvChad cheatsheet |

---

## Tips & Tricks

1. **Use `:NvCheatsheet`** - NvChad has a built-in cheatsheet with all keybindings.

2. **Which-key is your friend** - Press `<leader>` (Space) and wait to see available options.

3. **Quick file switching** - Use `<leader>ff` (find files) or `Tab`/`Shift+Tab` for open buffers.

4. **Search and replace**:
   - `:%s/old/new/g` - Replace all in file
   - `:%s/old/new/gc` - Replace all with confirmation

5. **Multiple cursors alternative** - Use visual block mode:
   - `Ctrl+v` to enter visual block
   - Select lines, then `I` to insert or `c` to change

6. **Marks** - Set marks with `m<letter>`, jump with `'<letter>`

7. **Macros** - Record with `q<letter>`, stop with `q`, play with `@<letter>`

8. **Folding**:
   - `zc` - Close fold
   - `zo` - Open fold
   - `za` - Toggle fold
   - `zR` - Open all folds
   - `zM` - Close all folds

---

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

## Credits

- [NvChad](https://github.com/NvChad/NvChad)
- [LazyVim](https://github.com/LazyVim/starter)
