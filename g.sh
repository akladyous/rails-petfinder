
function getall() {
    branch="$(git branch --show-current)"
    # echo "current branch is $branch"
    git add $1
    git commit -m "$2"
    git push origin $branch
}
