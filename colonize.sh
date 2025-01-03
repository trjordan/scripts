#!/bin/sh -e
#
# Copies all my dotfiles into my home directory

curdir=$(dirname $0)

for file in .aliases .gitconfig .zshrc .login; do
    if [ ! -e ~/$file ] && [ ! -L ~/$file ]; then
        ln -s $(cd $curdir && pwd)/$file ~/$file
        echo "Linked ~/$file"
    else
        echo "Warning: ~/$file already exists and will not be linked."
    fi
done

cp $curdir/com.trjordan.login.plist ~/Library/LaunchAgents/com.trjordan.login.plist
# replace trjordan with the current user in that file, inline
sed -i '' "s/trjordan/$(whoami)/g" ~/Library/LaunchAgents/com.trjordan.login.plist

# Make sure ~/.secrets the file exists
touch ~/.secrets
# If secrets is empty, warn to fill it out
if [ ! -s ~/.secrets ]; then
    echo "Don't forget to add to ~/.secrets"
fi
