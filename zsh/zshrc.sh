# Settings
export VISUAL=nano
export ZSH_DIR=$HOME/configurations-linux/dotfiles/zsh
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'
emulate sh -c 'source ~/.aliases'
emulate sh -c 'source ~/.bash_aliases'
#emulate sh -c 'source ~/.bashrc'
# How can I set my default shell to start up tmux https://unix.stackexchange.com/a/113768
if command -v tmux>/dev/null; then
	[ -z "$TMUX" ] && exec tmux
else
	echo "tmux not installed. Run ./deploy to configure dependencies"
fi

# Settings
export ZSH_DIR=$HOME/configurations-linux/dotfiles/zsh
source $ZSH_DIR/plugins/fixls.zsh

source $ZSH_DIR/plugins/oh-my-zsh/lib/history.zsh
source $ZSH_DIR/plugins/oh-my-zsh/lib/key-bindings.zsh
source $ZSH_DIR/plugins/oh-my-zsh/lib/completion.zsh
source $ZSH_DIR/plugins/vi-mode.plugin.zsh
source $ZSH_DIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_DIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $ZSH_DIR/keybindings.sh
source $ZSH_DIR/prompt.sh

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

export PATH=$HOME/bin:$HOME/.local/bin:$HOME/go/bin:$PATH
