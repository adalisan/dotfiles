# Install PIP globals
function pip_install_globals() {
  for global in "${globals[@]}"; do
    sudo pip install $global
  done
}

globals=(
pandas
networkx
)

# Start the actual installation of the recipes
pip_install_globals
