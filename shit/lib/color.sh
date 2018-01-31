#!/usr/bin/env bash
#==============================================================#
# Author: Vonng(fengruohang@outlook.com)                       #
# Desc  : Standard Bash Color Library                          #
# Dep   : None                                                 #
#==============================================================#

# module name
declare -g -r __MODULE_COLOR="color"

#--------------------------------------------------------------#
# global read-only constant
# cymk & rgbw color constant
#--------------------------------------------------------------#
declare -g -r __NC='\033[0m' # No Color
declare -g -r __BLACK='\033[0;30m'
declare -g -r __RED='\033[0;31m'
declare -g -r __GREEN='\033[0;32m'
declare -g -r __YELLOW='\033[0;33m'
declare -g -r __BLUE='\033[0;34m'
declare -g -r __MAGENTA='\033[0;35m'
declare -g -r __CYAN='\033[0;36m'
declare -g -r __WHITE='\033[0;37m'


#--------------------------------------------------------------#
# public function
# return color sequence by human-readable name
# $1 :  corlor name
# ret:  escape sequence
#--------------------------------------------------------------#
function color(){
    local color=$(echo $1 | tr '[:upper:]' '[:lower:]')
    case ${color} in
        0|k|black  ) echo -n $__BLACK   ;;
        1|r|red    ) echo -n $__RED     ;;
        2|g|green  ) echo -n $__GREEN   ;;
        3|y|yellow ) echo -n $__YELLOW  ;;
        4|b|blue   ) echo -n $__BLUE    ;;
        5|m|magenta) echo -n $__MAGENTA ;;
        6|c|cyan   ) echo -n $__CYAN    ;;
        7|w|white  ) echo -n $__WHITE   ;;
        8|n|none   ) echo -n $__NC      ;;
        *          ) echo -n ""        ;;
    esac
}


#--------------------------------------------------------------#
# public function
# return colored message
# $1 :  color name
# $2 :  message
# ret:  colored message in escape sequence
# Usage:    echo -e "$(color_msg red Hello) $(color b)World!"
#--------------------------------------------------------------#
# color_msg <color> <msg>
function color_msg(){
    local color=$(echo $1 | tr '[:upper:]' '[:lower:]')
    local msg=$2
    case ${color} in
        0|k|black  ) color=$__BLACK   ;;
        1|r|red    ) color=$__RED     ;;
        2|g|green  ) color=$__GREEN   ;;
        3|y|yellow ) color=$__YELLOW  ;;
        4|b|blue   ) color=$__BLUE    ;;
        5|m|magenta) color=$__MAGENTA ;;
        6|c|cyan   ) color=$__CYAN    ;;
        7|w|white  ) color=$__WHITE   ;;
        8|n|none   ) color=$__NC      ;;
        *          ) color=""        ;;
    esac

    if [[ ${color} != "" ]]; then
        echo -n "${color}${msg}${__NC}"
        return 0
    else
        echo -n ${msg}
        return 0
    fi
}
alias cm=color_msg

#--------------------------------------------------------------#
# public function
# print colored message to console
# $1 :  color name
# $2 :  message
#--------------------------------------------------------------#
function color_print(){
    local color=$(echo $1 | tr '[:upper:]' '[:lower:]')
    local msg=$2
    case ${color} in
        0|k|black  ) color=$__BLACK   ;;
        1|r|red    ) color=$__RED     ;;
        2|g|green  ) color=$__GREEN   ;;
        3|y|yellow ) color=$__YELLOW  ;;
        4|b|blue   ) color=$__BLUE    ;;
        5|m|magenta) color=$__MAGENTA ;;
        6|c|cyan   ) color=$__CYAN    ;;
        7|w|white  ) color=$__WHITE   ;;
        8|n|none   ) color=$__NC      ;;
        *          ) color=""        ;;
    esac

    if [[ ${color} != "" ]]; then
        echo -e "${color}${msg}${__NC}"
        return 0
    else
        echo -e ${msg}
        return 0
    fi
}

#==============================================================#