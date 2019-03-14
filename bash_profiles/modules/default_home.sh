
# NVM node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# directories, builds, and other shortcuts to run git projects go here
function dev() {
  local GITPROJECTSPATH="~/git"

  case "$1" in
    bluekeep)
      cd $GITPROJECTSPATH/bluekeep
        ;;
    WORK)
        . $importBashModules/default_work.sh
        ;; 
    *) 
        PROFILE="NO"
        ;;
esac  

}
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/deme/google-cloud-sdk/path.bash.inc' ]; then . '/Users/deme/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/deme/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/deme/google-cloud-sdk/completion.bash.inc'; fi
