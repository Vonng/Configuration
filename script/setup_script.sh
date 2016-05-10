#!/bin/sh
#=============================================================================#
# Vonng's Bash Profile Setup script
#   Author: vonng (fengruohang@outlook.com)
#   Run this script to setup configurations
#=============================================================================#

#—————————————————————————————————————————————————————————————————————————————#
echo "#=============================================================#"
echo "# Configuring bin & scripts settings..."
#—————————————————————————————————————————————————————————————————————————————#

#—————————————————————————————————————————————————————————————————————————————#
# Setup directories
PLATFORM=`uname -a | awk  '{print $1}'`
SRC_DIR=$(cd `dirname $0`; pwd)
TARGET_DIR=$HOME/usr/bin/

case "$PLATFORM" in
    Linux)
        mkdir -p $TARGET_DIR
        cp -r $SRC_DIR/linux/* $TARGET_DIR
        cp -r $SRC_DIR/common/* $TARGET_DIR
        ;;
    Darwin)
        mkdir -p $TARGET_DIR
        cp -r $SRC_DIR/mac/* $TARGET_DIR
        cp -r $SRC_DIR/common/* $TARGET_DIR
        ;;
    *)
        echo "Platform not supported!"
        ;;
esac
#—————————————————————————————————————————————————————————————————————————————#
echo "# Bin & scripts setup done."
echo "#=============================================================#"
#—————————————————————————————————————————————————————————————————————————————#