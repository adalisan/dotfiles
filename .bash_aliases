alias sudo=/usr/bin/sudo
alias vncconfig='vncconfig -iconic'
alias mi='micro'
# Some usable functions
export SCRIPTS="$RAID/local/buetext"
function execute () {
	#script=$1
	python  $SCRIPTS/$1.py "${@:2}"
}
alias execute="$PYTHON  $SCRIPTS/"
alias executewhat='execute what'

function pr() {
 pushd /home/sadali/pr/$1
 cd $(pwd -P)
}

function bkp() {
 if [ ! -e $1.bak ]; then
 cp $1 $1.bak
 else
 cp $1 $1.date
 fi
}

source ~/.aliases
