source $HOME/.dotfiles/zsh/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOF
	git
	colorize
	ssh-agent
	wd
	command-not-found
	tmux
	common-aliases
	fzf
	z
	nmap

	zsh-users/zsh-autosuggestions
	zsh-users/zsh-completions
	zsh-users/zsh-syntax-highlighting

	alexrochas/zsh-vim-crtl-z
	rupa/z
EOF

antigen bundle nojhan/liquidprompt

antigen apply
