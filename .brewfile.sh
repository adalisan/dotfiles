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
  heroku
  mercurial
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
  p7zip
  pv
  tmux
	# Network tools
	dns2tcp
	knock
	rename
	npm
	micro
	z
	fzf
	ripgrep
	ncdu
)

# Start the actual installation of the recipes
brew_install_recipes

# install recipes with special arguments
brew install gnu-sed --default-names
brew install vim --override-system-vi
brew install wget --enable-iri
# Remove outdated versions from the cellar
brew cleanup