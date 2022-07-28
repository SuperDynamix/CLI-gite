#!/usr/bin/env bash

#chmod +x install.sh
source bin/config.sh


echo -e "${GREEN}Installing CLI Gite..."
echo -e -n "${GREEN}Do you want to use GPG KEY settings? (Y/N): "
read st

if [ "$st" == "y" ] || [ "$st" == "Y"] || [ -z $st ]
then 
    echo -e "${GREEN}Read the Gite documantion about GPG KEY"
    echo -e -n "${GREEN}What's your GPG KEY: "
    read KEY
    git config --global user.signingkey $KEY
    echo -e "${YELLOW} Your GPG key is applied to git"
    
    else

fi

setup(){

}