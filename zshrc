# get script dir
# source the file for that.
source $HOME/.DOT_DIR


source $DOT_DIR/zsh/antigen_conf.zsh
source $DOT_DIR/zsh/exports.zsh
source $DOT_DIR/zsh/aliases.zsh
source $DOT_DIR/zsh/functions.zsh

setopt hist_ignore_dups

compdef g=git

if [ $(uname) = "Darwin" ]; then
  ssh-add -A
fi

autoload zmv

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey ^O forward-word
bindkey '^Z' fancy-ctrl-z
