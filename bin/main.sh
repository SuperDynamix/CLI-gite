#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $DIR/commands/initrepo.sh
source $DIR/commands/pushing.sh
source $DIR/config.sh

# GPG settings 
#setup the CLI
#

case $1 in
    setup)
    $DIR/../install.sh
    ;;
    repo)
        initrepo
;;
    push|-p)
      push
;;
    log)
    cat ~/$2
;;
    version|-v)
    echo $(node $DIR/version.cjs)
;;
    test)
    echo $(node $DIR/regex.cjs)
;;
    *)
    echo -e "💻 Gite is the right hand for most develpers.
Read the doc on https://github.com/Mahmoudgalalz/CLI-egit"
;;
esac