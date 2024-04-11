#!/bin/sh

source "$DOTFILES_LIB"
mkdir -p "$HOME/.config/"

if [ ! -L "$HOME/.config/alacritty" ]; then
  ln -sf "$DOTFILES/alacritty" "$HOME/.config/alacritty"
fi

