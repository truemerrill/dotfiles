#!/bin/sh

source "$DOTFILES_LIB"
mkdir -p "$HOME/.config/tmux"

link_file "$DOTFILES_ROOT/tmux/tmux.conf" \
  "$HOME/.config/tmux/tmux.conf"

