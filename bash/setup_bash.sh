#!/bin/sh

export CONFIGURATION_HOME=$HOME/usr/Configuration
rm -rf ~/.bash_inc ~/.bash_profile ~/.bashrc
ln -s $CONFIGURATION_HOME/bash/bash_inc ~/.bash_inc
ln -s $CONFIGURATION_HOME/bash/bash_profile ~/.bash_profile
ln -s $CONFIGURATION_HOME/bash/bashrc ~/.bashrc
