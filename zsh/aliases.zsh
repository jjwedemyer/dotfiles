alias gits="git status"

alias ls="exa"
alias ll="exa -l"
alias la="exa -al"

alias vim="nvim"

alias cat="bat"

alias t='tail -f'

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

if [ $(uname) = 'Darwin' ]; then
	alias -g COPY="| pbcopy"
fi

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias ffd='find . -type d -name'
alias ff='find . -type f -name'

alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
