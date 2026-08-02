#!/bin/sh
set -e

REPO="nattoujam/ps1"
BIN_DIR="$HOME/.local/bin"
CONFIG_DIR="$HOME/.config/nattoujam/ps1"

# ps1 スクリプトをダウンロード
RAW="https://raw.githubusercontent.com/$REPO/release"
mkdir -p "$BIN_DIR"
curl -fsSL "$RAW/ps1" -o "$BIN_DIR/ps1"
chmod 0755 "$BIN_DIR/ps1"
echo "installed: $BIN_DIR/ps1"

# assets をダウンロード
mkdir -p "$CONFIG_DIR"
for f in presets helpers; do
  curl -fsSL "$RAW/assets/$f" -o "$CONFIG_DIR/$f"
  echo "installed: $CONFIG_DIR/$f"
done

echo ""
echo "Add this line to your .zshrc or .bashrc:"
echo "  [ -f ~/.config/nattoujam/ps1/current ] && source ~/.config/nattoujam/ps1/current"

# BIN_DIR が PATH になければ案内する
case ":$PATH:" in
  *":$BIN_DIR:"*) ;;
  *)
    echo ""
    echo "$BIN_DIR is not in your PATH. Add this line too:"
    echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
    ;;
esac
