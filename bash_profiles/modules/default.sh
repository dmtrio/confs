#runs this after changing the profile to reflect changes instead of closing out and opening again. This is known as 'sourcing' the bash profile.
# alias sbp='. ~/.bash_profile' 

function sbp() {
    . ~/.bash_profile $1
}

function pullConfs() {
    cd $confs 
    git pull --rebase
    cd -
    sbp $PROFILE
}

function pushConfs() {
    cd $confs
    git add .
    git commit -m "$1"
    git push
    cd -
    sbp $PROFILE
}

  # Colors
  local Black="\033[0,30m"     
  local DGray="\033[1;30m"
  local Red="\033[0;31m" 
  local LRed="\033[1;31m"
  local Green="\033[0;32m"     
  local LGreen="\033[1;32m"
  local Brown="\033[0;33m"     
  local Yellow="\033[1;33m"
  local Blue="\033[0;34m"     
  local LBlue="\033[1;34m"
  local Purple="\033[0;35m"     
  local LPurple="\033[1;35m"
  local Cyan="\033[0;36m"     
  local LCyan="\033[1;36m"
  local LGray="\033[ 0;37m"     
  local White="\033[1;37m"
  local NC="\033[0m"