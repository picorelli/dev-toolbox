#!/usr/bin/env bash
# Sync dotfiles from this repo to home directory
DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
ln -sf "$DOTFILES_DIR/vim/.vimrc" "$HOME/.vimrc"
ln -sf "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
echo "Dotfiles linked."
