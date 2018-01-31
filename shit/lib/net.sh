#!/usr/bin/env bash
#==============================================================#
# Author: Vonng(fengruohang@outlook.com)                       #
# Desc  : Bash Network Util                                    #
# Dep   : None                                                 #
#==============================================================#

# module name
declare -g -r __MODULE_NET="net"


#==============================================================#
#                           Network                            #
#==============================================================#
alias cl='curl -sL'
#--------------------------------------------------------------#


function local_ip(){
    case $(uname) in
        Linux ) local ip=$(ifconfig | grep inet | grep -E '10.|192.168' | head -n1 | awk -F':' '{print $2}' | awk '{print $1}') ;;
        Darwin ) local ip=$(ifconfig | grep inet | grep -E '10.|192.168' | head -n1 | awk '{print $2}') ;;
    esac
  	echo $ip
}

#--------------------------------------------------------------#
alias myip="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias pubip="dig +short myip.opendns.com @resolver1.opendns.com"
#--------------------------------------------------------------#
# Traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias ap="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport"
#--------------------------------------------------------------#
# DNS lookup util
function digga() {
    dig +nocmd "$1" any +multiline +noall +answer;
}
#--------------------------------------------------------------#
# Show all names in SSL certificate for given domain
function certnames() {
    if [ -z "${1}" ]; then
        echo "ERROR: No domain specified.";
        return 1;
    fi;

    local domain="${1}";
    echo "Testing ${domain}…";
    echo ""; # newline

    local tmp=$(echo -e "GET / HTTP/1.0\nEOT" \
        | openssl s_client -connect "${domain}:443" 2>&1);

    if [[ "${tmp}" = *"-----BEGIN CERTIFICATE-----"* ]]; then
        local certText=$(echo "${tmp}" \
            | openssl x509 -text -certopt "no_header, no_serial, no_version, \
            no_signame, no_validity, no_issuer, no_pubkey, no_sigdump, no_aux");
            echo "Common Name:";
            echo ""; # newline
            echo "${certText}" | grep "Subject:" | sed -e "s/^.*CN=//";
            echo ""; # newline
            echo "Subject Alternative Name(s):";
            echo ""; # newline
            echo "${certText}" | grep -A 1 "Subject Alternative Name:" \
                | sed -e "2s/DNS://g" -e "s/ //g" | tr "," "\n" | tail -n +2;
            return 0;
    else
        echo "ERROR: Certificate not found.";
        return 1;
    fi;
}
#--------------------------------------------------------------#
# Setup or dismiss (goagent) proxy for curl, wget, etc.
alias gaproxy='export http_proxy=http://127.0.0.1:8087 https_proxy=http://127.0.0.1:8087'
alias noproxy='unset http_proxy https_proxy'
#==============================================================#

alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport"