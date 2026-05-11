#!/usr/bin/env bash
# Removes orphaned symlinks under $HOME: links pointing into this repo's
# home/ tree whose source file no longer exists. Run this after deleting
# a tracked dotfile to sweep up the dangling link it left behind.
#
# Three guards before any removal:
#   1. Target must be a symlink (-type l)
#   2. Its readlink target must point into $SRC_DIR
#   3. The target file must not exist on disk
# Manually-created symlinks and links pointing outside the repo are never
# touched.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC_DIR="$REPO_DIR/home"

if [ ! -d "$SRC_DIR" ]; then
  echo "No home/ directory in repo — nothing to prune."
  exit 0
fi

# Bound the search to top-level dirs the repo actually manages, so we
# don't traverse $HOME's caches and node_modules trees.
roots=()
while IFS= read -r entry; do
  candidate="$HOME/$(basename "$entry")"
  [ -d "$candidate" ] && roots+=("$candidate")
done < <(find "$SRC_DIR" -mindepth 1 -maxdepth 1)

if [ ${#roots[@]} -eq 0 ]; then
  echo "No managed directories found under \$HOME — nothing to prune."
  exit 0
fi

find "${roots[@]}" -type l 2>/dev/null | while read -r link; do
  target="$(readlink "$link")"
  case "$target" in
    "$SRC_DIR"/*) ;;
    *) continue ;;
  esac
  if [ ! -e "$target" ]; then
    rm "$link"
    echo "  prune  ${link#$HOME/}"
  fi
done
