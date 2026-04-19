#!/bin/sh
set -e

OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)
REPO="nattoujam/ps1"
BIN_DIR="/usr/local/bin"
if [ -n "$SUDO_USER" ]; then
  USER_HOME=$(getent passwd "$SUDO_USER" | cut -d: -f6)
else
  USER_HOME="$HOME"
fi
CONFIG_DIR="$USER_HOME/.config/nattoujam/ps1"

# 対応プラットフォームの確認
if [ "$OS" != "linux" ] || [ "$ARCH" != "x86_64" ]; then
  echo "Error: prebuilt binary is only available for linux/x86_64 (got $OS/$ARCH)" >&2
  exit 1
fi

# バイナリをダウンロード
mkdir -p "$BIN_DIR"
curl -fsSL "https://github.com/$REPO/releases/latest/download/ps1-$OS-$ARCH" -o "$BIN_DIR/ps1"
chmod +x "$BIN_DIR/ps1"

# assets をダウンロード
RAW="https://raw.githubusercontent.com/$REPO/release/assets"
mkdir -p "$CONFIG_DIR"
for f in presets helpers; do
  curl -fsSL "$RAW/$f" -o "$CONFIG_DIR/$f"
  echo "installed: $CONFIG_DIR/$f"
done

if [ -n "$SUDO_USER" ]; then
  chown -R "$SUDO_USER" "$CONFIG_DIR"
fi

echo ""
echo "Add this line to your .zshrc or .bashrc:"
echo "  [ -f ~/.config/nattoujam/ps1/current ] && source ~/.config/nattoujam/ps1/current"
