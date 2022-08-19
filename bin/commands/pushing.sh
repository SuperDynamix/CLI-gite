
cur_dir=$(pwd)
log=~/push_err.log
source ~/.gite_config

push(){
    #inputs
    commit=$(gum input --prompt.foreground "#f52" --prompt "Write your: " --placeholder "commit")
    branch=$(ls $cur_dir/.git/refs/heads | gum filter --placeholder "Which branch you want to push from")
    remote=$(git remote | gum filter --placeholder "select the remote")

    #operations
    git checkout $branch > /dev/null
    git add -A && gum spin --spinner jump --title.foreground "#f52" --title "Adding all files to the stage" sleep 1
    echo ':ghost: Files added to the Stage '|gum format -t emoji
    if [[ $gpg_auth == "true" ]]
    then git commit -S -m "${commit}" > /dev/null
    echo ':alien: Commiting using GPG signature '|gum format -t emoji
    else git commit -m "${commit}" >/dev/null
    echo ':clown_face: Commiting without using GPG signature !'|gum format -t emoji
fi
  
  git push $remote $branch 2>> ~/push_err.log
  
if [ -s "$log" ]
  then psh=$(node $DIR/regex.cjs)
  if [ "$psh" == "fetch" ]
  then
  gum confirm "There's a new updates on the repo to fetch, do you want to fetch them?" && fetch_push $remote $branch
  else rm ~/push_err.log
  echo "Nothing to be pulled, we pushed your work :dart:"|gum format -t emoji
fi
else
echo "Nothing to be pulled, we pushed your work :dart:"|gum format -t emoji
fi
}

fetch_push(){
  git pull $1 $2 > /dev/null
  gum spin --spinner jump --title.foreground "#f52" --title "Fetching the new Files" sleep 1
  git push $1 $2 > /dev/null
  rm ~/push_err.log
  gum spin --spinner jump --title.foreground "#f52" --title "Pushing the files to the repo" sleep 1
  echo "We made it yaaaay:tada:"|gum format -t emoji

}