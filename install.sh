#!/bin/sh

# get the packagemanager for the system
un=$(uname)
if [ un = 'Darwin' ]; then
	xcode-select --install
	if [ ! -x brew ]; then
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		brew install zsh
		gem install colorls
	fi
	if [ -x zsh ]; then
		sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh
	fi
else if [ un = 'Linux' ]; then
	echo "For now I assume you have zsh installed already"
fi

ln -s $HOME/.dotfiles/zsh $HOME/.zsh
ln -s $HOME/.dotfiles/vim $HOME/.vim
ln -s $HOME/.dotfiles/vimrc $HOME/.vimrc
ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc

ln -s $HOME/.dotfiles/git/gitignore $HOME/.gitignore_global
ln -s $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig
