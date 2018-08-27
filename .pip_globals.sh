# Install PIP globals
function pip_install_globals() {
  for global in "${globals[@]}"; do
    if [[ -z "$NOTSUDOER" ]]; then
    sudo pip install $global
    else
    pip install --user $global
    fi
  done
}

# Start the actual installation of the recipes
globals=(
  pandas
  networkx
  lolviz
)

# Start the actual installation of the recipes
pip_install_globals
