#!/bin/sh

source "$DOTFILES_LIB"
mkdir -p "$HOME/.micromamba"


has_conda_env () {
  local env=$1
  local conda_envs=$(micromamba env list --json | jq '.envs[]')
 
  while IFS= read -r conda_env; do
    if [[ $conda_env == *"$env" ]]; then
      echo "Environment $env found: $conda_env"
      return 0  # Environment found, return success
    fi
  done <<< "$conda_envs"

  return 0
}

