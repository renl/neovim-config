# Neovim Config Setup Script for Windows (PowerShell)
# Usage: irm https://raw.githubusercontent.com/renl/neovim-config/main/setup.ps1 | iex
# Or: .\setup.ps1

$ErrorActionPreference = "Stop"

$RepoUrl = "https://github.com/renl/neovim-config.git"
$NvimConfigDir = "$env:LOCALAPPDATA\nvim"

Write-Host "=== Neovim Config Setup ===" -ForegroundColor Cyan

# Check if nvim is installed
try {
    $nvimVersion = nvim --version | Select-Object -First 1
    Write-Host "Found: $nvimVersion" -ForegroundColor Green
} catch {
    Write-Host "Error: Neovim is not installed. Please install Neovim 0.10+ first." -ForegroundColor Red
    Write-Host "  winget: winget install Neovim.Neovim"
    Write-Host "  scoop: scoop install neovim"
    Write-Host "  choco: choco install neovim"
    exit 1
}

# Check if git is installed
try {
    git --version | Out-Null
} catch {
    Write-Host "Error: Git is not installed. Please install Git first." -ForegroundColor Red
    Write-Host "  winget: winget install Git.Git"
    exit 1
}

# Backup existing config if present
if (Test-Path $NvimConfigDir) {
    $backupDir = "$NvimConfigDir.backup.$(Get-Date -Format 'yyyyMMdd_HHmmss')"
    Write-Host "Backing up existing config to: $backupDir" -ForegroundColor Yellow
    Move-Item -Path $NvimConfigDir -Destination $backupDir
}

# Clone the repository
Write-Host "Cloning config to: $NvimConfigDir" -ForegroundColor Green
git clone $RepoUrl $NvimConfigDir

# Remove setup scripts from the config directory (not needed there)
Remove-Item -Path "$NvimConfigDir\setup.sh" -ErrorAction SilentlyContinue
Remove-Item -Path "$NvimConfigDir\setup.ps1" -ErrorAction SilentlyContinue

# Sync plugins to match lazy-lock.json
Write-Host ""
Write-Host "Syncing plugins to match lazy-lock.json..." -ForegroundColor Green
try {
    nvim --headless "+Lazy! restore" +qa 2>$null
    Write-Host "Plugins synced successfully!" -ForegroundColor Green
} catch {
    Write-Host "Note: Plugin sync will happen on first nvim launch" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "=== Setup Complete ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Run 'nvim' to verify everything works"
Write-Host "2. Run ':MasonInstall html-lsp css-lsp stylua' to install LSP servers"
Write-Host ""
Write-Host "Optional dependencies for best experience:" -ForegroundColor Yellow
Write-Host "  - ripgrep: winget install BurntSushi.ripgrep"
Write-Host "  - fd: winget install sharkdp.fd"
Write-Host "  - A Nerd Font: https://www.nerdfonts.com/"
Write-Host ""
