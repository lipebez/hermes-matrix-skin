#!/usr/bin/env bash
set -euo pipefail

REPO="https://raw.githubusercontent.com/lipebez/hermes-matrix-skin/main"
SKIN_NAME="matrix"

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

HERMES_HOME_DIR="$(resolve_hermes_home)"
TARGET_DIR="$HERMES_HOME_DIR/skins"
TARGET_FILE="$TARGET_DIR/$SKIN_NAME.yaml"

mkdir -p "$TARGET_DIR"

if [ -f "$TARGET_FILE" ]; then
  BACKUP="$TARGET_FILE.backup.$(date +%Y%m%d-%H%M%S)"
  cp "$TARGET_FILE" "$BACKUP"
  echo "Existing matrix skin backed up to: $BACKUP"
fi

tmp_file="$(mktemp)"
cleanup() {
  rm -f "$tmp_file"
}
trap cleanup EXIT

curl -fsSL "$REPO/skins/$SKIN_NAME.yaml" -o "$tmp_file"

if [ ! -s "$tmp_file" ]; then
  echo "✖ Downloaded skin is empty. Aborting." >&2
  exit 1
fi

mv "$tmp_file" "$TARGET_FILE"

echo "HERMATRIX installed at: $TARGET_FILE"
echo "Open Hermes and run: /skin matrix"
