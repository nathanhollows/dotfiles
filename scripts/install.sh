#!/bin/bash
set -e

# --- Detect package manager ---
if command -v dnf &>/dev/null; then
  PKG_MGR="dnf"
  INSTALL_CMD="sudo dnf install -y"
elif command -v apt &>/dev/null; then
  PKG_MGR="apt"
  INSTALL_CMD="sudo apt install -y"
else
  echo "Unsupported package manager (need dnf or apt)"
  exit 1
fi

echo "Detected package manager: $PKG_MGR"

# --- apt: update first ---
if [ "$PKG_MGR" = "apt" ]; then
  sudo apt update
fi

# --- base packages ---
$INSTALL_CMD zsh tmux neovim kitty

# --- starship prompt ---
curl -sS https://starship.rs/install.sh | sh

# --- tpm (tmux plugin manager) ---
TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

# --- tmux plugins ---
"$TPM_DIR/bin/install_plugins"
