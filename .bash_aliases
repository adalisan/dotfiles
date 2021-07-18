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


__git_ps1 ()
{
  local b="$(git symbolic-ref HEAD 2>/dev/null)";
  if [ -n "$b" ]; then
    printf " (%s)" "${b##refs/heads/}";
  fi
}



function pr() {
 pushd $HOME/projects/$1
 cd $(pwd -P)
}

function rpm_install(){
rpm2cpio $1 | cpio -idmv
}

function raiddir() {
 pushd $RAID/$1
 cd $(pwd -P)
}


function bkp() {
 if [ ! -e $1.bak ]; then
 cp $1 $1.bak
 else
 cp $1 $1.$(date).bak
 fi
}

function arc(){
bkp $1
if [[ -e  "$1.bak" ]]; then
rm $1
else
echo "will not rm $1 since bkp $1.bak may not exist"
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

source ~/.aliases
alias gpu=nvidia-smi
