# get script dir
# source the file for that.
source $HOME/.DOT_DIR


source $DOT_DIR/zsh/exports.zsh
source $DOT_DIR/zsh/antigen_conf.zsh
source $DOT_DIR/zsh/aliases.zsh
source $DOT_DIR/zsh/functions.zsh

ssh-add -A

autoload zmv


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
