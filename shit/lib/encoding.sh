#!/usr/bin/env bash
#==============================================================#
# Author: Vonng(fengruohang@outlook.com)                       #
# Desc  : Bash Encoding Util                                   #
# Dep   : None                                                 #
#==============================================================#

# module name
declare -g -r __MODULE_ENCODING="encoding"

#==============================================================#
#                           Highlight                          #
#==============================================================#
# highlight
# require: `pip install pygments`
alias hl=pygmentize

#--------------------------------------------------------------#
# json highlight
# Usage: `json '{"foo":42}'` or `echo '{"foo":42}' | json`
function json() {
    if [ -t 0 ]; then # argument
        python -mjson.tool <<< "$*" | pygmentize -l javascript;
    else # pipe
        python -mjson.tool | pygmentize -l javascript;
    fi;
}

#--------------------------------------------------------------#
# cat file with auto-detect extension highlight
function ca()
{
    filepath=$1
    filename=$(basename "$filepath")
    extension="${filename##*.}"
    cat ${filepath} | pygmentize -l ${extension}
}
#==============================================================#





#--------------------------------------------------------------#
# Format convert
alias yaml2json='ruby -ryaml -rjson -e "puts JSON.pretty_generate(YAML.load(STDIN.read))"'
alias json2yaml='ruby -ryaml -rjson -e "puts YAML.dump(JSON.parse(STDIN.read))"'
#--------------------------------------------------------------#
# URL
alias urlenc='python -c "import sys, urllib as ul; print(ul.quote(sys.argv[1]));"'
alias urldec='python -c "import sys, urllib as ul; print(ul.unquote(sys.argv[1]));"'
#--------------------------------------------------------------#
# Base64
alias b64enc='python -c "import sys,base64 as b;print(b.b64encode(sys.argv[1]));"'
alias b64dec='python -c "import sys,base64 as b;print(b.b64decode(sys.argv[1]));"'
#--------------------------------------------------------------#
# Create a data URL from a file
function dataurl() {
    local mimeType=$(file -b --mime-type "$1");
    if [[ $mimeType == text/* ]]; then
        mimeType="${mimeType};charset=utf-8";
    fi
    echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}
#--------------------------------------------------------------#
# UTF-8-encode a string of Unicode symbols
function escape() {
    printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u);
    # print a newline unless we’re piping the output to another program
    if [ -t 1 ]; then
        echo ""; # newline
    fi;
}
#--------------------------------------------------------------#
# Decode \x{ABCD}-style Unicode escape sequences
function unidec() {
    perl -e "binmode(STDOUT, ':utf8'); print \"$@\"";
    # print a newline unless we’re piping the output to another program
    if [ -t 1 ]; then
        echo ""; # newline
    fi;
}
#--------------------------------------------------------------#
# Get a character’s Unicode code point
function codepoint() {
    perl -e "use utf8; print sprintf('U+%04X', ord(\"$@\"))";
    # print a newline unless we’re piping the output to another program
    if [ -t 1 ]; then
        echo ""; # newline
    fi;
}
#==============================================================#