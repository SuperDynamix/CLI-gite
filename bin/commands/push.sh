# error handling for git fetch problem
# basic pushing
# short-hand push

push(){
    # The process 
    #1- add all (git add -A)
    #2- commit there's two options
    # - With GPG users so use (git commit -S -m "the commit")
    # - without GPG (git commit -m "")
    #3- pushing to spcifiac branch with spcifaic remote
    read -r -p "${YELLOW}write your commit:${COLOR} " commit
    read -r -p "${YELLOW}Which branch do you want to make the push on: ${COLOR}" branch
    read -r -p "${YELLOW}Which remote do you want to push into: ${COLOR}" remote


}
 git push origin main > /dev/null

