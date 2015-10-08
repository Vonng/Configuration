#!/bin/sh

export CONFIGURATION_HOME=/home/vonng/usr/Configuration
rm -f ~/.bash_inc ~/.bash_profile ~/.bashrc
ln -s $CONFIGURATION_HOME/bash/bash_inc ~/.bash_inc
ln -s $CONFIGURATION_HOME/bash/bash_profile ~/.bash_profile
ln -s $CONFIGURATION_HOME/bash/bashrc ~/.bashrc
source /home/vonng/.bashrc
