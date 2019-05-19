#!/bin/sh
echo "do you have setup git and ssh keys for github?!?!?"
sleep 30

# get the packagemanager for the system
un=$(uname)
if [ un = 'Darwin' ]; then
	xcode-select --install
	if [ ! -x brew ]; then
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		brew install zsh
	fi
	if [ -x zsh ]; then
		sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh
	fi
else if [ un = 'Linux' ]; then
	echo "For now I assume you have zsh installed already"
fi

git clone 
