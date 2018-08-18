# import this file in local bash_profile and define the $confs variable
# EX:
# OVERRIDE=$1
# confs=~/git/confs
# . $confs/bash_profiles/bash_profile_creator.sh "HOME" $OVERRIDE


importBashModules=$confs/bash_profiles/modules

# defualt configs
. $importBashModules/defaultConfs.sh
. $importBashModules/helperFunctions.sh
. $importBashModules/aliases.sh
. $importBashModules/git_branch.sh


# Set the PROFILE to OVERRIDE or first var
if [ ! -z "$2" ]; then
    PROFILE=$(toUpperCase $2)
elif [ ! -z "$1" ]; then
    PROFILE=$(toUpperCase $1)
fi

# profile specific comps
if [ $PROFILE = "WORK" ]; then
    # import work specific bash files here
    profileName
    . $importBashModules/defaultWork.sh
fi

if [ $PROFILE = "HOME" ]; then
    # import home specific bash files here
    profileName
fi

function profileName() {
    echo "$PROFILE PROFILE LOADED"
}
