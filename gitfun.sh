function gitinit() {
    git init
    git add .
    git commit -m "$1"
    git branch -M main
    git remote add origin $2
    git push -u origin main
}

function gitcommit() {
    git add .
    git commit -m "$1"
}

function gitpush() {
    git add .
    git commit -m "$1"
    git push origin main
}
