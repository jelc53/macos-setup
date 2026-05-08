#!/usr/bin/env bash
# macOS system defaults. Disabled by default in bootstrap.sh —
# uncomment lines you want and enable the call from bootstrap.sh.
set -euo pipefail

# Show hidden files in Finder
# defaults write com.apple.finder AppleShowAllFiles -bool true

# Show file extensions
# defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Faster key repeat
# defaults write NSGlobalDomain KeyRepeat -int 2
# defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Disable press-and-hold for accent menu (enables key repeat in editors)
# defaults write -g ApplePressAndHoldEnabled -bool false

# Dock: autohide, no recents
# defaults write com.apple.dock autohide -bool true
# defaults write com.apple.dock show-recents -bool false

# Screenshots to ~/Pictures/Screenshots
# mkdir -p "$HOME/Pictures/Screenshots"
# defaults write com.apple.screencapture location "$HOME/Pictures/Screenshots"

# Apply
# killall Finder Dock SystemUIServer 2>/dev/null || true
echo "macos-defaults.sh: nothing enabled. Edit the script and uncomment lines."
