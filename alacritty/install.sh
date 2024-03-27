#!/bin/sh

source "$DOTFILES_LIB"
mkdir -p "$HOME/.config/"

link_file "$DOTFILES/alacritty" "$HOME/.config/alacritty"

