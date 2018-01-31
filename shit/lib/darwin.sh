#!/usr/bin/env bash
#==============================================================#
# Author: Vonng(fengruohang@outlook.com)                       #
# Desc  : Mac OS X specific bash util                          #
# Dep   : None                                                 #
#==============================================================#

# module name
declare -g -r __MODULE_DARWIN="darwin"


#==============================================================#
#                             Darwin                           #
#==============================================================#
# common dir
alias cloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs"
#--------------------------------------------------------------#
# app
alias preview="open -a 'Preview' "
function code (){
    if [ $# -eq 0 ]; then
        VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args ".";
    else
        VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args "$@";
    fi;
}
alias safari="open -a safari"
alias firefox="open -a firefox"
alias chrome="open -a google\ chrome"
#--------------------------------------------------------------#
# universal open
function o() {
    if [ $# -eq 0 ]; then
        open .;
    else
        open "$@";
    fi;
}
#--------------------------------------------------------------#
# cd into finder's directory
function cdf() {
    cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}
#--------------------------------------------------------------#
# rm all .DS_Store
alias rmds='find . -type f -name .DS_Store -delete'
#--------------------------------------------------------------#
# DNS flush
alias dnsflush='dscacheutil -flushcache'
#--------------------------------------------------------------#
# show/hidden files
alias showhidden="defaults write com.apple.finder AppleShowAllFiles TRUE"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles FALSE"
#--------------------------------------------------------------#
# mute/unmute
alias mute="osascript -e 'set volume output muted true'"
alias unmute="osascript -e 'set volume output muted false'"
#--------------------------------------------------------------#
# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
#--------------------------------------------------------------#
# Enable/Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
alias spoton="sudo mdutil -a -i on"
#--------------------------------------------------------------#
# PlistBuddy alias, because sometimes `defaults` just doesn’t cut it
alias plistbuddy="/usr/libexec/PlistBuddy"
#--------------------------------------------------------------#
# Get OS X Software Updates
alias osxupdate='sudo softwareupdate -i -a;'
#--------------------------------------------------------------#
# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"
#--------------------------------------------------------------#
# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"
#--------------------------------------------------------------#
# Lock screen
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias lock="afk"
#--------------------------------------------------------------#
# say something
alias jobdone="say 'Job Done'"

#--------------------------------------------------------------#
# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'
#--------------------------------------------------------------#



#==============================================================#
#                           homebrew                           #
#==============================================================#
# Install
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Mirror
#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
#==============================================================#

