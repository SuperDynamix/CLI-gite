#!/usr/bin/env bash


DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source $DIR/bin/config.sh
GPGstate=false
setup(){
#via NPM package
#usr/local/node_module/${packageName}/bin/main.sh
    echo "#Aliases for Gite command line utility - Do not delete if you still use Gite" >> ~/.bash_aliases
    echo "alias gite='. ~/../../usr/local/lib/node_modules/cli-gite/bin/main.sh'" >> ~/.bash_aliases
    echo "alias Gite='. ~/../../usr/local/lib/node_modules/cli-gite/bin/main.sh'" >> ~/.bash_aliases
    echo -e "Every things is done👌, Try Gite on your terminal"
    #. ~/../../usr/local/lib/node_modules/cli-gite && ./install.sh
}

echo -e "${GREEN}Installing CLI Gite..."
echo -e -n "${GREEN}Do you want to use GPG KEY settings? (Y/N): "
read st

if [ "$st" == "y" ] || [ "$st" == "Y" ] || [ -z $st ] 
then 
    GPGstate=true
    echo -e "${GREEN}Read the Gite documantion about GPG KEY"
    echo -e -n "${GREEN}What's your GPG KEY: "
    read KEY
    git config --global user.signingkey $KEY
    echo -e "${YELLOW}Your GPG key is applied to git"
    setup
    
    else
    echo -e "${GREEN}GPG KEY options is not applied"

    setup

fi
echo "GPG_STATE=$GPGstate" >> $DIR/bin/.gpg
