#!/bin/bash
set -euo pipefail

# 1. Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Ensure brew is on PATH (fresh installs on Apple Silicon use /opt/homebrew)
if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

# 2. Install Homebrew packages
echo "Installing Homebrew packages (zsh, bat, zoxide, fzf, postgresql@18, gh, jq, rg, exa, fd, nano, cloc, git, trash-cli, wget, railway)..."
brew install zsh bat zoxide fzf postgresql@18 gh jq rg exa fd nano cloc git trash-cli wget railway

# 3. Install Homebrew casks
echo "Installing Visual Studio Code (cask)..."
brew install --cask visual-studio-code
echo "Installing Cursor (cask)..."
brew install --cask cursor
echo "Installing iTerm2 (cask)..."
brew install --cask iterm2
echo "Installing Transmission (cask)..."
brew install --cask transmission
echo "Installing IINA (cask)..."
brew install --cask iina

echo "Installing TablePlus (cask)..."
brew install --cask tableplus

echo "Installing Docker (cask)..."
brew install --cask docker

echo "Installing Tailscale (cask)..."
brew install --cask tailscale

echo "Installing Dictionaries"
brew install --cask dictionaries

# 4. Install bun
echo "Installing bun..."
curl -fsSL https://bun.sh/install | bash

# 5. Install Kiro CLI
echo "Installing Kiro CLI..."
curl -fsSL https://cli.kiro.dev/install | bash

# 6. Configure git
echo "Configuring git..."
git config --global user.name "Kenneth Coffie"
git config --global user.email "markcoffiekenneth@gmail.com"

# 7. Configure railway
echo "Configuring railway (login)..."
railway login

# 8. Configure SSH
echo "Configuring SSH (generating key, adding to agent)..."
mkdir -p ~/.ssh
chmod 700 ~/.ssh
if [[ ! -f ~/.ssh/id_ed25519 ]]; then
    ssh-keygen -t ed25519 -C "$(whoami)@$(hostname)" -f ~/.ssh/id_ed25519 -N ""
else
    echo "SSH key ~/.ssh/id_ed25519 already exists; skipping ssh-keygen."
fi
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# 9. Generate shell configuration files
echo "Updating ~/.zshrc with custom paths and completions..."
if ! grep -q "# dotfiles: install.sh PATH and tools" ~/.zshrc 2>/dev/null; then
    cat >> ~/.zshrc <<EOF
# dotfiles: install.sh PATH and tools
export PATH=\$PATH:/usr/local/bin
export PATH=\$PATH:$(brew --prefix postgresql@18)/bin
eval "\$(zoxide init zsh)"
eval "\$(fzf --zsh)"
EOF
fi

# 10. Set default shell to ZSH if not already set
if [[ "$SHELL" != "/bin/zsh" ]]; then
    echo "Setting default shell to ZSH..."
    chsh -s /bin/zsh
else
    echo "Default shell is already ZSH."
fi

# 11. Configure macOS settings
echo "Configuring macOS settings..."
echo "Setting iOS Simulator screenshot location..."
defaults write com.apple.iphonesimulator "ScreenShotSaveLocation" -string "~/Pictures/Simulator Screenshots"
echo "Setting Dock size..."
defaults write com.apple.dock "tilesize" -int "55"
echo "Disabling recent applications in Dock..."
defaults write com.apple.dock "show-recents" -bool "false"
echo "Setting screenshot format to PNG..."
defaults write com.apple.screencapture "type" -string "png"
echo "Disabling shadow in screenshots..."
defaults write com.apple.screencapture "disable-shadow" -bool "true"
echo "Showing hidden files in Finder..."
defaults write com.apple.finder AppleShowAllFiles -bool true
echo "Showing file extensions in Finder..."
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
echo "Showing path bar in Finder..."
defaults write com.apple.finder ShowPathbar -bool true
echo "Showing status bar in Finder..."
defaults write com.apple.finder ShowStatusBar -bool true
echo "Disabling sound effects on boot..."
sudo nvram SystemAudioVolume=" "
echo "Enabling Dock autohide..."
defaults write com.apple.dock autohide -bool true
echo "Setting Dock autohide animation speed..."
defaults write com.apple.dock autohide-time-modifier -float 0.15

echo "Restarting Finder and Dock to apply changes..."
killall Finder || true
killall Dock || true

echo "Installation complete."
