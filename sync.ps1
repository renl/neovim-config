# Sync script for updating existing Neovim config (PowerShell)
# Usage: .\sync.ps1 or irm https://raw.githubusercontent.com/renl/neovim-config/main/sync.ps1 | iex

$ErrorActionPreference = "Stop"

$NvimConfigDir = "$env:LOCALAPPDATA\nvim"
$NvimDataDir = "$env:LOCALAPPDATA\nvim-data"

Write-Host "=== Neovim Config Sync ===" -ForegroundColor Cyan

# Check if config exists
if (-not (Test-Path $NvimConfigDir)) {
    Write-Host "Error: Neovim config directory not found at $NvimConfigDir" -ForegroundColor Red
    Write-Host "Run setup.ps1 first to install the config."
    exit 1
}

# Check if it's a git repo
if (-not (Test-Path "$NvimConfigDir\.git")) {
    Write-Host "Error: $NvimConfigDir is not a git repository" -ForegroundColor Red
    Write-Host "This script only works with configs installed via git clone."
    exit 1
}

Write-Host "Pulling latest changes from repository..." -ForegroundColor Green
Push-Location $NvimConfigDir
git pull
Pop-Location

Write-Host ""
Write-Host "Removing cached plugins to force resync..." -ForegroundColor Yellow
Remove-Item -Path "$NvimDataDir\lazy\NvChad" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$NvimDataDir\lazy\nvim-treesitter" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host ""
Write-Host "Syncing plugins to match lazy-lock.json..." -ForegroundColor Green
try {
    nvim --headless "+Lazy! restore" +qa 2>$null
    Write-Host "Plugins synced successfully!" -ForegroundColor Green
} catch {
    Write-Host "Note: Plugin sync will complete on next nvim launch" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "=== Sync Complete ===" -ForegroundColor Cyan
Write-Host "Your Neovim config is now up to date!" -ForegroundColor Green
Write-Host ""
