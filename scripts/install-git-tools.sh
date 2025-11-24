#!/usr/bin/env bash
set -e

INSTALL_DIR="$HOME/.local/bin"
mkdir -p "$INSTALL_DIR"

echo "⬇️  Installing git-delta..."
DELTA_VERSION="0.16.5"
curl -L "https://github.com/dandavison/delta/releases/download/${DELTA_VERSION}/delta-${DELTA_VERSION}-x86_64-unknown-linux-musl.tar.gz" -o delta.tar.gz
tar xzOf delta.tar.gz "delta-${DELTA_VERSION}-x86_64-unknown-linux-musl/delta" > "$INSTALL_DIR/delta"
chmod +x "$INSTALL_DIR/delta"
rm delta.tar.gz
echo "✅ Delta installed to $INSTALL_DIR/delta"

echo "⬇️  Installing lazygit..."
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xzOf lazygit.tar.gz lazygit > "$INSTALL_DIR/lazygit"
chmod +x "$INSTALL_DIR/lazygit"
rm lazygit.tar.gz
echo "✅ Lazygit installed to $INSTALL_DIR/lazygit"
