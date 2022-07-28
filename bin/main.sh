#!/usr/bin/env bash

source commands/initrepo.sh
source config.sh
chmod +x ./main.sh
# GPG settings 
#setup the CLI
#

case $1 in
    repo)
        initrepo
    ;;
    push|-p)
    echo -e "${GREEN}push${COLOR}"
    ;;

esac