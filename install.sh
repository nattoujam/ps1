#!/bin/sh
set -e

REPO="nattoujam/ps1"
BIN_DIR="/usr/local/bin"
if [ -n "$SUDO_USER" ]; then
  USER_HOME=$(eval echo "~$SUDO_USER")
else
  USER_HOME="$HOME"
fi
CONFIG_DIR="$USER_HOME/.config/nattoujam/ps1"

# ps1 スクリプトをダウンロード
RAW="https://raw.githubusercontent.com/$REPO/release"
mkdir -p "$BIN_DIR"
curl -fsSL "$RAW/ps1" -o "$BIN_DIR/ps1"
chmod 0755 "$BIN_DIR/ps1"

# assets をダウンロード
mkdir -p "$CONFIG_DIR"
for f in presets helpers; do
  curl -fsSL "$RAW/assets/$f" -o "$CONFIG_DIR/$f"
  echo "installed: $CONFIG_DIR/$f"
done

if [ -n "$SUDO_USER" ]; then
  chown -R "$SUDO_USER" "$CONFIG_DIR"
fi

echo ""
echo "Add this line to your .zshrc or .bashrc:"
echo "  [ -f ~/.config/nattoujam/ps1/current ] && source ~/.config/nattoujam/ps1/current"
