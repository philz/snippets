#!/bin/bash
# 
# Minimal configuration that I prefer when using remote machines.
#
# Evaluate with:
# . <(curl https://raw.github.com/philz/snippets/master/min.sh)

echo Hello

set -o vi
alias vi=vim
PS1='[$?][\u@\h \W]\$'

function absolute {
  ruby -r pathname -e 'puts "#{Pathname.new(ARGV[0]).realpath}\n"' $*
  # Or I could do...
  # perl -MCwd -e 'print Cwd::abs_path(shift), "\n"' ~/cdpat
}
