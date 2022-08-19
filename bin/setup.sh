#!/usr/bin/env bash

#1- gh auth
is_gh_installed() {
    check=$(gh --version)
    pattern='\<gh version\>'
    if [[ $check =~ $pattern ]]
    then return 1
    fi
    return 0
}

gh_setup(){
    #check if gh is installed
    is_gh_installed
    if [[ $? -eq 1 ]]
    then 
    gum input --cursor.foreground "#FF0" --prompt.foreground "#0FF" --prompt "Github TOKEN: " --width 80 --placeholder "get it from github" > ~/.gh_token
    gh auth login --with-token < ~/.gh_token
    echo "gh_installed=true" >> ~/.gite_config
    echo ':green_circle: gh auth has been setup'| gum format -t emoji
    else
    echo ':yellow_circle: Install github cli to do the setup'| gum format -t emoji
    fi
    
}



#2- gpg key
is_gpg_installed(){
    value=$(gpg --version)
    patt='\<(GnuPG)\>'
    if [[ $value =~ $patt ]]
    then return 1
    fi
    return 0
}

gpg_setup(){
    is_gpg_installed
    if [[ $? -eq 1 ]]
    then 
    gum confirm "Do you want to setup GPG key?" && \
    KEY=$(gum input --cursor.foreground "#FF0" --prompt.foreground "#0FF" --prompt "GPG KEY: " --width 80 --placeholder "Key?") \
    && echo "gpg_auth=true" >> ~/.gite_config \
    && git config --global user.signingkey $KEY \
    && echo ':green_circle: GPG Key has been setup'|gum format -t emoji || echo ":red_circle: GPG key not installed as you choose" | gum format -t emoji
    else
    echo ':yellow_circle: Install gpg and follow the docs'| gum format -t emoji
    fi
}

#3- some aliases --not done

main(){
    gh_setup
    gpg_setup
    echo ':green_circle: now you can use any feature in gite'| gum format -t emoji

}
main