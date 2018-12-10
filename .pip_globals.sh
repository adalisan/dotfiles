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
  lolviz
)

# Start the actual installation of the recipes
pip_install_globals
