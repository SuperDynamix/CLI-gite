
#!/usr/bin/env bash
source ~/.gite_config
initrepo() {
    if [[ $1 == "--push" || $1 == "-p" ]]
then 
    echo "You should be in the dirctory you want to push it (Ctrl + c) if you want to exit"
    name=$(gum input --prompt.foreground "#F52" --prompt "Repo's name? " --placeholder "gite")
    als=$(gum input --prompt.foreground "#F52" --prompt "Remote's alias " --placeholder "origin")
    gh repo create $name --public --source=. --remote=$als --push
else
    name=$(gum input --prompt.foreground "#0FF" --prompt "Repo name, Dirctory name: " --placeholder "CLI-gite" )
    if [ -d "$name" ]
    then
        gum confirm "This directory exists, Do you want to init git for this directory" && cd $name && git init >/dev/null \
        || echo "git init didn't work"
    else
    mkdir $name && cd $name
    git init >/dev/null
    fi
    gum confirm "Do you want to create a repo on your github account?" && als=$(gum input --prompt.foreground "#0FF" --prompt "Remote's alias:" --placeholder "origin") && gh repo create $name --public --source=. --remote=$als \
    && gum spin --spinner jump --title.foreground "#f52" --title "Creating your repo..." sleep 1 \
    && echo $(git remote -v) || echo ':red_circle: cannot create a repo on github'|gum format -t emoji

fi

}
main_repo(){
    if [[ $gh_installed == "true" ]]
    then initrepo
    else echo ":red_circle: cannot run this command, you need to install github cli, or do the gite setup if you already have the gh cli" | gum format -t emoji
    fi
}