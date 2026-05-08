#!/usr/bin/env bash
# Installs language toolchains. Assumes brew has installed pyenv and fnm.
set -euo pipefail

# Rust (via official rustup installer — brew's rustup-init is sometimes stale)
if ! command -v rustup >/dev/null 2>&1; then
  echo "Installing rustup..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
    | sh -s -- -y --no-modify-path
fi

# Node (LTS via fnm)
if command -v fnm >/dev/null 2>&1; then
  echo "Installing Node LTS..."
  fnm install --lts
  fnm default lts-latest || true
fi

# Python (latest stable 3.x via pyenv)
if command -v pyenv >/dev/null 2>&1; then
  latest="$(pyenv install --list | grep -E '^\s+3\.[0-9]+\.[0-9]+$' | tail -1 | tr -d ' ')"
  echo "Installing Python $latest..."
  pyenv install -s "$latest"
  pyenv global "$latest"
fi
