function cgit () {

  # plumbing commands - Low level git commands to build more commands
  # https://mirrors.edge.kernel.org/pub/software/scm/git/docs/git.html#_low_level_commands_plumbing

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

  local CBRANCH=$(git rev-parse --abbrev-ref HEAD)
  local BRANCHES=$(git for-each-ref --format="%(refname:short)" refs/heads/)

  local NPA=()
  # Param expansion/replacement
  for PARAM in "${@}"
  do
    case "$PARAM" in
      --cbranch|-cb)
        PARAM="$CBRANCH"
        ;;
    esac
    NPA+=("$PARAM")
  done


  case "$1" in
    pull)
      case "$2" in
        --overwrite|-ow)
          gitPullOverwrite $3
        ;;
        pr)
          gitPullPullRequestBranch $3 $2
        ;; 
        *) 
          git "${NPA[@]}"
        ;;
      esac
    ;;
    branch) 
      gitBranchSelect $2
    ;;
    testing)
      availableBranchesLoop $2
    ;;
    *) 
      git "${NPA[@]}"
    ;;
  esac

  function availableBranchesLoop() {
    local NUMB=1
    for BRANCH in ${BRANCHES}; do
      if [ $CBRANCH != $BRANCH ]; then
          if verifyParamExists $1; then
            if [[ "$NUMB" -eq "$1" ]]; then
              printf "Selected: $BRANCH \n"
            fi
          else
          printf  "$NUMB ${Green}$BRANCH ${NC} \n"
          fi
          NUMB=$((NUMB+1))
      fi
    done
  }

  function gitPullOverwrite() {
    local REMOTE=$1 
    if verifyParamExists $1; then
      if confirm "This OVERWRITES LOCAL COMMITS not in ${REMOTE}/${CBRANCH}. Is this ok?"; then
        git fetch $REMOTE
        git reset $REMOTE/$CBRANCH --hard
      fi
    else
      echo "usage: cgit pull [<options>] [<repository>]"
    fi
  }

  # Normally it is git fetch $REMOTE pull/$ID/head:$BRANCHNAME
  function gitPullPullRequestBranch() {
    local REMOTE=upstream
    local ID=$1
    local BRANCHNAME=$2
    if verifyParamExists $1 && verifyParamExists $2; then
      if confirm "This OVERWRITES LOCAL COMMITS not in ${REMOTE}/${CBRANCH}. Is this ok?"; then
        git fetch $REMOTE pull/$ID/head:$BRANCHNAME
      fi
    else
      echo "usage: cgit pull [<options>] [<repository>]"
    fi
  }

  function gitBranchSelect() {
    if verifyParamEmpty $1; then
    printf "* ${Cyan}$CBRANCH ${NC} \n"
    fi
    availableBranchesLoop $1
  }

}