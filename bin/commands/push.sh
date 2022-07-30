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
    git add -A
    echo -e -n "${YELLOW} Added all modified files"
}