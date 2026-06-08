#!/bin/bash
set -e

# --- starship prompt ---
curl -sS https://starship.rs/install.sh | sh

# --- tpm (tmux plugin manager) ---
TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

# --- tmux plugins ---
"$TPM_DIR/bin/install_plugins"
