#!/bin/bash
# Sync script for updating existing Neovim config
# Usage: ./sync.sh or curl -fsSL https://raw.githubusercontent.com/renl/neovim-config/main/sync.sh | bash

set -e

NVIM_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
NVIM_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/nvim"

echo "=== Neovim Config Sync ==="

# Check if config exists
if [ ! -d "$NVIM_CONFIG_DIR" ]; then
    echo "Error: Neovim config directory not found at $NVIM_CONFIG_DIR"
    echo "Run setup.sh first to install the config."
    exit 1
fi

# Check if it's a git repo
if [ ! -d "$NVIM_CONFIG_DIR/.git" ]; then
    echo "Error: $NVIM_CONFIG_DIR is not a git repository"
    echo "This script only works with configs installed via git clone."
    exit 1
fi

echo "Pulling latest changes from repository..."
cd "$NVIM_CONFIG_DIR"
git pull

echo ""
echo "Removing cached plugins to force resync..."
rm -rf "$NVIM_DATA_DIR/lazy/NvChad" "$NVIM_DATA_DIR/lazy/nvim-treesitter"

echo ""
echo "Syncing plugins to match lazy-lock.json..."
if nvim --headless "+Lazy! restore" +qa 2>/dev/null; then
    echo "Plugins synced successfully!"
else
    echo "Note: Plugin sync will complete on next nvim launch"
fi

echo ""
echo "=== Sync Complete ==="
echo "Your Neovim config is now up to date!"
echo ""
