# macos-work-setup — Brewfile
# Run with: brew bundle --file=Brewfile

# ============================================================
# CLI tools
# ============================================================

# Shell prompt & plugins
brew "starship"
brew "zsh-autosuggestions"
brew "zsh-syntax-highlighting"
brew "tmux"

# Navigation, search, file management
brew "ripgrep"
brew "fd"
brew "fzf"
brew "zoxide"
brew "yazi"
brew "bat"
brew "lsd"

# Editor & LSPs
brew "helix"
brew "marksman"           # markdown LSP (general)
brew "markdown-oxide"     # markdown LSP (Obsidian vault use only)
brew "dprint"             # formatter (markdown, etc.)

# Version control
brew "git"

# Utilities
brew "jq"

# Language toolchains
brew "pyenv"              # python versions
brew "fnm"                # node versions
# rust/cargo: installed by scripts/install-languages.sh via rustup

# AWS / cloud
brew "awscli"
brew "aws-vault"

# AI / local LLMs
brew "ollama"

# Media tooling (heavyweight; pulled in by yazi previewers etc.)
brew "imagemagick-full", link: true
brew "ffmpeg-full", link: true
brew "poppler"
brew "resvg"
brew "sevenzip"

# ============================================================
# GUI apps (casks)
# ============================================================

# Terminal & launcher
cask "ghostty"
cask "raycast"

# Fonts
cask "font-jetbrains-mono-nerd-font"
cask "font-symbols-only-nerd-font"

# Dev
cask "docker"
cask "visual-studio-code"
cask "claude-code"

# Secrets
cask "1password-cli"
# Note: the 1Password GUI app is required for `op` to unlock vaults,
# which .aws/config depends on for MFA. Install manually or add:
# cask "1password"

# Browser
cask "google-chrome"

# Communication
cask "slack"

# Notes & docs
cask "notion"
cask "obsidian"

# Media & cloud storage
cask "spotify"
cask "google-drive"
