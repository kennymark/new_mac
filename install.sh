#!/bin/bash

# Install Homebrew if it's not already installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Install zsh, Visual Studio Code, cursor, fzf, and postgresql18 using Homebrew
echo "Installing additional packages with Homebrew..."
brew install zsh bat zoxide fzf postgresql@18 gh jq rg exa fd

echo "Installing Visual Studio Code..."
brew install --cask visual-studio-code

echo "Installing cursor..."
brew install --cask cursor

echo "Installing iTerm2..."
brew install --cask iterm2


echo "Configuring ssh"
ssh-keygen -t ed25519 -C "$(whoami)@$(hostname)" -f ~/.ssh/id_ed25519
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

echo "Generating shell configuration files..."
echo "export PATH=\$PATH:/usr/local/bin" >> ~/.zshrc
echo "export PATH=\$PATH:/usr/local/opt/postgresql@18/bin" >> ~/.zshrc
echo "eval \"\$(zoxide init zsh)\"" >> ~/.zshrc
echo "eval \"\$(fzf --completion=zsh)\"" >> ~/.zshrc

# Optionally, set the default shell to ZSH if not already set
if [[ "$SHELL" != "/bin/zsh" ]]; then
    echo "Setting default shell to ZSH..."
    chsh -s /bin/zsh
fi

echo "Installation complete."
