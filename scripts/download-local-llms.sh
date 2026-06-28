#!/usr/bin/env bash
# optional, downloads local LLM weights (~18 GB) for offline use
# skips models already present in ~/models
set -euo pipefail

MODELS_DIR="$HOME/models"

# hf is the downloader; uv comes from the Brewfile.
if ! command -v hf >/dev/null 2>&1; then
  echo "Installing huggingface_hub CLI..."
  uv tool install huggingface_hub
fi

mkdir -p "$MODELS_DIR"

echo "Downloading coder (~17.7 GB)..."
hf download unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF \
  --include "*UD-Q4_K_XL*" --local-dir "$MODELS_DIR/qwen3-coder-30b"

echo "Downloading embeddings (~0.26 GB)..."
hf download nomic-ai/nomic-embed-text-v1.5-GGUF \
  --include "nomic-embed-text-v1.5.f16.gguf" --local-dir "$MODELS_DIR/nomic-embed"

echo "Done. Start the servers with: llm-local on"
