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
brew "marksman"           # general purpose markdown language server
brew "markdown-oxide"     # optimised for obsidian vaults
brew "dprint"

# Version control
brew "git"
brew "gh"
brew "withgraphite/tap/graphite"

# Utilities
brew "jq"

# Language toolchains
brew "pyenv"              # python versions
brew "poetry"             # python dependency management
brew "uv"                 # python package/project manager
brew "fnm"                # node versions
# rust/cargo: installed by scripts/install-languages.sh via rustup

# AWS / cloud
brew "awscli"
brew "aws-vault"

# Remote access
brew "tailscale"

# AI / local LLMs
brew "llama.cpp"
tap "anomalyco/tap"
brew "anomalyco/tap/opencode"  # terminal ui

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
cask "1password" # required for totp

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
