# This to init repo base
# make dir then init git
# add a remote for this git
#!/usr/bin/env bash
initrepo() {
    echo -e -n "${GREEN}Directory name for this repo: ${COLOR}"
    read name
    if [ -d "$name" ]
    then
        echo -e -n "${RED}The directory exists, ${GREEN}Do you want to init git for this directory? $name Y/N:"
        read irt
        if [ "$irt" == "y" ] || [ "$irt" == "Y" ] || [ -z "$irt" ]
        then
        cd $name
        git init > /dev/null
        remoteFlow
        fi
    else
    mkdir $name
    echo -e -n "${GREEN}Do you want to init git for this repo? Y/N: "
    read state
    if [ "$state" == "y" ]  || [ "$state" == "Y" ] || [ -z "$state" ]
        then
        cd $name
        git init > /dev/null
        remoteFlow
    fi
fi
    }

remoteFlow(){
 echo -e -n "${GREEN}What's the repo's remote? (ignore if none exist): $COLOR"
 read remote
 
 if [ ! -z $remote ]
    then
    echo -e -n "${GREEN}What's the alias for this remote (defualt: origin): $COLOR"
    read als 
    if [ ! -z $als ]
    then git remote add $als $remote > /dev/null
    else git remote add origin $remote > /dev/null
fi
    echo -e "${YELLOW}Remote established within the directory"
 else
    echo -e "${YELLOW}Directory is created with init git use code . to open VSCode"
fi
}
