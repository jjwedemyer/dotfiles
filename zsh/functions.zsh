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
g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status
  fi
}

# update dotfiles
update_dots() { (cd $HOME/.dotfiles; git fetch master)}
update_antigen() { (cd $HOME/.dotfiles; curl -L git.io/antigen > "zsh/antigen.zsh")}
