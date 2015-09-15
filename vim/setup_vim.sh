#!/bin/bash

export CONFIGURATION_HOME=~/usr/Configuration

cd ~
rm -rf .vim
rm .vimrc
ln -s $CONFIGURATION_HOME/vim .vim
ln -s .vim/vimrc .vimrc
