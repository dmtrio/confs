# aliases

# bash
# alias sbp='. ~/.bash_profile'
alias bp='code ~/.bash_profile'
alias bpconf='code $confs'

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

# git
# alias repo=$(basename `git rev-parse --show-toplevel`)

