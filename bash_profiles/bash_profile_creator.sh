# import this file in local bash_profile and define the $confs variable
# EX:
# OVERRIDE=$1
# confs=~/git/confs
# . $confs/bash_profiles/bash_profile_creator.sh "HOME" $OVERRIDE


importBashModules=$confs/bash_profiles/modules

# if ! areMatches $3 "RELOAD"; then
#   cd $confs
#   git stash
#   git pull --rebase
#   git stash pop
#   cd -
# fi

# defualt configs
. $importBashModules/helper_func.sh
. $importBashModules/default.sh
. $importBashModules/aliases.sh
. $importBashModules/git_branch.sh
. $importBashModules/extend_git.sh
# needs to be at the end so all functions are loaded
. $importBashModules/param_expansions.sh


# Set the PROFILE to OVERRIDE or first var
if verifyParamExists "$2"; then
  PROFILE=$(toUpperCase $2)
elif verifyParamExists "$1"; then
  PROFILE=$(toUpperCase $1)
fi

function printProfileName() {
  echo "$PROFILE PROFILE LOADED"
  echo "$PATH"
}

# profile specific comps
case "$PROFILE" in
  HOME)
    . $importBashModules/default_home.sh
    ;;
  WORK)
    . $importBashModules/default_work.sh
    ;; 
  *) 
    PROFILE="NO"
    ;;
esac

printProfileName
