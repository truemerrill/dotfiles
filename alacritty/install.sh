#!/bin/sh

source "$DOTFILES_LIB"
mkdir -p "$HOME/.config/alacritty"

link_file "$DOTFILES_ROOT/alacritty/alacritty.toml" \
  "$HOME/.config/alacritty/alacritty.toml"
link_file "$DOTFILES_ROOT/alacritty/themes" \
  "$HOME/.config/alacritty/themes"

