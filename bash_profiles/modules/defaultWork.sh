
# [[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

eval "$(rbenv init -)"

eval "$(nodenv init -)"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
