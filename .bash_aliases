alias sudo=/usr/bin/sudo
alias myjobs='sg_list -srp -usadali'
alias monjobs='watch sg_list -srp -usadali'
alias vncconfig='vncconfig -iconic'
alias mi='micro'
# Some usable functions
export SCRIPTS="$RAID/projects/buetext_utils"
#function execute () {
	#script=$1
#	python  $SCRIPTS/$1.py "${@:2}"
#}
alias execute="$PYTHON  $SCRIPTS/"
alias executewhat='execute what'

function exp() {
  pushd /d4m/ears/expts/$1/sequences
}
function vid_exp() {
 pushd /d4m/vid/expts/$1/sequences
}
function pr() {
 pushd $RAID/projects/$1
 cd $(pwd -P)
}

function raiddir() {
 pushd $RAID/$1
 cd $(pwd -P)
}


function bkp() {
 if [ ! -e $1.bak ]; then
 cp $1 $1.bak
 else
 cp $1 $1.date
 fi
}

function new_bs() {
newscript=$(pwd)/$1.bash
cp -n $HOME/bin/shell-scripts/simpleScriptTemplate.sh $newscript
chmod +x $newscript
mi $newscript
}

function log_this () {
${@: -1} | tee -a $1_runlog.txt
	
}

function cenv() {
conda activate $1
}

alias code="/export/u10/VSCode-linux-x64/code --extensions-dir=/export/u10/sadali/vscode/.vscode/extensions --user-data-dir=/export/u10/sadali/vscode/Code"
source ~/.aliases
alias gpu=nvidia-smi
