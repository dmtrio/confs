function cgit () {

  local BRANCH=$(git rev-parse --abbrev-ref HEAD)

  local NPA=()
  # Param expansion/replacement
  for PARAM in "${@}"
  do
    case "$PARAM" in
      --cbranch|-cb)
        PARAM="$BRANCH"
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
    *) 
      git "${NPA[@]}"
      ;;
  esac


  function gitPullOverwrite() {
    local REMOTE=$1 
    if verifyParamExists $1; then
      if confirm "This OVERWRITES LOCAL COMMITS not in ${REMOTE}/${BRANCH}. Is this ok?"; then
        git fetch $REMOTE
        git reset $REMOTE/$BRANCH --hard
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
      if confirm "This OVERWRITES LOCAL COMMITS not in ${REMOTE}/${BRANCH}. Is this ok?"; then
        git fetch $REMOTE pull/$ID/head:$BRANCHNAME
      fi
    else
      echo "usage: cgit pull [<options>] [<repository>]"
    fi
  }

}