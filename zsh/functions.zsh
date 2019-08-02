# cd() { builtin cd "$@"; print -D $PWD; la }

reload_config() { source $HOME/.zshrc }

gccopt() {
  y=${1%.*}
  gcc -Wall -std=c11 $1 -o $y
}

# update dotfiles
update_dots() { (cd $HOME/.dotfiles; git fetch master)}
update_antigen() { (cd $HOME/.dotfiles; curl -L git.io/antigen > "zsh/antigen.zsh")}
