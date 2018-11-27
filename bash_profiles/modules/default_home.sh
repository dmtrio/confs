
# NVM node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

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