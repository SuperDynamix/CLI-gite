#!/usr/bin/env bash
#define the machine and os and 

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $DIR/bin/config.sh

get_os(){
    case "$(uname -s)" in
    *linux* | *Linux*) echo "linux";;
    *drawin* | *Drawin*) echo "drawin";;
    esac
}

get_machine(){
    case "$(uname -m)" in
    "x86_64"|"amd64"|"x64") echo "amd64";;
    "i386"|"i86pc"|"x86"|"i686")
      echo "i386" ;;
    "arm64"|"armv6l"|"aarch64")
      echo "arm64";;
  esac
}



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