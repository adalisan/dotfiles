#!/usr/bin/env bash
# -*- sh -*-


# Source global definitions.
if [[ -f /etc/bashrc ]]; then
    . /etc/bashrc
fi
echo "Sourcing BBN stuff"
source /home/sadali/.bash_bbn

export USE_BREW=0
if [[ $USE_BREW -eq 1 ]]; then
  echo "Using linuxbrew"
  source ~/.bash_brew
fi



# Path to the bash it configuration

# # Requirements for caffe builds

export LD_LIBRARY_PATH=/opt/x264-snapshot-20140708-2245-stable-x86_64/lib:$LD_LIBRARY_PATH
if [[ `hostname -s` == "ag400" ]]; then
export LD_LIBRARY_PATH=/usr/lib64:$LD_LIBRARY_PATH
echo "added /usr/lib64 to ld library path so that DE runs with right GL libraries linked to latest nvidia  libs on ag400"
fi
##########################
## THEMING and CUSTOMIZATION
############

# #powerline
# export PATH=/home/sadali/xiki/bin:$PATH

#export POWERLINE=/nfs/mercury-11/u113/local/anaconda/lib/python2.7/site-packages
# #. $POWERLINE/powerline/bindings/bash/powerline.sh
# #source ~/.bash-powerline.sh


# Path to the bash it configuration
export BASH_IT="/home/sadali/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/

#export BASH_IT_THEME='powerline-multiline'
export BASH_IT_THEME='powerline-plain'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Don't check mail when opening terminal.
unset MAILCHECK

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
export SHORT_HOSTNAME=$(hostname -s)

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@github.com'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

echo -ne "Today is "; date
echo -e ""; cal ;

# Load Bash It
#source $BASH_IT/bash_it.sh
VNCCONFIG=`which  vncconfig`
if [[ -z $VNCCONFIG  ]]; then
vncconfig -iconic &
fi
#source $RAID/local/buetext/bash/bash_functions
#[ -n "$PS1" ] && source ~/.bash_profile;

