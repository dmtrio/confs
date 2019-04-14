
# NVM node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm use node

# JEnv Java version manager
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Yarn 
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/deme/google-cloud-sdk/path.bash.inc' ]; then . '/Users/deme/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/deme/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/deme/google-cloud-sdk/completion.bash.inc'; fi

# directories, builds, and other shortcuts to run git projects go here
function dev() {
  local GITPROJECTSPATH="~/git"

  case "$1" in
    bluekeep)
      cd "$GITPROJECTSPATH/bluekeep/"
      ;;
    toyproblems)
      cd "$GITPROJECTSPATH/toyProblems/"
      ;; 
  esac  
}
