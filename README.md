# Dotfiles

Personal shell and macOS setup for a new machine.

## Contents

- **`.zshrc`** — Zsh configuration (Oh My Zsh, theme, plugins, aliases, and tooling hooks).
- **`install.sh`** — Bootstrap script: installs [Homebrew](https://brew.sh), CLI tools and GUI apps, runtimes (e.g. Bun), configures Git and SSH, appends PATH/tool snippets to `~/.zshrc`, sets Zsh as the login shell, and applies a few macOS defaults.

## Usage

Clone this repo, review `install.sh` (it is opinionated and includes interactive steps such as `railway login`), then run:

```bash
chmod +x install.sh
./install.sh
```

To use only the shell config without the full installer, copy or symlink `.zshrc` to your home directory and adjust paths or dependencies to match your system.

## Requirements

- macOS (the installer assumes Homebrew and Apple-style paths).
- Oh My Zsh is referenced in `.zshrc`; install it separately if you use this file on a machine that does not have it yet.
