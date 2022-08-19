#checkout branches with lesting them

checkout(){
    cur_dir=$(pwd)
    branch=$(ls $cur_dir/.git/refs/heads | gum filter)
    git checkout $branch
}
