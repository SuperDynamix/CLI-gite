# error handling for git fetch problem
# basic pushing
# short-hand push
#interactive selection for branches and remotes
cur_dir=$(pwd)
push(){
    # The process 
    #1- add all (git add -A)
    #2- commit there's two options
    # - With GPG users so use (git commit -S -m "the commit")
    # - without GPG (git commit -m "")
    #3- pushing to spcifiac branch with spcifaic remote
    
    #inputs
    commit=$(gum input --prompt.foreground "#f52" --prompt "Write your: " --placeholder "commit")
    branch=$(ls $cur_dir/.git/refs/heads | gum filter --placeholder "Which branch you want to push from")
    remote=$(git remote | gum filter --placeholder "select the remote")

    #operations
    git checkout $branch > /dev/null
    git add -A && gum spin --spinner jump --title.foreground "#f52" --title "Adding all files to the stage" sleep 1
    echo ':ghost: Files added to the Stage '|gum format -t emoji
    if [ -e $DIR/.gpg ]
    then git commit -S -m "${commit}" > /dev/null
    echo ':alien: Commiting using GPG signature '|gum format -t emoji
    else git commit -m "${commit}" >/dev/null
    echo ':clown_face: Commiting without using GPG signature !'|gum format -t emoji
fi

  git push $remote $branch 2> ~/push_err.log


if [ -s "~/push_err.log" ]
  then psh=$(node $DIR/regex.cjs)
  if [ "$psh" == "fetch" ]

  then echo -ne "${RED}There's a new updates on the repo to fetch, do you want to fetch them before pushing? (Y/N)${COLOR}"

  read fr
#
  if [ [ "$fr" == "y" ] || [ "$fr" == "Y" ] || [ -z "$fr" ] ]
  then fetch_push $remote $branch
  else
  echo "Files added to the flow with your commit."
  fi
#
else echo -e "There's an error happend check the log, use gite log push_err.log"
fi
else echo -e "${GREEN}all files pushed to the $branch branch..!${COLOR}"
fi
}

fetch_push(){
 git pull $1 $2
  git push $1 $2
rm $DIR/logs/push_err.log
echo "${GREEN}Fetching the new files, and pushing!${COLOR}"
}