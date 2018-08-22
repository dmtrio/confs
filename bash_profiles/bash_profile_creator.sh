# import this file in local bash_profile and define the $confs variable
# EX:
# OVERRIDE=$1
# confs=~/git/confs
# . $confs/bash_profiles/bash_profile_creator.sh "HOME" $OVERRIDE


importBashModules=$confs/bash_profiles/modules

# defualt configs
. $importBashModules/helper_func.sh
. $importBashModules/defaults.sh
. $importBashModules/aliases.sh
. $importBashModules/git_branch.sh
. $importBashModules/extend_git.sh


# Set the PROFILE to OVERRIDE or first var
if verifyParamExists "$2"; then
    PROFILE=$(toUpperCase $2)
elif verifyParamExists "$1"; then
    PROFILE=$(toUpperCase $1)
fi

function profileName() {
    echo "$PROFILE PROFILE LOADED"
}

# profile specific comps
if [ $PROFILE = "WORK" ]; then
    # import work specific bash files here
    . $importBashModules/default_work.sh
    profileName
fi

if [ $PROFILE = "HOME" ]; then
    # import home specific bash files here
    . $importBashModules/default_home.sh
    profileName
fi
