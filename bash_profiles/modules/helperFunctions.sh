
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

function confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure?} [y/N]" response
    case "$response" in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}