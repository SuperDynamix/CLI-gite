#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $DIR/commands/initrepo.sh
source $DIR/commands/pushing.sh
source config.sh

# GPG settings 
#setup the CLI
#

case $1 in
    repo)
        initrepo
;;
    push|-p)
      push
;;
    log)
    cat logs/$2
;;
    version|-v)
    echo $(node $DIR/version.ts)
;;
    update)
    sudo npm i -g cli-gite
;;
    *)
    echo -e "💻 Gite is a sample CLI to make it very sample.
Read the doc on https://github.com/Mahmoudgalalz/CLI-egit
"
;;
esac