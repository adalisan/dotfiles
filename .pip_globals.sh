# Install PIP globals
function pip_install_globals() {
  for global in "${globals[@]}"; do
    sudo pip install $global
  done
}

# Start the actual installation of the recipes
globals=(
<<<<<<< HEAD
  pandas
  networkx
=======
pandas
networkx
>>>>>>> 63a1fc4... try to fix prompt. add-remove pip installs
)

# Start the actual installation of the recipes
pip_install_globals
