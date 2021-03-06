# User specific aliases and functions
# just show base working dir & color the prompt
PS1="\[\033[0;32m\][LOCAL: \w]$  \[\033[0;37m\]"

# Misc settings
umask 022                                       # Default file perm
alias vim='vim -p '
alias box='cd ~/sandbox'
alias proj='cd ~/sandbox/projects'
alias vimstart='vim -c ":mks! ~/vimsession.vim" '
alias vimrestore='vim -S ~/vimsession.vim'
alias rmswp='rm -i `find . -type f -name ".*.sw*"`'
alias git_merge_dryrun='git merge --no-commit --no-ff'
alias redshift='psql -h rbaldy-dev-cluster.cq2y9exg8ybh.us-east-2.redshift.amazonaws.com -U rbaldy -d devdb -p 5439'

#redis
alias redis-start='/etc/init.d/redis-server start'
alias redis-stop='/etc/init.d/redis-server stop'
alias redis-restart='/etc/init.d/redis-server restart'

#set bash history size
export HISTSIZE=10000
export HISTFILESIZE=10000

#log aliases
alias tailtitan='sudo tail -f /var/log/apache2/titan_backend-error.log'
alias tailbp='sudo tail -f /var/log/apache2/portal_backend-error.log'

#ls colors
alias ls='ls --color'
LS_COLORS='di=36:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=5:mi=0:ex=35:*.rpm=90'
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
