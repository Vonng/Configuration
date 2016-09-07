#!/bin/bash
echo "#=================================================="
echo "Configuring vim..."
mkdir -p $HOME/.config_bak

echo $PWD
rm -rf $HOME/.config_bak/.vim
rm -rf $HOME/.config_bak/.vimrc
mv -f $HOME/.vim $HOME/.config_bak/vim
mv -f $HOME/.vimrc $HOME/.config_bak/vimrc

ln -s $PWD/vim $HOME/.vim
ln -s $PWD/vim/vimrc.min $HOME/.vimrc
echo "Vim configuration done..."
