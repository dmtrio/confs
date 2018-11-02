
function toUpperCase() {
    echo "$1" | tr '[:lower:]' '[:upper:]'
} 

function toLowerCase() {
    echo "$1" | tr '[:upper:]' '[:lower:]'
} 

function verifyParamExists() {
  if [ ! -z "$1" ]; then
    true
  else 
    false
  fi
}

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