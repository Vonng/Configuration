#!/bin/sh
echo "#==============================================================================="
echo "Make link from $CONFIGURATION_HOME to ~"
mkdir -p ~/.config_bak
mv -f ~/.bash_inc ~/.bash_profile ~/.bashrc ~/.config_bak
ln -s $CONFIGURATION_HOME/bash/bash_inc ~/.bash_inc
ln -s $CONFIGURATION_HOME/bash/bash_profile ~/.bash_profile
ln -s $CONFIGURATION_HOME/bash/bashrc ~/.bashrc
source "~/.bashrc"
echo "Done...if not work, try 'source ~/.bashrc' manually..."
