#!/bin/sh

export CONFIGURATION_HOME=~/usr/Configuration
rm ~/.bash_inc ~/.bash_profile ~/.bashrc
ln -s $CONFIGURATION_HOME/bash/bash_inc ~/.bash_inc
ln -s $CONFIGURATION_HOME/bash/bash_profile ~/.bash_profile
ln -s $CONFIGURATION_HOME/bash/bashrc ~/.bashrc
source ~/.bashrc
