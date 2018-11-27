# aliases

alias bp='nano ~/.bash_profile'

# nginx
alias ngre='sudo brew services restart nginx'
alias ngs='sudo brew services stop nginx'
alias ngconf='code /usr/local/etc/nginx/nginx.conf'

# app shortcuts
function chrome() {
  open -na "Google Chrome" --args "$1" $2
}

function google() {
  echo "Googling.... looking for $@";
  chrome "http://www.google.com/search?q=$*";
}

# Add Visual Studio Code (code)
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

# git
# alias repo=$(basename `git rev-parse --show-toplevel`)

