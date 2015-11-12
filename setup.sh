#!/bin/sh

export CONFIGURATION_HOME=$HOME/usr/Configuration
sh $CONFIGURATION_HOME/bash/setup_bash.sh
source $HOME/.bashrc
sh $CONFIGURATION_HOME/vim/setup_vim.sh
sh $CONFIGURATION_HOME/git/setup_git.sh
