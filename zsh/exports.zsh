export EDITOR='vim'
#export CHEATCOLORS=true


export PATH="/usr/local/sbin:$PATH"

# Cargo bin
export PATH="$HOME/.cargo/bin:$PATH"

#making gpg work
export GPG_TTY=$(tty)

# term colors
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"

# Locale Settings
LANG="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_ALL="en_US.UTF-8"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

if [[ -x jenv ]]; then
	export PATH="$HOME/.jenv/bin:$PATH"
	eval "$(jenv init -)"
fi;
