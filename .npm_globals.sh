# Install NPM globals
function npm_install_globals() {
  for global in "${globals[@]}"; do
    sudo npm install -g $global
  done
}

globals=(
  caniuse
  caniuse-cmd
  cli
  imageoptim
  imageoptim-cli
  bash-language-server
  prettyjson
)

# Start the actual installation of the recipes
npm_install_globals
