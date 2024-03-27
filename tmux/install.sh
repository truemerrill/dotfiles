#!/bin/sh

source "$DOTFILES_LIB"
mkdir -p "$HOME/.config/"

if [ ! -L "$HOME/.config/tmux" ]; then
  ln -sf "$DOTFILES/tmux" "$HOME/.config/tmux"
fi

