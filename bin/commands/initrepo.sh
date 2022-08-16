# This to init repo base
# make dir then init git
# add a remote for this git
# Github CLI also init
#!/usr/bin/env bash

initrepo() {
    name=$(gum input --prompt.foreground "#0FF" --prompt "Directory name for this repo?: ")

    if [ -d "$name" ]
    then
        gum confirm "This directory exists, Do you want to init git for this directory" && cd $name && git init >/dev/null && remoteFlow
    else
    mkdir $name
    cd $name
    git init >/dev/null
    remoteFlow
fi
    }
remoteFlow(){
    remote=$(gum input --prompt.foreground "#0FF" --prompt "Repo's link (remote): ")
    als=$(gum input --prompt.foreground "#0FF" --prompt "Alias: ")
 if [ ! -z "$remote" ]
    then
    git remote add $als $remote > /dev/null
    gum spin --spinner jump --title.foreground "#f52" --title "establishing the directory within the remote" sleep 1
    echo ':monkey: Everything done!'|gum format -t emoji
 else
    echo -e "${RED}no remote setup for this directory"
fi

}
