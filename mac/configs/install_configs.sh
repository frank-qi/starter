#!/bin/bash
# Makes script independent of where you execute it from
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

## Configs ##
#############

## ~/.inputrc #
# Silence/mute errors
# Continues execution if ~/.inputrc is not found
rm ~/.inputrc 2> /dev/null || true
cp $parent_path/.inputrc ~/.inputrc

## ~/.gitconfig #
rm ~/.gitconfig 2> /dev/null || true
cp $parent_path/.gitconfig ~/.gitconfig

## ~/Library/Colors/solarized.clr #
rm ~/Library/Colors/solarized.clr 2> /dev/null || true
cp $parent_path/solarized.clr ~/Library/Colors/solarized.clr
