#!/usr/bin/env bash
#==============================================================#
# Author: Vonng(fengruohang@outlook.com)                       #
# Desc  : Bash String Util                                     #
# Dep   : None                                                 #
#==============================================================#

# module name
declare -g -r __MODULE_STRING="string"


#==============================================================#
#                           encoding                           #
#==============================================================#
# lower/upper
# Usage: `upper abc`  or  echo abc | upper
function upper() {
    if [ -t 0 ]; then # argument
        tr '[:lower:]' '[:upper:]' <<< "$*"
    else # pipe
        tr '[:lower:]' '[:upper:]'
    fi;
}

function lower() {
    if [ -t 0 ]; then # argument
        tr tr '[:upper:]' '[:lower:]' <<< "$*"
    else # pipe
        tr tr '[:upper:]' '[:lower:]'
    fi;
}
#--------------------------------------------------------------#
# str length

# arg 1 :   string
# ret   :   char count in string
# also archive by `${#1}` in correct locale
function len(){
    declare -i charLen=$(echo -n ${1} | wc -m)
    echo ${charLen}
}

# arg 1 :   string
# ret   :   byte count in string
# also achieve by `LANG=C LC_ALL=C ${#1}` in locale C
function blen(){
    declare -i charLen=$(echo -n ${1} | wc -c)
    echo ${charLen}
}
#--------------------------------------------------------------#