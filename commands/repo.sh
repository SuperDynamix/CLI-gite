# This to init repo base
# make dir then init git
# add a remote for this git

initrepo(){
    echo -e -n "${GREEN}Directory name for this repo: ${COLOR}"
    read name
    echo -e -n "${GREEN}Do you want to init git for this repo? Y/N: "
    read state
    if [ "$state" == "y" ]  || [ "$state" == "Y" ] || [ -z "$state" ]
    then
        state=true
    else
        state=false
    fi

    echo -e -n "${GREEN}What's the repo's remote? (ignore if none exist):$COLOR"
    read remote
    if [ ! -z "$remote" ]
    then
        echo -e -n "${GREEN}What's the Alias for this remote (defualt: origin)$COLOR"
        read als    
    fi
    excinitrepo $name $state $remote $als
}
excinitrepo(){
    mkdir $1
    cd $1
    if [ $2==true ]
        then 
        git init > /dev/null
    fi
    if [ ! -z $3]
        then
        git remote add if [! -z $4 ] then $4 else origin fi 
    fi
    echo -e "${YELLOW}Directory is created with init git use code . to open VSCode"
}