#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $DIR/commands/initrepo.sh
source $DIR/commands/pushing.sh
source $DIR/commands/checkout.sh


export GUM_INPUT_CURSOR_FOREGROUND="#F7B511"
case $1 in
    su)
    $DIR/setup.sh
;;
    repo)
        main_repo $2
;;
    push|-p)
      push
;;
    log)
    cat ~/$2
;;
    checkout)
    checkout 
;;
    version|-v)
    echo $(node $DIR/version.cjs)
;;
    *)
    echo -e "💻 Gite is the right hand for most develpers.
Read the doc on https://github.com/Mahmoudgalalz/CLI-egit"
;;
esac