#!/usr/bin/env bash
# Bootstraps a fresh macOS install for development.
# Idempotent — safe to re-run.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO_DIR"

log() { printf "\n\033[1;34m==>\033[0m %s\n" "$*"; }

# 1. Xcode Command Line Tools
if ! xcode-select -p >/dev/null 2>&1; then
  log "Installing Xcode Command Line Tools (a GUI prompt will appear)"
  xcode-select --install
  echo "Re-run this script once installation finishes."
  exit 0
fi

# 2. Homebrew
if ! command -v brew >/dev/null 2>&1; then
  log "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# 3. Brewfile (formulas + casks)
log "Installing packages from Brewfile"
brew bundle --file="$REPO_DIR/Brewfile"

# 4. Dotfiles
log "Symlinking dotfiles"
"$REPO_DIR/scripts/link-dotfiles.sh"

# 5. Language toolchains (rust, node LTS, latest python)
log "Installing language toolchains"
"$REPO_DIR/scripts/install-languages.sh"

# 6. macOS defaults (optional, edit before running)
# log "Applying macOS defaults"
# "$REPO_DIR/scripts/macos-defaults.sh"

log "Bootstrap complete. See README §Post-install for manual steps."
