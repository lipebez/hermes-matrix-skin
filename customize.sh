#!/usr/bin/env bash
set -euo pipefail

resolve_hermes_home() {
  if [ -n "${HERMES_HOME:-}" ]; then
    printf '%s\n' "$HERMES_HOME"
    return
  fi

  case "$(uname -s 2>/dev/null || printf unknown)" in
    MINGW*|MSYS*|CYGWIN*)
      if [ -n "${LOCALAPPDATA:-}" ]; then
        if command -v cygpath >/dev/null 2>&1; then
          printf '%s\n' "$(cygpath -u "$LOCALAPPDATA")/hermes"
        else
          printf '%s\n' "$LOCALAPPDATA/hermes"
        fi
        return
      fi
      ;;
  esac

  printf '%s\n' "$HOME/.hermes"
}

SKIN_FILE="$(resolve_hermes_home)/skins/matrix.yaml"

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
upper_name="$(printf '%s' "$NAME" | tr '[:lower:]' '[:upper:]')"
escaped_name="$(printf '%s' "$NAME" | sed 's/[\\/&]/\\&/g')"
escaped_upper="$(printf '%s' "$upper_name" | sed 's/[\\/&]/\\&/g')"

sed -i "s/Wake up, Operator\.\.\./Wake up, ${escaped_name}.../g" "$SKIN_FILE"
sed -i "s/⣿ OPERATOR /⣿ ${escaped_upper} /g" "$SKIN_FILE"

# ── Verify ───────────────────────────────────────────────────────────
if grep -Fq "$NAME" "$SKIN_FILE"; then
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
