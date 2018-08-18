#runs this after changing the profile to reflect changes instead of closing out and opening again. This is known as 'sourcing' the bash profile.
alias sbp='. ~/.bash_profile' 

function pullConfs() {
    cd $confs 
    git pull
    cd -
    sbp
}

function pushConfs() {
    cd $confs
    git add .
    git commit -m "$1"
    git push
    cd -
    sbp
}