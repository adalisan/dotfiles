# Install PIP globals
function pip_install_globals() {
  for global in "${globals[@]}"; do
    sudo pip install $global
  done
}

# Start the actual installation of the recipes
globals=(
  pandas
  networkx
)

# Start the actual installation of the recipes
pip_install_globals
