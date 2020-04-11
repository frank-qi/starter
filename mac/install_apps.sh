#!/bin/bash

## Methods ##
#############

# $1 is the name of the brew cask application
install() {
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
if ! hash brew 2>/dev/null; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

install google-chrome
install visual-studio-code
install zoomus
install webex-meetings
install discord
install rider
install datagrip
install xmind-zen
install iterm2
