#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source $DIR/bin/config.sh
GPGstate=false
echo -e ${YELLOW}"Do you want to setup GPG key?"${COLOR}



gum confirm "Do you want ti setup GPG key?" && KEY=$(gum input --placeholder "What's your GPG KEY")

if [ ! -z "$KEY" ]
then echo "Yes"
else
echo "no"
fi