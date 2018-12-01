#!/usr/bin/env bash

# Adapted from: https://raw.githubusercontent.com/jimhester/configurations-linux/dotfiles/master/setup.sh
make_link(){
    mkdir -p "${1%/*}"
	  if [[ -h "$1" ]]; then
	      rm "$1"
	 elif [[ -f "$1" ]]; then
	    mv "$1" "$1".old
	  fi
	  echo "Symbolic linking $1"
	  ln -s "$2" "$1"
}

make_link "$HOME"/.zshrc "$HOME"/configurations-linux/dotfiles/zsh/zshrc.sh
make_link "$HOME"/.tmux.conf "$HOME"/configurations-linux/dotfiles/tmux/tmux.conf

make_link "$HOME"/.ripgreprc "$HOME"/configurations-linux/dotfiles/tools/ripgreprc


## RStudio snippets link
for snippet in \
	rstudio/{r.snippets,c_cpp.snippets,markdown.snippets} ; do
	 make_link "$HOME"/.R/snippets/"${snippet##*/}" "$HOME"/configurations-linux/dotfiles/"$snippet"
done

make_link "$HOME"/.Rprofile "$HOME"/configurations-linux/dotfiles/R/Rprofile.R

make_link "$HOME"/.config/nvim/UltiSnips "$HOME"/configurations-linux/dotfiles/nvim/ultisnips/

