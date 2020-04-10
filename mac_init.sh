#!/bin/bash

# Apps #

# $1 is the name of the application
# $2 is the command to run to install
# POSIX use command -v <the_command>
# Bash specific environments use hash <the_command> or type <the_command> to check builtin commands
install() {
	if ! hash $1 2>/dev/null; then
		eval $2
	fi
}

## Homebrew
echo '\n' | install brew '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"'

## Homebrew Cask
#echo '\n' | install brew '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"'


# Configs #

## ~/.inputrc #
# Silence/mute errors
# Continues execution if ~/.inputrc is not found
rm ~/.inputrc 2> /dev/null || true
cp .inputrc ~/.inputrc

## ~/.bashrc #
rm ~/.inputrc 2> /dev/null || true
cp .gitconfig ~/.gitconfig
