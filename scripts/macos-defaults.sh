#!/usr/bin/env bash
# macOS system defaults.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# ============================================================
# Desktop wallpaper
# ============================================================
# Options in assets/wallpapers/:
#   sf-hike-to-stinson-beach.JPG  (default)
#   sf-bay-from-mount-tam.JPG
#   ninsei-jarre-de-the.JPG
WALLPAPER="$REPO_DIR/assets/wallpapers/sf-hike-to-stinson-beach.JPG"
osascript -e "tell application \"System Events\" to set picture of every desktop to \"$WALLPAPER\""

# ============================================================
# Other defaults — uncomment as desired
# ============================================================

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

# Apply changes that need a restart of UI processes
# killall Finder Dock SystemUIServer 2>/dev/null || true
