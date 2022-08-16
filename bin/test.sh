log=~/push_err.log
if [[ -f "$log" ]]
  then psh=$(node regex.cjs)
  echo $psh
  if [[ "$psh" == "fetch" ]]
  then
  gum confirm "There's a new updates on the repo to fetch, do you want to fetch them?" && fetch_push $remote $branch
  else echo ":clown_face: There's an error happend check the log, use gite log push_err.log"|gum format -t emoji
fi
else echo "Nothing to be pulled, we pushed your work :dart:"|gum format -t emoji
fi 