#!/usr/bin/env bash

unset module
# Source global definitions.
if [[ -f /etc/bashrc ]]; then
    source /etc/bashrc
fi
DESKTOP=GNOME
PREFERRED=/usr/bin/gnome-session
#eval `perl -I /nfs/mercury-11/u113/perl5/lib/perl5 -Mlocal::lib`
export LIBGL_ALWAYS_INDIRECT=1
export GNOME_SHELL_SESSION_MODE=classic

#echo "Sourcing BBN stuff"
source $HOME/.bash_bbn

export USE_BREW=0
if [[ $USE_BREW -eq 1 ]]; then
# echo "Using linuxbrew"
  source ~/.bash_brew
fi

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
export SHORT_HOSTNAME=$(hostname -s)

#alias sh=bash

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


shopt -s histappend

export PATH=/home/sadali/.toolsforai/RuntimeSDK/cntk/cntk/bin:$PATH
export LD_LIBRARY_PATH=/home/sadali/.toolsforai/RuntimeSDK/cntk/cntk/lib:/home/sadali/.toolsforai/RuntimeSDK/cntk/cntk/dependencies/lib:$LD_LIBRARY_PATH
source ~/.aliases

PATH=$HOME/bin:$PATH

export ANACONDA_HOME="/nfs/mercury-12/u15/sadali/anaconda3"

if [[ -e "/export/u10/sadali/miniconda3" ]]; then
   ANACONDA_HOME="/export/u10/sadali/miniconda3"
   source /export/u10/sadali/miniconda3/etc/profile.d/conda.sh  # commented out by conda initialize
   unset __conda_setup
else
unset __conda_setup
#  >>> conda initialize >>>
#!! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/nfs/mercury-12/u15/sadali/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "/nfs/mercury-12/u15/sadali/anaconda3/etc/profile.d/conda.sh" ]; then
      . "/nfs/mercury-12/u15/sadali/anaconda3/etc/profile.d/conda.sh"
  else
      export PATH="/nfs/mercury-12/u15/sadali/anaconda3/bin:$PATH"
  fi
fi
unset __conda_setup
#<<< conda initialize <<<
fi

# Stop here for an non-interactive shell.
case $- in
    *i*) ;;
      *) return;;
esac


##########################
## THEMING and CUSTOMIZATION
############

# #powerline
# export PATH=/home/sadali/xiki/bin:$PATH

export PS1="$RED.:$GREEN\u@\h$RED:. $BLUE\w$GREEN${CONDA_DEFAULT_ENV}$RED"' $(__git_ps1 " (%s)") '"\$$END "
#export  PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

#export POWERLINE=/nfs/mercury-11/u113/local/anaconda/lib/python2.7/site-packages
#. $POWERLINE/powerline/bindings/bash/powerline.sh
echo "powerline prompt enabled"
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

echo -ne "Today is "; date
echo -e ""; cal ;

#echo "Sourcing bash it at $BASH_IT"
#source $BASH_IT/bash_it.sh

echo "My variables"
echo $(env | grep 'MY')


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


# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@github.com'


# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true


# Load Bash It

#source $BASH_IT/bash_it.sh
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
export PATH=/home/sadali/.gem/ruby/2.2.0/bin:$PATH

export ZSH_SHELL=$(command -v zsh)

echo $ZSH_SHELL
if  [ -f "$ZSH_SHELL" ]; then
echo "z shell is available at $ZSH_SHELL"
#exec $ZSH_SHELL
fi


