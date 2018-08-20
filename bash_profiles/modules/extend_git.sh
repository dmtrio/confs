function cgit () {
  case "$1" in
    pull)
      case "$2" in
        --overwrite)
          gitPullOverwrite $3
          ;; 
        *) 
          git "$@"
          ;;
      esac 
      ;; 
    *) 
      git "$@"
      ;;
  esac 


  function gitPullOverwrite() {
    if verifyParamExists $1; then
      local REMOTE=$1 
      local BRANCH=$(git rev-parse --abbrev-ref HEAD)
      if confirm "This OVERWRITES LOCAL COMMITS not in ${REMOTE}/${BRANCH}. Is this ok?"; then
        git fetch $REMOTE
        git reset $REMOTE/$BRANCH --hard
      fi
    else
      echo "specify remote to use"
    fi
  }

}