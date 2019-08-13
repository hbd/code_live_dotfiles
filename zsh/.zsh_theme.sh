setopt promptsubst

export PROMPT='%{%F{red}$(getpwd)%}%f%F{yellow}$(getgitbranch)%f > '

getpwd() {
    gitdir=$(git rev-parse --show-toplevel 2> /dev/null | tr '/' '\n' | tail -n 1)
    if [ -z "$gitdir" ]; then
	gitdir=$PWD
    else
	gitprefix=$(git rev-parse --show-prefix | sed 's/\/$//')
	if [ -n "$gitprefix" ]; then
	    gitdir="$gitdir/$gitprefix"
	fi
    fi
    echo "$gitdir"
}

getgitbranch() {
    b=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
    if [ -z "$b" ]; then
	echo ""
    else
	echo " [$b]"
    fi
}
