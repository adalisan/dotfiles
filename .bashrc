#!/usr/bin/env bash

# Path to the bash it configuration
export BASH_IT="$HOME/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='colourful'
#export BASH_IT_THEME='powerline-multiline'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@github.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Load Bash It
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

fi
# Other variables.
export EDITOR=micro
#export PAGER=less

export RAID_PRIV_DIR=/nfs/mercury-11/u113

export ALADDIN_PROJ_ROOTDIR=${RAID}/projects/aladdin
export ALADDIN_PROJ_DATA=${ALADDIN_PROJ_ROOTDIR}/data
export PLAYGROUND=~/runjobs_playground
export DEV_SPACE=~/projects/aladdin/dev
export PATH=/d4m/ws/bin:$PATH
export PATH=/home/sadali/local/bin:$PATH
export PATH=${RAID}/bin:$PATH
export PATH=${RAID}/bin/gsutil:$PATH
export CPATH=/usr/include


#extra software
export PATH=/opt/git-2.14.1-x86_64/bin:$PATH
export PATH=${RAID}/local/vscode/VSCode-linux-x64:$PATH
export PATH=/nfs/mercury-11/u104/pycharm-community-2017.2.1/bin:$PATH
export PATH=/opt/gnuplot-4.6.6-x86_64/bin:$PATH
export PATH=/nfs/mercury-11/u104/ST3:$PATH



#if [[ `hostname -s` -eq d400 ]]; then
#     export LD_LIBRARY_PATH=/home/sadali/local/lib:$LD_LIBRARY_PATH
#     export LD_LIBRARY_PATH=/home/sadali/local/lib64:$LD_LIBRARY_PATH
#     export LD_LIBRARY_PATH=/opt/gcc-4.8.3-x86_64/lib/:$LD_LIBRARY_PATH
#     export LD_LIBRARY_PATH=/opt/gcc-4.8.3-x86_64/lib64/:$LD_LIBRARY_PATH
#fi

# Aladdin scripts for feature manip, munging, file conversion
export PATH=/home/sadali/aladdin_dev/data_tools:$PATH


#
export MY_AUTOCONF=/opt/autoconf-2.69${ARCH_SUFFIX}
#setenv MY_AUTOMAKE   /home/sadali/local/bin/automake
export FORCE_GCC_4_9=true

#use 5.3 GCC for building graph-tool

if [[ -d /opt/gcc-5.3.0${ARCH_SUFFIX}/ &&  "${FORCE_GCC_4_9}" != true ]]; then
export MY_COMPILER=/opt/gcc-5.3.0${ARCH_SUFFIX}/
export CPATH=/opt/gcc-5.3.0${ARCH_SUFFIX}/include
export LIBRARY_PATH=/opt/gcc-5.3.0${ARCH_SUFFIX}/lib64:/opt/gcc-5.3.0${ARCH_SUFFIX}/lib:$LIBRARY_PATH
export PATH=/opt/gcc-5.3.0-x86_64/bin:$PATH

# Use 4.9 GCC (similar to the one built at toast
elif [[ -d /opt/gcc-4.9.1${ARCH_SUFFIX}/  ]]; then
export MY_COMPILER=/opt/gcc-4.9.1${ARCH_SUFFIX}
export LIBRARY_PATH=/opt/gcc-4.9.1${ARCH_SUFFIX}/lib64:/opt/gcc-4.9.1${ARCH_SUFFIX}/lib:$LIBRARY_PATH
export LD_LIBRARY_PATH=/opt/gcc-4.9.1${ARCH_SUFFIX}/lib64:/opt/gcc-4.9.1${ARCH_SUFFIX}/lib:${LD_LIBRARY_PATH}
export PATH=/opt/gcc-4.9.1-x86_64/bin:$PATH
export CPATH=/opt/gcc-4.9.1-x86_64/include
export CPLUS_INCLUDE_PATH=/opt/gcc-4.9.1-x86_64/include:/opt/gcc-4.9.1-x86_64/include/c++/4.9.1:$CPLUS_INCLUDE_PATH
else
export  MY_COMPILER=/usr
>>>>>>> b826d9d... fixed bugs
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


export NVM_DIR="/home/sadali/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  

# This loads nvm

# Path to the bash it configuration

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='powerline-multiline'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'


# Load Bash It
source $BASH_IT/bash_it.sh
#-[ -n "$PS1" ] && source ~/.bash_profile;
export DISPLAY=:0
source $HOME/.bash_wsl
