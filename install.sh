#!/usr/bin/env bash
set -euo pipefail

REPO="https://raw.githubusercontent.com/lipebez/hermes-matrix-skin/main"
TARGET_DIR="$HOME/.hermes/skins"
TARGET_FILE="$TARGET_DIR/matrix.yaml"

mkdir -p "$TARGET_DIR"

if [ -f "$TARGET_FILE" ]; then
  BACKUP="$TARGET_FILE.backup.$(date +%Y%m%d-%H%M%S)"
  cp "$TARGET_FILE" "$BACKUP"
  echo "Existing matrix skin backed up to: $BACKUP"
fi

curl -fsSL "$REPO/skins/matrix.yaml" -o "$TARGET_FILE"

echo "HERMATRIX installed at: $TARGET_FILE"
echo "Open Hermes and run: /skin matrix"
