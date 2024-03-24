#!/bin/sh
#
# Install ohmyzsh

source "$DOTFILES_LIB"

OH_MY_ZSH="$HOME/.oh-my-zsh"
OH_MY_ZSH_URL="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"

if [ ! -d $OH_MY_ZSH ]; then
  sh -c "$(curl -fsSL $OH_MY_ZSH_URL)"
fi


