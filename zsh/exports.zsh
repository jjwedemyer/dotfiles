export EDITOR='vim'
export CHEATCOLORS=true


export PATH="/usr/local/sbin:$PATH"

# Cargo bin
export PATH="$HOME/.cargo/bin:$PATH"


# term colors
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

if [[ -x jenv ]]; then
	export PATH="$HOME/.jenv/bin:$PATH"
	eval "$(jenv init -)"
fi;
