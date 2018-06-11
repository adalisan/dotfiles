alias sudo=/usr/bin/sudo
alias myjobs='sg_list -srp -usadali'
alias monjobs='watch sg_list -srp -usadali'
alias vncconfig='vncconfig -iconic'
# Some usable functions
export SCRIPTS="$RAID/local/buetext"
function execute () {
	#script=$1
	python  $SCRIPTS/$1.py "${@:2}"
}
alias execute="$PYTHON  $SCRIPTS/"
alias executewhat='execute what'

function exp() {
  cd /d4m/ears/expts/$1/sequences
}
function vid_exp() {
  cd /d4m/vid/expts/$1/sequences
}
function bkp() {
 cp $1 $1.bak
}

