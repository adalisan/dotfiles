
# Settings
export VISUAL=nano
export ZSH_DIR=$HOME/configurations-linux/dotfiles/zsh
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'
emulate sh -c 'source ~/.aliases'
emulate sh -c 'source ~/.bash_aliases'
#emulate sh -c 'source ~/.bashrc'
source $ZSH_DIR/plugins/fixls.zsh

source $ZSH_DIR/plugins/oh-my-zsh/lib/history.zsh
source $ZSH_DIR/plugins/oh-my-zsh/lib/key-bindings.zsh
source $ZSH_DIR/plugins/oh-my-zsh/lib/completion.zsh
source $ZSH_DIR/plugins/vi-mode.plugin.zsh
source $ZSH_DIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_DIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $ZSH_DIR/keybindings.sh
source $ZSH_DIR/prompt.sh


# Path to your oh-my-zsh installation.
export ZSH=$ZSH_DIR/plugins/oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="random"
TERM=xterm

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(
#  git
#)

source $ZSH/oh-my-zsh.sh


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

## Some useful alias to make your life easier :)
##

## ls group directory first
alias lsf="ls --group-directories-first --color=auto"

## ls with color
alias ls='ls --color=auto'

## Refresh font cache
alias font-refresh="fc-cache -fv"

## git clone depth 1, who needs to clone full repository if you can clone the top layer only
alias clone="git clone --depth 1"

## merge Xresources, useful for urxvt & rofi theming
alias merge_X="xrdb ~/.Xresources"

# Vars
HISTFILE=~/.zsh_history
setopt inc_append_history # To save every command before it is executed
setopt share_history # setopt inc_append_history

# Aliases
alias v='eval $(command -v nvim)'
alias cp='cp -iv' # 'cp' prompt and verbose
alias mv='mv -iv' # 'mv' prompt and verbose
mkdir -p /tmp/log

# Functions


# git log alias
alias gg="git log --graph --pretty=format:'%C(blue)%h%Creset%C(magenta)%d%Creset %C(bold)%s%Creset %C(yellow)<%an> %C(cyan)(%ci)%Creset' --abbrev-commit --date=iso"

# Fzf git-log (interactive)
# Source: https://gist.github.com/junegunn/f4fca918e937e6bf5bad
ggshow() {

	if [ ! -d .git ];then
		echo >&2 "No git repository found."
		return 0
	fi

	gg |
	     fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
		     --bind "ctrl-m:execute:
		             (grep -o '[a-f0-9]\{7\}' | head -1 |
		              xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
		              {}
 				     FZF-EOF"
}

# ripgrep config file defined as an environment variable
# Source: https://github.com/BurntSushi/ripgrep/blob/0.8.0/GUIDE.md#configuration-file
export RIPGREP_CONFIG_PATH="$HOME"/.ripgreprc

# fzf (managed by fzf):
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sadali/local/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sadali/local/anaconda/etc/profile.d/conda.sh" ]; then
        . "/home/sadali/local/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/home/sadali/local/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

