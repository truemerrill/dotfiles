#!/bin/sh

source "$DOTFILES_LIB"
mkdir -p "$HOME/.micromamba"

# Default python environment
PYTHON_ENV="python"
PYTHON_VERSION="3.12"
PYTHON_PACKAGES="
numpy
scipy
ipython
jupyter
pandas
seaborn
"


# --- Conda -------------------------------------------------------------------

# Check if the conda environment is installed
has_conda_env() {
	local env=$1
	local conda_envs=$(
		micromamba env list |
			tail -n +3 |
			awk '{print $1}'
	)

	while IFS= read -r conda_env; do
		if [[ $conda_env == *"$env" ]]; then
			return 0 # Environment found, return success
		fi
	done <<<"$conda_envs"

	return 1
}

# Setup an installation managed by conda
#
# Args:
#   env (str): The name of the conda environment
#   setup (function): A function which initializes the environment from scratch
#       and installs related packages.
#
conda_env() {
	local env=$1
	local setup=$2

	if ! has_conda_env "$env"; then
		$setup
	fi
}


# --- Environments ------------------------------------------------------------

_setup_python() {
	micromamba env create -n $PYTHON_ENV
	micromamba install -n $PYTHON_ENV -c defaults -y \
		"python=$PYTHON_VERSION"

	while read -r package; do
		micromamba install -n $PYTHON_ENV -c defaults -y "$package"
	done <<< "$PYTHON_PACKAGES"
}

conda_env $PYTHON_ENV _setup_python

