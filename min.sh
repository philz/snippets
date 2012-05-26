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
