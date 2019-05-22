# cd() { builtin cd "$@"; print -D $PWD; la }

reload_config() { source $HOME/.zshrc }

gccopt() {
  y=${1%.*}
  gcc -Wall -std=c11 $1 -o $y
}
