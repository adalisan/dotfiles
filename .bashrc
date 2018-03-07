#!/usr/bin/env bash
# -*- sh -*-


# Source global definitions.
if [[ -f /etc/bashrc ]]; then
    . /etc/bashrc
fi


# Set RAID for experiments before sourcing bue_bashrc_*.
export RAID=/nfs/mercury-11/u113

umask 002

# BU-E Detect Linux version.
if grep -q "release 5\." /etc/redhat-release; then
    BUE_BASHRC="bue_bashrc_sl5"
elif grep -q "release 6\." /etc/redhat-release; then
    BUE_BASHRC="bue_bashrc_sl6";
else
    BUE_BASHRC="bue_bashrc_sl6";
    echo "Unknown Linux release. Probably SL7";
#    BUE_BASHRC="bue_bashrc_unknown";
fi



# BU-E: Source local environment.

if [ -r /etc/$BUE_BASHRC ]; then
    . /etc/$BUE_BASHRC
    echo "called bue bashrc from etc"
elif [ -r /d4m/ears/source_files/$BUE_BASHRC ]; then
    . /d4m/ears/source_files/$BUE_BASHRC
    echo "called bue bashrc from d4m_ears"
else
    echo "Unable to find $BUE_BASHRC.  Settings not loaded."
fi

export HISTSIZE=1000000
export HISTFILESIZE=1000000
export HISTIGNORE='ls'


# Stop here for an non-interactive shell.
case $- in
    *i*) ;;
      *) return;;
esac



# Customizations for interactive shell start here.

# Alias definitions.
#
# Put your aliases into a separate file ~/.bash_aliases, instead of
# adding them here directly.
if [ -f ~/.bash_aliases ]; then
   . ~/.bash_aliases
fi


# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
if [ -f ~/.dir_colors ]; then
  eval `dircolors -b ~/.dir_colors`
#else
#  eval `dircolors -b /etc/DIR_COLORS`
fi



# PROMPT
__git_ps1 ()
{
  local b="$(git symbolic-ref HEAD 2>/dev/null)";
  if [ -n "$b" ]; then
    printf " (%s)" "${b##refs/heads/}";
  fi
}



PROMPT_COMMAND="history -a"
# SHELL COLORS
#RED="\[\033[0;31m\]"
#YELLOW="\[\033[0;33m\]"
#GREEN="\[\033[0;32m\]"
#BLUE="\[\033[0;34m\]"
#END="\[\e[0m\]"
if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
else
#PS1="$RED.:$GREEN\u@\h$RED:. $BLUE\w$RED"' $(__git_ps1 " (%s)") '"\$$END "

# export  PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
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
fi


export PATH=${MY_COMPILER}/bin:$PATH



export MY_CMAKE=/opt/cmake-2.8.12.2-x86_64
export CMAKE_C_COMPILER=$MY_COMPILER/bin/gcc
export CMAKE_CXX_COMPILER=$MY_COMPILER/bin/g++


#export LD_LIBRARY_PATH=/home/swu/local/lib:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/home/swu/local/lib64:$LD_LIBRARY_PATH


export MY_JAVA=/opt/jdk1.8.0_20-x86_64
export JAVA_HOME=/opt/jdk1.8.0_20-x86_64
export PATH=${MY_JAVA}/bin:$PATH

#SET PYTHON DIRS

export USE_ANACONDA=0
export USE_OPT_PYTHON_2=0
export USE_OPT_PYTHON_3=0
export USE_SWU_PYTHON=0
export OPT_PYTHON_2="/opt/Python-2.7.8-x86_64/"
export OPT_PYTHON_3="/opt/Python-3.5.2-x86_64/"

export SWU_PYTHON="/home/swu/local/bin/python"
export USE_DOT_LOCAL=0 #for tensorflow

hostname=`hostname -s`
#echo $hostname

if [[ `hostname -s` -ne "ag400" ]]; then

	if [[ $USE_ANACONDA -eq 1 ]]; then
	# added by Anaconda 2.2.0 installer
		source ~/.bash.anaconda
		elif [[ $USE_OPT_PYTHON_2 -eq 1 ]]; then

		export PATH=$OPT_PYTHON_2/bin:$PATH
		export PYTHON=$OPT_PYTHON_2/bin/python
		export MY_PYTHON=$OPT_PYTHON_2/bin/python
		export PYTHONPATH=$OPT_PYTHON_2/lib/python2.7/site-packages/
		export PYTHONHOME=$OPT_PYTHON_2
		export CPATH=$OPT_PYTHON_2/include/python2.7:$CPATH
		export CPATH=/home/sadali/local/lib/python2.7:$CPATH
		export CPLUS_INCLUDE_PATH=/home/sadali/local/include/python2.7:$OPT_PYTHON_2/include/python2.7:$CPLUS_INCLUDE_PATH
	elif [[ $USE_SWU_PYTHON -eq 1 ]]; then
		export PATH=$SWU_PYTHON/bin:$PATH
		export PYTHON=$SWU_PYTHON/bin/python
		#export MY_PYTHON=/usr/bin/python
		export PYTHONPATH=$SWU_PYTHON/lib/python2.7/site-packages/
		export PYTHONHOME=$SWU_PYTHON
		export CPATH=$SWU_PYTHON/include/python2.7:$CPATH
		export CPATH=/home/swu/local/lib/python2.7:$CPATH
		export CPLUS_INCLUDE_PATH=/home/swu/local/include/python2.7:$SWU_PYTHON/include/python2.7:$CPLUS_INCLUDE_PATH
	fi

else

	if [[ $USE_DOT_LOCAL -eq 1 ]]; then
		export PYTHONPATH=/home/sadali/.local/lib/python2.7/site-packages:$PYTHONPATH
	elif [[ $USE_ANACONDA -eq 1 ]]; then

		export PATH=/home/sadali/local/anaconda/bin:$PATH
		export PYTHON=/home/sadali/local/anaconda/bin/python
		export PYTHONPATH=/home/sadali/local/anaconda/lib/python2.7/site-packages/
		export PYTHONHOME=/home/sadali/local/anaconda/
		export CPATH=/home/sadali/local/anaconda/include/python2.7:$CPATH
		export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/home/sadali/local/anaconda/include

	else
		unset PYTHONPATH
		unset PYTHONHOME
	fi

fi

. /home/sadali/local/anaconda/etc/profile.d/conda.sh

# Set R Related dirs
export R_HOME=${RAID_PRIV_DIR}/local/R-3.2.2
export MY_R=${R_HOME}/bin/R
export PATH=${R_HOME}/bin:$PATH
export LD_LIBRARY_PATH=${R_HOME}/lib64:${R_HOME}/lib:$LD_LIBRARY_PATH


#export MY_PERL=/opt/perl-5.14.1${ARCH_SUFFIX}/
export PATH=$MY_PERL/bin:$PATH
export PERL5LIB=/home/sadali/local/perl_lib:/home/sadali/local/perl_lib/share/perl5:/home/sadali/local/perl_lib/lib/site_perl
export PERL5LIB=${R_HOME}/library/RSPerl/perl:$PERL5LIB
export MY_CUBE2=/d4m/ears/releases/Cube2/R2015_09_11
export PERL5LIB=/home/sadali/perl5:/home/sadali/perl5/lib/perl5:${MY_CUBE2}/install-optimize$ARCH_SUFFIX/perl_lib:${MY_CUBE2}/install-optimize$ARCH_SUFFIX/scripts:$PERL5LIB
export PATH=${MY_CUBE2}/install-optimize-x86_64/bin:$PATH

#ALADDIN
export LD_LIBRARY_PATH=/opt/opencv-2.4.9${ARCH_SUFFIX}/lib:$LD_LIBRARY_PATH


# RUBY related dirs
export GEM_HOME=$HOME/raid_dir/local/gems
export GEM_PATH=$HOME/raid_dir/local/gems:$HOME/raid_dir/local/lib/ruby/gems/2.0.0
#export PATH=$HOME/raid_dir/local/bin:$HOME/raid_dir/local/gems/bin:$PATH


export USE_TOAST=0
# Toast related dirs
if [[ $USE_TOAST -eq 1 ]]; then
  echo "Using toast directories and libraries built by toast"
  source ~/.bash_toast.sh
fi

export CMAKE_C_COMPILER=${MY_COMPILER}/bin/gcc
export CMAKE_CXX_COMPILER=${MY_COMPILER}/bin/g++


export USE_BREW=0
if [[ $USE_BREW -eq 1 ]]; then
  echo "Using linuxbrew"
  source ~/.bash_brew

fi


#export NVM_DIR="/home/sadali/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  

# This loads nvm

# Path to the bash it configuration

# # Requirements for caffe builds

#source ~/.bash.aladdin.sh
export LD_LIBRARY_PATH=/opt/x264-snapshot-20140708-2245-stable-x86_64/lib:$LD_LIBRARY_PATH


## THEMING and CUSTOMIZATION
# #powerline
# export PATH=/home/sadali/xiki/bin:$PATH




#export POWERLINE=/nfs/mercury-11/u113/local/anaconda/lib/python2.7/site-packages
# #. $POWERLINE/powerline/bindings/bash/powerline.sh
# #source ~/.bash-powerline.sh


# Path to the bash it configuration
export BASH_IT="$HOME/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/

export BASH_IT_THEME='powerline-multiline'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'



# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
#export IRC_CLIENT='irssi'


# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1
# >>>>>>> merge conflict


# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@github.com'


# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

echo -ne "Today is "; date

echo -e ""; cal ;

sg_list -srp -usadali

alias myjobs='sg_list -srp -usadali'
alias monjobs='watch sg_list -srp -usadali'
# Load Bash It
source $BASH_IT/bash_it.sh

#[ -n "$PS1" ] && source ~/.bash_profile;

# Some usable functions
export SCRIPTS="$RAID/local/buetext"
function execute () {
	#script=$1
	python  $SCRIPTS/$1.py "${@:2}"
}
alias execute="$PYTHON  $SCRIPTS/"
alias executewhat='execute what'
alias
function exp() {
  cd /d4m/ears/expts/$1/sequences
}
function vid_exp() {
  cd /d4m/vid/expts/$1/sequences
}
