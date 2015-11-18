#!/bin/sh
#
# Copies all my dotfiles into my home directory

path=`dirname $0`

ln -s ~/scripts/.bash_aliases ~/.bash_aliases
ln -s ~/scripts/.gitconfig ~/.gitconfig
ln -s ~/scripts/.bashrc ~/.bashrc
