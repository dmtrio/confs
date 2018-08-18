# import this file in local bash_profile and define the $confs variable
# EX:
# OVERRIDE=$1
# confs=~/git/confs
# . $confs/bash_profiles/bash_profile_creator.sh "HOME" $OVERRIDE


PROFILE="DEFAULT"
import=$confs/bash_profiles/modules

# defualt configs
. $import/defaultConfs.sh
. $import/helperFunctions.sh
. $import/aliases.sh
. $import/git_branch.sh


# Set the PROFILE to OVERRIDE or first var
if [ ! -z "$2" ]; then
    PROFILE=$(toUpperCase $2)
elif [ ! -z "$1" ]; then
    PROFILE=$(toUpperCase $1)
fi

# profile specific comps
if [ $PROFILE = "WORK" ]; then
    echo "$PROFILE PROFILE LOADED"
    # import work specific bash files here
    . $import/defaultWork.sh
fi

if [ $PROFILE = "HOME" ]; then
    echo "$PROFILE PROFILE LOADED"
    # import home specific bash files here
fi


