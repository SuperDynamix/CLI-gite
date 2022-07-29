#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $DIR/commands/initrepo.sh
source $DIR/config.sh

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
    *)
    echo -e "💻 Gite is a sample CLI to make it very sample.
Read the doc on https://github.com/Mahmoudgalalz/CLI-egit
"
;;
esac