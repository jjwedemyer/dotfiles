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

# update dotfiles
update_dots() { (cd $HOME/.dotfiles; git fetch master)}
update_antigen() { (cd $HOME/.dotfiles; curl -L git.io/antigen > "zsh/antigen.zsh")}
