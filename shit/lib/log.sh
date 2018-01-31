#!/usr/bin/env bash
#==============================================================#
# Author: Vonng(fengruohang@outlook.com)                       #
# Desc  : Standard Bash Log Library                            #
# Dep   : None                                                 #
#==============================================================#

# module name
declare -g -r __MODULE_LOG="log"

#--------------------------------------------------------------#
# global variable (int) & public function
# set log level
# $1 :  log level (debug:10,info:20,warn:30,error:40,fatal:50)
# default level is INFO:20
#--------------------------------------------------------------#
declare -g -i LOG_LEVEL=20

function log_level(){
    local level=$(echo $1 | tr '[:upper:]' '[:lower:]')
    case $level in
    1|10|d|debug        ) LOG_LEVEL=10 ;;
    2|20|i|info         ) LOG_LEVEL=20 ;;
    3|30|w|warn|warning ) LOG_LEVEL=30 ;;
    4|40|e|error        ) LOG_LEVEL=40 ;;
    5|50|f|fatal        ) LOG_LEVEL=50 ;;
    * ) return 1 ;;
    esac
    return 0
}


#--------------------------------------------------------------#
# global variable & public function
# set log destination
# $1 :  log path ("" represent stderr)
# default destination is stderr with color output enabled
#--------------------------------------------------------------#
declare -g LOG_PATH=""

function log_path(){
    LOG_PATH=${1:=''}
}


#--------------------------------------------------------------#
# global variable
# set log timestamp format
# $1 :  fmt str (same as date, "" will disable timestamp)
# timestamp disabled by default
#--------------------------------------------------------------#
declare -g LOG_TIME_FMT=""

function log_time_fmt(){
    local fmt=${1:=''}
    [[ -z ${fmt} ]] && __LOG_TIME_FMT="" return 0
    preset_fmt=$(echo $fmt | tr '[:upper:]' '[:lower:]')
    case ${preset_fmt} in
    datetime|full|dt ) LOG_TIME_FMT="+%Y-%m-%d %H:%M:%S" ;;
    date|d           ) LOG_TIME_FMT="+%Y-%m-%d" ;;
    time|t           ) LOG_TIME_FMT="+%H:%M:%S" ;;
    ts|timestamp     ) LOG_TIME_FMT="+%s"       ;;
    n|none           ) LOG_TIME_FMT=""          ;;
    *                ) LOG_TIME_FMT=${fmt}      ;;
    esac
    return 0
}


#--------------------------------------------------------------#
# private function
# $1 :  log level
# $2 :  message
#--------------------------------------------------------------#
function __log(){
    local -i level=$1
    shift
    # level less then level setting
    (( ${LOG_LEVEL} > level )) && return 0

    # determine head and color by level
    local head="[LOG]  "
    local color='\033[0;37m' # white
    if   (( $level >= 50 )); then head="[FATAL]";color='\033[0;31m' # Red
    elif (( $level >= 40 )); then head="[ERROR]";color='\033[0;31m' # Red
    elif (( $level >= 30 )); then head="[WARN] ";color='\033[0;33m' # Yellow
    elif (( $level >= 20 )); then head="[INFO] ";color='\033[0;32m' # Green
    elif (( $level >= 10 )); then head="[DEBUG]";color='\033[0;34m' # Blue
    fi

    # add timestamp if fmt is specified
    local timestamp=""
    if [[ "${LOG_TIME_FMT}" == "" ]]; then timestamp=""
    else timestamp="[$(date "${LOG_TIME_FMT}")] "
    fi

    if [[ "${LOG_PATH}" == "" ]]
    then
        # write to stderr with color
        printf "${color}${head}\033[0m\033[0;37m${timestamp}\033[0m$*\n"  1>&2
    else
        # write to regular file
        echo "${head} ${timestamp}$*" >> ${LOG_PATH}
    fi
}



#--------------------------------------------------------------#
# public functions
# log with level specified in function name
# $1 :  message
#--------------------------------------------------------------#

# blue
function log_debug() {
    __log 10 $@
}

# green
function log_info() {
    __log 20 $@
}

# orange
function log_warn() {
    __log 30 $@
}

function log_warning() {
    __log 30 $@
}

# red, write to stderr
function log_error(){
    __log 40 $@
}

# red, write to stderr and exit script
function log_fatal(){
    __log 50 $@
    exit 1
}
