# This function loads exports and other things based on the path
# you're in
# TODO: Expand this to search for each parent as well and load files from there too
# TODO: make it unset when you leave this directory or it's children.
cd() {
  builtin cd "$@"
  if [ -f $PWD/.exports ]
  then
    echo "loading ${PWD}/.exports"
    source $PWD/.exports
  fi
}

reload_config() { source $HOME/.zshrc }

gccopt() {
  y=${1%.*}
  gcc -Wall -std=c11 $1 -o $y
}

# Load .env file into shell session for environment variables

function envup() {
  if [ -f .env ]; then
    export $(sed '/^ *#/ d' .env)
  else
    echo 'No .env file found' 1>&2
    return 1
  fi
}

# No arguments: `git status`
# With arguments: acts like `git`
unalias g
g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status
  fi
}
compdef g=git

# Code found here: https://polothy.github.io/post/2019-08-19-fzf-git-checkout/
fzf-git-branch() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    git branch --color=always --all --sort=-committerdate |
        grep -v HEAD |
        fzf --height 50% --ansi --no-multi --preview-window right:65% \
            --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
        sed "s/.* //"
}

fzf-git-checkout() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    local branch

    branch=$(fzf-git-branch)
    if [[ "$branch" = "" ]]; then
        echo "No branch selected."
        return
    fi

    # If branch name starts with 'remotes/' then it is a remote branch. By
    # using --track and a remote branch name, it is the same as:
    # git checkout -b branchName --track origin/branchName
    if [[ "$branch" = 'remotes/'* ]]; then
        git checkout --track $branch
    else
        git checkout $branch;
    fi
}

# update dotfiles
update_dots() { (cd $HOME/.dotfiles; git fetch master)}
update_antigen() { (cd $HOME/.dotfiles; curl -L git.io/antigen > "zsh/antigen.zsh")}
