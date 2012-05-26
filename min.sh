#!/bin/bash
# 
# Minimal configuration that I prefer when using remote machines.

echo Hello

set -o vi
alias vi=vim
PS1='[$?][\u@\h \W]\$'
