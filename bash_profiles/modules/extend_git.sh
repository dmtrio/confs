# GLOBALS - Preserved though multiple excecutions
SBRANCH=""

function cgit () {

  # plumbing commands - Low level git commands to build more commands
  # https://mirrors.edge.kernel.org/pub/software/scm/git/docs/git.html#_low_level_commands_plumbing

  local CBRANCH=$(git rev-parse --abbrev-ref HEAD)
  local BRANCHES=$(git for-each-ref --format="%(refname:short)" refs/heads/)


  function availableBranchesLoop() {
    local NUMB=1
    for BRANCH in ${BRANCHES}; do
      if [ $CBRANCH != $BRANCH ]; then
          if verifyParamExists $1; then
            if [[ "$NUMB" -eq "$1" ]]; then
              SBRANCH=$BRANCH
              printf "Selected: ${Cyan}$BRANCH${NC} \n"
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


  local NPA=()
  # START: Param expansion/replacement 
  for PARAM in "${@}"
  do
    case "$PARAM" in
      --cbranch|-cb)
        PARAM="$CBRANCH"
      ;;
      # extended globing matching
      --sbranch*([0-9])|-sb*([0-9]))
        local SEL=${PARAM//[!0-9]/}
        if verifyParamExists ${SEL}; then
          gitBranchSelect ${SEL}
        fi
        PARAM=$SBRANCH
      ;;
    esac
    NPA+=("$PARAM")
  done
  # END: Param expansion/replacement


  case "$1" in
    ammend)
      git commit -a --amend -C HEAD
    ;;
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
      if verifyParamEmpty $2; then
        gitBranchSelect
      else
        git "${NPA[@]}"
      fi
    ;;
    # testing)
    #   echo "$SBRANCH"
    # ;;
    *) 
      git "${NPA[@]}"
    ;;
  esac

}