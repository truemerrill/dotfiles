#!/bin/sh
#
# Install ohmyzsh while still loading DOTFILES

source "$DOTFILES_LIB"

OH_MY_ZSH="$HOME/.oh-my-zsh"
OH_MY_ZSH_URL="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"

if [ ! -d $OH_MY_ZSH ]; then
  sh -c "$(curl -fsSL $OH_MY_ZSH_URL)"
fi

# Update zshrc.symlink to set the DOTFILES variable to the value provided
# during installation.  After install, this allows us to always reference
# the DOTFILES folder.

if [ ! -f "$DOTFILES/zsh/zshrc.symlink" ]; then

  ESCAPED_DOTFILES=$(printf '%s\n' "$DOTFILES" | sed 's/[\/&]/\\&/g')
  SUBSTITUTE="s/export DOTFILES=\"\"/export DOTFILES=\"$ESCAPED_DOTFILES\"/"

  cp "$DOTFILES/zsh/zshrc" "$DOTFILES/zsh/zshrc.symlink"
  sed -i '' "$SUBSTITUTE" "$DOTFILES/zsh/zshrc.symlink"
fi

