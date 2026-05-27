#!/usr/bin/env bash
set -euo pipefail

SKIN_FILE="$HOME/.hermes/skins/matrix.yaml"

# ── Check skin is installed ──────────────────────────────────────────
if [ ! -f "$SKIN_FILE" ]; then
  echo "✖ HERMATRIX skin not found at: $SKIN_FILE"
  echo "  Install it first:"
  echo "  curl -fsSL https://raw.githubusercontent.com/lipebez/hermes-matrix-skin/main/install.sh | bash"
  exit 1
fi

# ── Get the name ─────────────────────────────────────────────────────
if [ -n "${1:-}" ]; then
  NAME="$1"
else
  echo ""
  echo "  ┌──────────────────────────────────────┐"
  echo "  │   HERMATRIX — Personalize Operator   │"
  echo "  └──────────────────────────────────────┘"
  echo ""
  read -rp "  Enter your name (or nickname): " NAME
fi

if [ -z "$NAME" ]; then
  echo "✖ Name cannot be empty."
  exit 1
fi

# ── Back up before editing ───────────────────────────────────────────
BACKUP="$SKIN_FILE.backup.$(date +%Y%m%d-%H%M%S)"
cp "$SKIN_FILE" "$BACKUP"

# ── Apply replacements ──────────────────────────────────────────────
# Case-sensitive: "Operator" in prose, "OPERATOR" in labels
sed -i "s/Wake up, Operator\.\.\./Wake up, ${NAME}.../g" "$SKIN_FILE"
sed -i "s/⣿ OPERATOR /⣿ ${NAME^^} /g" "$SKIN_FILE"

# ── Verify ───────────────────────────────────────────────────────────
if grep -q "$NAME" "$SKIN_FILE"; then
  echo ""
  echo "  ✔ Operator replaced with: $NAME"
  echo "  ✔ Backup saved to: $BACKUP"
  echo ""
  echo "  Restart Hermes or run: /skin matrix"
  echo ""
else
  echo "⚠ Could not verify replacement. Check $SKIN_FILE manually."
  exit 1
fi
