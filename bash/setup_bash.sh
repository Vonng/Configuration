#!/bin/sh
#=============================================================================#
# Vonng's Bash Profile Setup script
#   Author: vonng (fengruohang@outlook.com)
#   Run this script to setup configurations
#=============================================================================#

#—————————————————————————————————————————————————————————————————————————————#
echo "#=============================================================#"
echo "# Configuring bash settings..."
#—————————————————————————————————————————————————————————————————————————————#

#—————————————————————————————————————————————————————————————————————————————#
# Setup directories
SRC_DIR=$(cd `dirname $0`; pwd)
CONFIG_DIR=$HOME/usr/conf/bash
mkdir -p $CONFIG_DIR
cp -r $SRC_DIR/{bash_profile,bashrc,bash_inc} $CONFIG_DIR/
BASHRC_DST=$HOME/.bashrc
BASHPROFILE_DST=$HOME/.bash_profile
BASHINC_DST=$HOME/.bash_inc

BACKUP_DIR=$HOME/.config_backup
#—————————————————————————————————————————————————————————————————————————————#

#—————————————————————————————————————————————————————————————————————————————#
# Backup settings
rm -rf $BACKUP_DIR
mkdir -p $BACKUP_DIR

if [ -f "$BASHRC_DST" ]; then
  mv $BASHRC_DST $BACKUP_DIR/.bashrc
fi

if [ -f "$BASHPROFILE_DST" ]; then
  mv $BASHPROFILE_DST $BACKUP_DIR/.bash_profile
fi

if [ -d "$BASHINC_DST" ]; then
  mv $BASHINC_DST $BACKUP_DIR/.bash_profile
fi
echo "# Backup bash configurations to $BACKUP_DIR"
#—————————————————————————————————————————————————————————————————————————————#

#—————————————————————————————————————————————————————————————————————————————#
# Link new settings
rm -rf $BASHINC_DST $BASHPROFILE_DST $BASH_RC_DST
ln -s $CONFIG_DIR/bashrc $BASHRC_DST
ln -s $CONFIG_DIR/bash_profile $BASHPROFILE_DST
ln -s $CONFIG_DIR/bash_inc $BASHINC_DST
source $HOME/.bash_profile;
#—————————————————————————————————————————————————————————————————————————————#

#—————————————————————————————————————————————————————————————————————————————#
echo "# Bash setup done."
echo "# Run 'source ~/.bashrc' to enact immediately."
echo "#=============================================================#"
#—————————————————————————————————————————————————————————————————————————————#