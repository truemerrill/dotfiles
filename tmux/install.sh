#!/bin/sh

source "$DOTFILES_LIB"
mkdir -p "$HOME/.config/"

link_file "$DOTFILES/tmux" \
  "$HOME/.config/tmux"

