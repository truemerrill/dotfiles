# Get the path to the conda environment bin directory 
get_conda_env_path() {
  local env=$1
  local path=$(
    micromamba env list |
    grep -E "$env" |
    sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'
  )
  echo "$path/bin"
}

export PATH="$PATH:$(get_conda_env_path python)"
export PATH="$PATH:$(get_conda_env_path julia)"

