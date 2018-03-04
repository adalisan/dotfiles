#!/usr/bin/env bash
[ -n "$PS1" ] && source ~/.bash_profile;

# Path to the bash it configuration
export BASH_IT="$HOME/.bash_it"
export BASH_IT_THEME='powerline-multiline'

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='colourful'

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
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt


# Lock and Load a custom theme file
# location /.bash_it/themes/

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'


# Load Bash It
source $BASH_IT/bash_it.sh
