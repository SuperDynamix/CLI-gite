#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $DIR/bin/config.sh

gum confirm "Do you want to setup GPG key?" && KEY=$(gum input --placeholder "What's your GPG KEY")

if [ ! -z "$KEY" ]
then 
    GPGstate=true
    git config --global user.signingkey $KEY
    echo -e "${YELLOW}Your GPG key is applied to git"

else
    echo -e "${GREEN}GPG KEY options is not applied"
fi

echo "GPG_STATE=$GPGstate" > $DIR/bin/.gpg