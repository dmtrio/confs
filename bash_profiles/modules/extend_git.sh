# GLOBALS - Preserved though multiple excecutions
if [ -d .git ]; then
  CBRANCH=$(git rev-parse --abbrev-ref HEAD)
fi;



function cgit () {

  # plumbing commands - Low level git commands to build more commands
  # https://mirrors.edge.kernel.org/pub/software/scm/git/docs/git.html#_low_level_commands_plumbing

  local CBRANCH=$(git rev-parse --abbrev-ref HEAD)
  local BRANCHES=$(git for-each-ref --format="%(refname:short)" refs/heads/)

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
    # replaces only cgit branch and passes any other cgit branch commands to git
    branch)
      if verifyParamEmpty $2; then
        gitBranchSelect
      else
        git "${NPA[@]}"
      fi
    ;;
    *) 
      git "${NPA[@]}"
    ;;
  esac

}