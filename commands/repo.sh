
initrepo(){
    
    if [ [mkdir $name] -eq -1 ]
    then 
    echo -e "${RED}The directory exist, try to remove the directory use rmdir -f $name"
    else
    
    if [ "$state" == "y" ]  || [ "$state" == "Y" ] || [ -z "$state" ]
    then
        state=true
    else
        state=false
    fi

    echo -e -n "${GREEN}What's the repo's remote? (ignore if none exist): $COLOR"
    read remote
    if [ ! -z "$remote" ]
    then
        echo -e -n "${GREEN}What's the alias for this remote (defualt: origin): $COLOR"
        read als    
    fi
    excinitrepo $state $remote $als
    fi
}
excinitrepo(){

    if [ $1==true ]
        then 
        git init > /dev/null
    fi
    if [ ! -z $2 ]
        then
        if [ ! -z $3 ]
        then 
            git remote add $3 $2 > /dev/null
        else
            git remote add origin $2 > /dev/null
        fi
        
        echo -e "${YELLOW}Remote established within the directory"
    else
        echo -e "${YELLOW}Directory is created with init git use code . to open VSCode"
    fi  

}