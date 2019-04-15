#!/usr/bin/env bash

unset module
# Source global definitions.
if [[ -f /etc/bashrc ]]; then
    . /etc/bashrc
fi
#echo "Sourcing BBN stuff"
source $HOME/.bash_bbn

export USE_BREW=0
if [[ $USE_BREW -eq 1 ]]; then
  #echo "Using linuxbrew"
  source ~/.bash_brew
fi

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
export SHORT_HOSTNAME=$(hostname -s)

#alias sh=bash



##########################
## THEMING and CUSTOMIZATION
############

# #powerline
# export PATH=/home/sadali/xiki/bin:$PATH

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
export PS1="$RED.:$GREEN\u@\h$RED:. $BLUE\w$GREEN${CONDA_DEFAULT_ENV}$RED"' $(__git_ps1 " (%s)") '"\$$END "
#export  PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# Stop here for an non-interactive shell.
case $- in
    *i*) ;;
      *) return;;
esac

#export POWERLINE=/nfs/mercury-11/u113/local/anaconda/lib/python2.7/site-packages
#. $POWERLINE/powerline/bindings/bash/powerline.sh
#echo "powerline prompt enabled"
source ~/.bash-powerline.sh


# Path to the bash it configuration
#export BASH_IT="/home/sadali/.bash_it"
#export BASH_IT="/home/sadali/.bash_it_local"
# Lock and Load a custom theme file
# location /.bash_it/themes/

#export BASH_IT_THEME='powerline-multiline'
export BASH_IT_THEME='powerline-plain'
#export BASH_IT_THEME='tylenol'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Don't check mail when opening terminal.
unset MAILCHECK

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true




# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@github.com'

# Set this to the command you use for todo.txt-cli
export TODO="t"

echo -ne "Today is "; date
echo -e ""; cal ;

#echo "Sourcing bash it at $BASH_IT"
#source $BASH_IT/bash_it.sh

echo "My variables"
echo $(env | grep 'MY')
#-[ -n "$PS1" ] && source ~/.bash_profile;
#export DISPLAY=:0
#source $HOME/.bash_wsl

shopt -s histappend

git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "yellow"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"

export PATH=/home/sadali/.toolsforai/RuntimeSDK/cntk/cntk/bin:$PATH
export LD_LIBRARY_PATH=/home/sadali/.toolsforai/RuntimeSDK/cntk/cntk/lib:/home/sadali/.toolsforai/RuntimeSDK/cntk/cntk/dependencies/lib:$LD_LIBRARY_PATH
source ~/.aliases

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@github.com'


# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

PATH=$HOME/bin:$PATH


# Load Bash It

#source $BASH_IT/bash_it.sh
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
