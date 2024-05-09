# Get the path to the conda environment bin directory 
get_conda_env_path() {
  local env=$1
  local path=$(
    micromamba env list |
    grep -E "$env" |
    sed 's/.* \([^ ]*\)$/\1/'
  )
  if [ -n "$path" ]; then
    echo "$path/bin"
  else
    echo ""
  fi
}

python_path=$(get_conda_env_path python-3.12)
julia_path=$(get_conda_env_path julia)

if [ -n "$python_path" ]; then
  export PATH="$PATH:$python_path"
fi

if [ -n "$julia_path" ]; then
  export PATH="$PATH:$julia_path"
fi

