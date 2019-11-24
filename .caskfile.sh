# Exit if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Brew casks need Homebrew to install." && return 1

# Tap Homebrew kegs.
function brew_tap_kegs() {
  kegs=setdiff "${kegs[*]}" "$(brew tap)"
  if (( ${#kegs[@]} > 0 )); then
    echo "Tapping Homebrew kegs: ${kegs[*]}"
    for keg in "${kegs[@]}"; do
      brew tap $keg
    done
  fi
}

# Ensure the cask keg and recipe are installed.
kegs=(
	caskroom/cask
  homebrew/science
)
brew_tap_kegs

# Exit if, for some reason, cask is not installed.
if [[ ! "$(brew ls --versions brew-cask)" ]]; then
  e_error "Brew-cask is not installed ..."
  brew install caskroom/cask/brew-cask
else
  brew upgrade brew-cask
fi

# Hack to show the first-run brew-cask password prompt immediately.
brew cask info this-is-somewhat-annoying 2>/dev/null

# Homebrew casks
casks=(
  # Utilities
  alfred
  cakebrew
  fastscripts
  bettertouchtool
  iterm2
  launchrocket
  gyazo
  ubersicht
  liteicon
  flexiglass
  # Productivity
  evernote
  mendeley-desktop
  # Development
  visual-studio-code
  sourcetree
  github
  transmission-remote-gui
  lightpaper
  ksdiff
  # Internet, Networking
  firefox
  google-chrome
  dropbox
  google-drive
  # Misc.
  vlc
  steam
  the-unarchiver
  spotify
  handbrake
  # Quick Look plugins
  betterzipql
  qlcolorcode
  qlmarkdown
  quicklook-csv
  quicklook-json
  quicknfo
  suspicious-package
  webpquicklook
	# Scientific computing
	rstudio
	anaconda
	dotnet
)

# Install Homebrew casks.
casks=setdiff "${casks[*]}" "$(brew cask list 2>/dev/null)"
if (( ${#casks[@]} > 0 )); then
  echo "Installing Homebrew casks: ${casks[*]}"
  for cask in "${casks[@]}"; do
    brew cask install $cask
  done
  brew cleanup
fi

# Work around colorPicker symlink issue.
# https://github.com/caskroom/homebrew-cask/issues/7004
cps=()
for f in ~/Library/ColorPickers/*.colorPicker; do
  [[ -L "$f" ]] && cps=("${cps[@]}" "$f")
done

if (( ${#cps[@]} > 0 )); then
  echo "Fixing colorPicker symlinks"
  for f in "${cps[@]}"; do
    target="$(readlink "$f")"
    echo "$(basename "$f")"
    rm "$f"
    cp -R "$target" ~/Library/ColorPickers/
  done
fi

