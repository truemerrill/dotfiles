#!/bin/sh

source "$DOTFILES_LIB"
mkdir -p "$HOME/.config/"

if ! command -v tree-sitter &> /dev/null; then
  cargo install tree-sitter-cli
fi


if [ ! -L "$HOME/.config/nvim" ]; then
  ln -sf "$DOTFILES/nvim" "$HOME/.config/nvim"
fi

