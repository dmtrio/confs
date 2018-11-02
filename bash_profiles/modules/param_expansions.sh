function x() {

  local CBRANCH=$(git rev-parse --abbrev-ref HEAD)
  local GITREFFOREACH="git for-each-ref --sort=-committerdate refs/heads"
  local FORMATTABLE="--color --format='%(color:green)%(refname:short)|%(color:red)%(committerdate:relative)|%(color:white)%(subject)"
  local FORMATSHORT="--format='%(refname:short)"
  local REMOVECURRENT="%(HEAD)' | grep -v '*'"

  function gitRefsTable() {
    local BRANCHES="${GITREFFOREACH} ${FORMATTABLE} ${REMOVECURRENT}"
    echo "Branches Available"
    eval ${BRANCHES} | grep -n '' | column -ts'|'
  }

  # Without a param it returns a list of all available branches numbered
  # With an INT param it return the matching BRANCH of the numbered branches
  function gitRefsReturnBranch() {
    local BRANCHES=$( eval "${GITREFFOREACH} ${FORMATSHORT} ${REMOVECURRENT}")
    local NUMB=1
    for BRANCH in ${BRANCHES}; do
        if verifyParamExists $1; then
          if [[ "$NUMB" -eq "$1" ]]; then
            echo ${BRANCH}
          fi
        fi
      ((NUMB+=1))
    done
  }


  function gitBranchSelect() {
    if verifyParamExists $1; then
      PARAM="$(gitRefsReturnBranch ${1})"
    else
      read -r -p "$(gitRefsTable) `echo $'\nSelect the number for the desired branch:'`" RESPONSE
      echo "$(gitRefsReturnBranch $RESPONSE)"
    fi
  }

  # START: Param expansion/replacement
  local NPA=""
  for PARAM in "${@}"
  do
    case "$PARAM" in
      cbranch|cb)
        PARAM="$(git rev-parse --abbrev-ref HEAD)"
      ;;
      vbranch|vb)
        PARAM="$(availableBranchesLoop)"
      ;;
      # extended globing matching
      sbranch*([0-9])|sb*([0-9]))
        local SEL=${PARAM//[!0-9]/}
        PARAM="$(gitBranchSelect $SEL)"
      ;;
      g)
        PARAM="git"
      ;;
      co)
        PARAM="checkout"
      ;;

    esac
    NPA+=" ${PARAM}"
  done
  eval ${NPA}
  # END: Param expansion/replacement
}
