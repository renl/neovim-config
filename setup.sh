#!/bin/bash
# Neovim Config Setup Script for Linux/macOS
# Usage: curl -fsSL https://raw.githubusercontent.com/renl/neovim-config/main/setup.sh | bash
# Or: ./setup.sh

set -e

REPO_URL="https://github.com/renl/neovim-config.git"
NVIM_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"

echo "=== Neovim Config Setup ==="

# Check if nvim is installed
if ! command -v nvim &> /dev/null; then
    echo "Error: Neovim is not installed. Please install Neovim 0.10+ first."
    echo "  Ubuntu/Debian: sudo apt install neovim"
    echo "  macOS: brew install neovim"
    echo "  Arch: sudo pacman -S neovim"
    exit 1
fi

# Check nvim version
NVIM_VERSION=$(nvim --version | head -1 | grep -oP 'v\K[0-9]+\.[0-9]+' || echo "0.0")
MAJOR=$(echo "$NVIM_VERSION" | cut -d. -f1)
MINOR=$(echo "$NVIM_VERSION" | cut -d. -f2)

if [ "$MAJOR" -lt 1 ] && [ "$MINOR" -lt 10 ]; then
    echo "Warning: Neovim version $NVIM_VERSION detected. Version 0.10+ is recommended."
fi

# Backup existing config if present
if [ -d "$NVIM_CONFIG_DIR" ]; then
    BACKUP_DIR="${NVIM_CONFIG_DIR}.backup.$(date +%Y%m%d_%H%M%S)"
    echo "Backing up existing config to: $BACKUP_DIR"
    mv "$NVIM_CONFIG_DIR" "$BACKUP_DIR"
fi

# Clone the repository
echo "Cloning config to: $NVIM_CONFIG_DIR"
git clone "$REPO_URL" "$NVIM_CONFIG_DIR"

# Remove setup scripts from the config directory (not needed there)
rm -f "$NVIM_CONFIG_DIR/setup.sh" "$NVIM_CONFIG_DIR/setup.ps1"

echo ""
echo "=== Setup Complete ==="
echo ""
echo "Next steps:"
echo "1. Run 'nvim' - plugins will be installed automatically on first launch"
echo "2. Run ':MasonInstall html-lsp css-lsp stylua' to install LSP servers"
echo ""
echo "Optional dependencies for best experience:"
echo "  - ripgrep: for telescope live grep"
echo "  - fd: for telescope file finder"
echo "  - A Nerd Font: for icons (https://www.nerdfonts.com/)"
echo ""
