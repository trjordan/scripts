#!/bin/sh -e
#
# Copies all my dotfiles into my home directory

path=$(dirname $0)

for file in .aliases .gitconfig .zshrc; do
    if [ ! -e ~/$file ] && [ ! -L ~/$file ]; then
        ln -s $(cd $path && pwd)/$file ~/$file
        echo "Linked ~/$file"
    else
        echo "Warning: ~/$file already exists and will not be linked."
    fi
done

# Make sure ~/.secrets the file exists
touch ~/.secrets
# If secrets is empty, warn to fill it out
if [ ! -s ~/.secrets ]; then
    echo "Don't forget to add to ~/.secrets"
fi
