# Install Homebrew.
if [[ ! "$(type -P brew)" ]]; then
  echo "Installing Homebrew"
  true | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Updating Homebrew"
brew doctor
brew update

# Install Homebrew recipes.
function brew_install_recipes() {
  recipes=setdiff "${recipes[*]}" "$(brew list)"
  if (( ${#recipes[@]} > 0 )); then
    echo "Installing Homebrew recipes: ${recipes[*]}"
    for recipe in "${recipes[@]}"; do
      brew install $recipe
    done
  fi
}

# Homebrew recipes
recipes=(
	# Core Modules
	coreutils
	moreutils
	findutils
	binutils
	# Bash, Bash plugins
  bash
  bash-completion
  zsh
  grc
  # Development
  git
  mongodb
  # Git speific addons
  git-extras
  hub
  bfg
  # Utilities
  htop-osx
  id3tool
  lesspipe
  ssh-copy-id
  the_silver_searcher
  tree
  fcrackzip
  foremost
  ack
  p7zip
  pigz
  pv
  tmux
  sshrc
	# Network tools
	rename
	npm
	micro
	z
	fzf
	bench
	ripgrep
	ncdu
	tig
	thefuck
)

# Start the actual installation of the recipes
brew_install_recipes

# install recipes with special arguments
brew install gnu-sed --default-names
brew install wget --enable-iri
# Remove outdated versions from the cellar
brew cleanup
