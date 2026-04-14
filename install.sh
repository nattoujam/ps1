#!/bin/sh
set -e

OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)
REPO="nattoujam/ps1"
BIN_DIR="$HOME/.local/bin"
CONFIG_DIR="$HOME/.config/nattoujam/ps1"

# バイナリをダウンロード
mkdir -p "$BIN_DIR"
curl -fsSL "https://github.com/$REPO/releases/latest/download/ps1-$OS-$ARCH" -o "$BIN_DIR/ps1"
chmod +x "$BIN_DIR/ps1"

# assets をダウンロード
mkdir -p "$CONFIG_DIR"
for f in presets.ini helpers; do
  curl -fsSL "https://github.com/$REPO/releases/latest/download/$f" -o "$CONFIG_DIR/$f"
  echo "installed: $CONFIG_DIR/$f"
done

echo ""
echo "Add this line to your .zshrc or .bashrc:"
echo "  [ -f ~/.config/nattoujam/ps1/current ] && source ~/.config/nattoujam/ps1/current"
