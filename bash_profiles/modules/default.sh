#runs this after changing the profile to reflect changes instead of closing out and opening again. This is known as 'sourcing' the bash profile.

# $1 is the override
function sbp() {
  if verifyParamExists $1; then
    PROFILE=$1
  fi
  . ~/.bash_profile $PROFILE "RELOAD"
}

function pullConfs() {
  cd $confs
  git pull --rebase
  cd -
  # sbp $PROFILE
}

function pushConfs() {
  cd $confs
  git add .
  git commit -m "$1"
  git push
  cd -
  # sbp $PROFILE
}

# Path additions
# Add Visual Studio Code (code)
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"


# Start extended glob matching
shopt -s extglob

# Colors for terminal
# usage: printf  "Some text ${Green}Green text${NC} \n"
Black="\033[0,30m"
DGray="\033[1;30m"
Red="\033[0;31m"
LRed="\033[1;31m"
Green="\033[0;32m"
LGreen="\033[1;32m"
Brown="\033[0;33m"
Yellow="\033[1;33m"
Blue="\033[0;34m"
LBlue="\033[1;34m"
Purple="\033[0;35m"
LPurple="\033[1;35m"
Cyan="\033[0;36m"
LCyan="\033[1;36m"
LGray="\033[ 0;37m"
White="\033[1;37m"
NC="\033[0m"