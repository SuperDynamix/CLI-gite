# error handling for git fetch problem
# basic pushing
# short-hand push
#interactive selection for branches and remotes
push(){
    # The process 
    #1- add all (git add -A)
    #2- commit there's two options
    # - With GPG users so use (git commit -S -m "the commit")
    # - without GPG (git commit -m "")
    #3- pushing to spcifiac branch with spcifaic remote
    echo -ne "${YELLOW}write your commit: ${COLOR}"
    read commit
    echo -ne "${YELLOW}which branch you want to push from: ${COLOR}"
    read branch
    echo -ne "${YELLOW}which remote you want to push to: ${COLOR}"
    read remote
    #make sure you are in the branch you want to push
    git checkout $branch > /dev/null
    git add -A
    echo -e "${GREEN}Added all file that been modified..${COLOR}"
  if [ $GPG_STATE == true ]
  then git commit -S -m "${commit}" > /dev/null
  echo -e "${GREEN}Committing using GPG signature${COLOR}"
  else git commit -m "${commit}" >/dev/null
  echo -e "${YELLOW}Committing without using GPG KEY, to apply it read the doc and do reinstall to the CLI${COLOR}"
fi

  git push $remote $branch 2>$DIR/logs/push_err.log

if [ -f "$DIR/logs/push_err.log" ]
  then psh=$(node $DIR/regex.ts)
  if [ "$psh" == "fetch" ]
  then echo -ne "${RED}There's a new updates on the repo to fetch, do    you want to fetch them before pushing? (Y/N)${COLOR}"
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
fi
}

fetch_push(){
 git pull $1 $2
  git push $1 $2
rm $DIR/logs/push_err.log
echo "${GREEN}Fetching the new files, and pushing!${COLOR}"
}