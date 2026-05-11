#!/usr/bin/env bash
# Symlinks every file under ./home/ into $HOME, preserving structure.
# Existing real files are backed up with a timestamp suffix.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC_DIR="$REPO_DIR/home"

if [ ! -d "$SRC_DIR" ]; then
  echo "No home/ directory in repo — nothing to link."
  exit 0
fi

stamp="$(date +%Y%m%d-%H%M%S)"

find "$SRC_DIR" -type f | while read -r src; do
  rel="${src#$SRC_DIR/}"
  dst="$HOME/$rel"
  mkdir -p "$(dirname "$dst")"

  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    echo "  ok     $rel"
    continue
  fi

  if [ -e "$dst" ] || [ -L "$dst" ]; then
    backup="$dst.backup-$stamp"
    mv "$dst" "$backup"
    echo "  back   $rel  ->  $(basename "$backup")"
  fi

  ln -s "$src" "$dst"
  echo "  link   $rel"
done
