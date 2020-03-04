# get script dir
SCRIPT_DIR=${0:A:h}

source $SCRIPT_DIR/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOF
	git
	colorize
	ssh-agent
	wd
	tmux
	fzf
	z
	nmap
	ripgrep
	sublime
	cargo

	rust
	cargo

	helm
	kubectl

	zsh-users/zsh-autosuggestions
	zsh-users/zsh-completions
	zsh-users/zsh-syntax-highlighting

	alexrochas/zsh-vim-crtl-z
	rupa/z

	jenv
EOF

antigen bundle nojhan/liquidprompt

antigen apply
