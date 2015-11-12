#!/bin/bash
export CONFIGURATION_HOME=$HOME/usr/Configuration
rm -rf $HOME/.vim $HOME/.vimrc
ln -s $CONFIGURATION_HOME/vim $HOME/.vim
ln -s $CONFIGURATION_HOME/.vim/vimrc.min $HOME/.vimrc
