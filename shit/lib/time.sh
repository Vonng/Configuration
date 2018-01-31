#!/usr/bin/env bash
#==============================================================#
# Author: Vonng(fengruohang@outlook.com)                       #
# Desc  : Bash Time Util                                       #
# Dep   : None                                                 #
#==============================================================#

# module name
declare -g -r __MODULE_TIME="time"


#==============================================================#
#                           datetime                           #
#==============================================================#
# datetime
alias now='date +"DATE: %Y-%m-%d  TIME: %H:%M:%S  EPOCH: %s"'
alias today='date +"%Y%m%d "'
alias week='date +%V'


function yesterday(){
    case $(uname) in
        Linux ) local ds=$(date -d 'yesterday' +%Y%m%d) ;;
        Darwin ) local ds=$(date -v -24H +%Y%m%d) ;;
    esac
    echo $ds
}

# stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'
#==============================================================#