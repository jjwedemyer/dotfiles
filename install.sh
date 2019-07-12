#!/bin/bash
# this script accepts a parameter for the homedirectory of the dotfiles if that is not set,
# it will automatically set it to $HOME/.dotfiles
dot_dir=${1:-"$HOME/.dotfiles"}
un=$(uname)

link_conf () {
	ln -s ${dot_dir}/${1} ${HOME}/.${1}
}

version () { echo "$@" | awk -F. '{ printf("%d%03d%03d%03d\n", $1,$2,$3,$4); }'; }

if hash git 2>/dev/null; then
	git_version=$(git --version | cut -f 3 -d" ")
	
	if [ $(version ${git_version}) -lt $(version "1.8.0") ]; then
		cat  <<-EOL 
			ERROR: your git install is earlier than version 1.8.0 which means antigen isn't going to work here
			it also means your system is fucking old... you should prolly upgrade at least your utilities.
			Please install git later than version 1.8.0"
		EOL
		exit 1;
	fi
fi

# clone the repo, assuming you have setup you keys
git clone git@github.com:jjwedemyer/dotfiles.git

# get the packagemanager for the system
if [ $un = "Darwin" ]; then
	if [ $(xcode-select -p 1>/dev/null;echo $?) -gt 0 ]; then
		xcode-select --install
	fi
	if ! hash brew 2>/dev/null; then
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi

	brew install zsh

# install colorls for nice listings
#	if hash gem 2>/dev/null; then
#		gem install colorls
#	fi

# link hammerspoon files on macOS
#	link_conf hammerspoon

elif [ $un = "Linux" ]; then
	echo "For now I assume you have zsh installed already"
fi
# set zsh as your main shell
if hash zsh 2>/dev/null; then
	sudo -s "echo $(which zsh) >> /etc/shells" && chsh -s $(which zsh)
fi

curl -L git.io/antigen > "${dot_dir}/zsh/antigen.zsh"

link_conf zsh
link_conf vim
link_conf vimrc
link_conf zshrc

link_conf git

zsh && vim +PluginInstall +qall
