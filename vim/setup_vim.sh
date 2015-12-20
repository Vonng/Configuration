#!/bin/bash
echo "#=================================================="
echo "Configuring vim..."
mkdir -p $HOME/.config_bak
mv -f $HOME/.vim $HOME/.vimrc $HOME/.config_bak/
ln -s $CONFIGURATION_HOME/vim $HOME/.vim
ln -s $CONFIGURATION_HOME/vim/vimrc $HOME/.vimrc
echo "Vim configuration done..."
