#!/bin/bash
# 
# Minimal configuration that I prefer when using remote machines.
#
# Evaluate with:
# . <(curl https://raw.github.com/philz/snippets/master/min.sh)

set -o vi
alias vi=vim
PS1='[$?][\u@\h \W]\$'

function absolute {
  ruby -r pathname -e 'puts "#{Pathname.new(ARGV[0]).realpath}\n"' $*
  # Or I could do...
  # perl -MCwd -e 'print Cwd::abs_path(shift), "\n"' ~/cdpat
}

function cdg () { 
    DIR=$(git rev-parse --show-cdup);
    if [ $? -eq 0 ]; then
        if [ ! -z $DIR ]; then
            cd $DIR;
        fi;
    fi
}
ff () 
{ 
    find . -name "$1"
}
fvi () 
{ 
    vi $(find . -name "*$1*")
}
gcp () 
{ 
    for x in $*;
    do
        git cherry-pick -x $x;
    done
}
git-new-branch () 
{ 
    echo git checkout -b $1 $2;
    git checkout -b $1 $2
}
notify () 
{ 
    "$@";
    if [[ $? -eq 0 ]]; then
        notify-send Success "$*";
    else
        notify-send Failure "$*";
    fi
}
parse_git_branch () 
{ 
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo ${ref#refs/heads/}
}
unixtime () 
{ 
    gawk "BEGIN { print strftime("'"'"%c"'"'", $1); }"
}
