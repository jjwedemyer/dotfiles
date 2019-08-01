# get script dir
DOT_DIR=${0:A:h}


source $DOT_DIR/zsh/exports.zsh
source $DOT_DIR/zsh/antigen_conf.zsh
source $DOT_DIR/zsh/aliases.zsh
source $DOT_DIR/zsh/functions.zsh


autoload zmv


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
