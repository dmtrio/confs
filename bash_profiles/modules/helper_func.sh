
function toUpperCase() {
    echo "$1" | tr '[:lower:]' '[:upper:]'
} 

function toLowerCase() {
    echo "$1" | tr '[:upper:]' '[:lower:]'
} 

function areMatches() { 
  if verifyParamExists "$2"; then
    local VAR1=$(toUpperCase "$1")
    local VAR2=$(toUpperCase "$2")
    if [ "$VAR1" == "$VAR2" ]; then
      true
    else
      false
    fi
  else
    false
  fi
}

function verifyParamExists() {
  if [ ! -z "$1" ]; then
    true
  else 
    false
  fi
}


# function verifyParamExists() {
#   if [ ! -z "$1" ]; then
#     echo "true"
#   else 
#     echo "false"
#   fi
# }


function verifyParamEmpty() {
    if verifyParamExists $1; then
      false
    else
      true
    fi
}

function confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure?} [y/N]" RESPONSE
    case "$RESPONSE" in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}

function options() {
  # call options to be displayed
  read -r -p "Select an option < ${*} > :" RESPONSE
  for OPTION in "${@}"
  do
    if [ "$OPTION" = "$RESPONSE" ]; then
      echo "$OPTION"
    fi
  done
}
# $1 [string] search for directory 
# $2 [string] path
# return [string] return dir
function returnDirFoundInPath() {
  cd $(echo $2);
  local dirs=(*/)
  for ((i = 0; i < ${#dirs[@]}; i++))
    do
      if areMatches "${dirs[$i]}" "$1/"; then
        echo "${dirs[$i]}"
      fi
  done
  echo ""
  cd -
}

function selectNumber() {
  echo {1.."$(($#))"}
    # call options to be displayed
  # read -r -p "Select an option < ${*} > :" RESPONSE
  # for OPTION in "${@}"
  # do

  #   if [ "$OPTION" = "$RESPONSE" ]; then
  #     echo "$OPTION"
  #   fi
  # done 
}

function detectDirectoryChange() {
  if [ "$PWD" != "$MYOLDPWD" ]; then
    MYOLDPWD="$PWD";
    echo "new directory"
    # strut yer stuff here..
  fi
}

export PROMPT_COMMAND=detectDirectoryChange