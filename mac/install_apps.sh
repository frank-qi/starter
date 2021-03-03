#!/bin/bash

## Methods ##
#############
install_brew_app() {
	if ! command -v $1 2>/dev/null >&2 ; then
		brew install $1
	fi
}

# $1 is the name of the brew cask application
install_cask_app() {
	if ! brew cask list $1 2>/dev/null >&2 ; then
		brew cask install $1
	fi
}

## Applications ##
##################

## Homebrew
# Check if brew is already installed
# POSIX use command -v <the_command>
# Bash specific environments use hash <the_command> or type <the_command> to check builtin commands
if ! command -v brew 2>/dev/null; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

if ! command -v python3 2>/dev/null; then
	install_brew_app python3
fi

install_brew_app zsh
## OhMyZsh ##
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
## Powerline Fonts ##
git clone https://github.com/powerline/fonts.git --depth=1
bash fonts/install.sh
rm -rf fonts
## Powerlevel10k Zsh Theme ##
brew install romkatv/powerlevel10k/powerlevel10k
brew install zsh-syntax-highlighting
echo "source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

install_cask_app datagrip
install_cask_app discord
install_cask_app google-chrome
install_cask_app google-backup-and-sync
install_cask_app iterm2
install_cask_app rider
install_cask_app slack
install_cask_app visual-studio-code
install_cask_app webex-meetings
install_cask_app xmind-zen
install_cask_app zoomus

