#!/usr/bin/env bash
#==============================================================#
# Author: Vonng(fengruohang@outlook.com)                       #
# Desc  : Bash compress util                                   #
# Dep   : None                                                 #
#==============================================================#

# module name
declare -g -r __MODULE_COMPRESS="compress"

#==============================================================#
#                             zip                              #
#==============================================================#
# tar zip
function tz() {
    if [ -t 0 ]; then # argument
        tar -zcf "$1.tar.gz" "$@"
    else # pipe
        gzip
    fi;
}

# tar unzip
function tx(){
    if [ -t 0 ]; then # argument
        tar -xf $@
    else # pipe
        tar -x -
    fi;
}
#==============================================================#


