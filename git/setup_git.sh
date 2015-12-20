#!/bin/bash
echo "#==================================================================="
echo "Back up and update git configuration..."
mkdir -p ~/.config_bak
mv -f ~/.gitconfig ~/.config_bak/
ln -s $CONFIGURATION_HOME/git/gitconfig $HOME/.gitconfig
echo "Git Configuration Done...."
