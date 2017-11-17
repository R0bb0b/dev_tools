# User specific aliases and functions
# just show base working dir & color the prompt
PS1="\[\033[0;32m\][LocalDev:\w]$  \[\033[0;37m\]"

#add paths here

export PATH

# Misc settings
umask 002                                       # Default file perm
alias vim='vim -p '
alias svim='sudo vim -p -S /home/rob/.vimrc'
alias vimphp='vim `find . -type f -name "*.php"`'
alias svimdiff='sudo vimdiff -S /home/rob/.vimrc'
alias vimh='vim -o '
alias vimv='vim -O '
alias vimswp='vim `for line in $(find ./ -type f -name "*.swp"); do newline=${line/\/./\/}; echo ${newline/.swp/}; done`'
alias restart_wifi='sudo service network-manager restart'
alias rmswp='rm `find . -type f -name "*.swp"`'

#ls colors
alias ls='ls --color'
LS_COLORS='di=34:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=5:mi=0:ex=35:*.rpm=90'
export LS_COLORS

# Define some colors:
red='\E[0;31m'
RED='\E[1;31m'
blue='\E[0;34m'
BLUE='\E[1;34m'
cyan='\E[0;36m'
CYAN='\E[1;36m'
NC='\E[0m' # No Color

# Color up the man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# pull out the crayons on grep
alias hgrep='grep --color $1 -I'
alias hfind='find . -type f -not -name \*svn\* -print0 | xargs -0 grep --color $1 -I'

# carpal tunnel, begone!
alias dfind='find . -type d -name $1 -print0'
alias ffind='find . -type f -name $1 -print0'

alias mv='mv -i'
alias rm='rm -i'

# $1 inside files across dirs
function afind_in() {
	local len=${#dirs[*]}
	local i=0
	while [ $i -lt $len ]; do
		local thisdir=${dirs[$i]}
		echo "checking $thisdir"
		`find /var/$thisdir -type f -print0 | xargs -0 grep --color $1`
		let i++
	done
}

# directories or files named $1
function afind_fd() {
	local len=${#dirs[*]}
	local i=0
	while [ $i -lt $len ]; do
		local thisdir=${dirs[$i]}
		echo "checking $thisdir"
		`find /var/$thisdir -name $1 -print0`
		let i++
	done
}
