#!/bin/bash
# Makes script independent of where you execute it from
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

if hash zsh 2>/dev/null || true; then
	chsh -s /bin/zsh
else
	echo "zsh is not installed!"
fi

## OhMyZsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Powerline Fonts
git clone https://github.com/powerline/fonts.git --depth=1
bash fonts/install.sh
rm -rf fonts

## Powerlevel9k OhMyZsh Theme
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
sed -i '' 's|^ZSH_THEME.*$|ZSH_THEME="powerlevel9k/powerlevel9k"|g' ~/.zshrc

## OhMyZsh Plugins
sed -i '' 's|^plugins.*$|plugins=(git vi-mode)|g' ~/.zshrc

## Configs ##
#############

## ~/.zshrc #
# Silence/mute errors
# Continues execution if ~/.inputrc is not found
rm ~/.zshrc 2> /dev/null || true
cp $parent_path/mac/configs/.zshrc ~/.zshrc

## ~/.inputrc #
rm ~/.inputrc 2> /dev/null || true
cp $parent_path/mac/configs/.inputrc ~/.inputrc

## ~/.gitconfig #
rm ~/.gitconfig 2> /dev/null || true
cp $parent_path/mac/configs/.gitconfig ~/.gitconfig

## ~/Library/Colors/solarized.clr #
rm ~/Library/Colors/solarized.clr 2> /dev/null || true
cp $parent_path/mac/configs/solarized.clr ~/Library/Colors/solarized.clr
