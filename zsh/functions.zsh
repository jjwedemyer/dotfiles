cd() { builtin cd "$@"; print -D $PWD; la }

gccopt() {
  y=${1%.*}
  gcc -Wall -std=c11 $1 -o $y
}
