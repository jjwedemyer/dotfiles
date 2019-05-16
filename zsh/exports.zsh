# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl'
fi

export CHEATCOLORS=true


export PATH="/usr/local/sbin:$PATH"

# term colors
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh


export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
