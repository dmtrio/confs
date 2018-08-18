
function toUpperCase() {
    echo "$1" | tr '[:lower:]' '[:upper:]'
} 

function toLowerCase() {
    echo "$1" | tr '[:upper:]' '[:lower:]'
} 