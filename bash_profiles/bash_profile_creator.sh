# import this file in local bash_profile and define the $confs variable
# EX:
# confs=~/git/confs
# . $confs/bash_profiles/bash_profile_creator.sh "home"

PROFILE=$1

# defualt configs
. $confs/bash_profiles/modules/defaultConfs.sh
. $confs/bash_profiles/modules/aliases.sh
. $confs/bash_profiles/modules/git_branch.sh


# profile specific comps
if [ $PROFILE = "work" ]
then
echo "work profile"
# import work specific bash files here
. $confs/bash_profiles/modules/defaultWork.sh
fi

if [ $PROFILE = "home" ]
then
echo "home profile"
# import home specific bash files here
fi


