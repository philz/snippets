#!/bin/bash
#
# Based on http://tldp.org/HOWTO/Bash-Prompt-HOWTO/x810.html,
# this sends a libnotify message.
#
# The use here is to remind you when you've finished with a compile
# or what-not.
#
# clocks per second is almost always this... 
# Run getconf -a | grep CLK_TCK to check.
#
# To install, add the following to your .bashrc:
#  SHELL_TIME_TMP_FILE=$(mktemp)
#  PROMPT_COMMAND=shell_time.sh
# If you already have one, try:
#  export SHELL_TIME_TMP_FILE=$(mktemp)
#  PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'shell_time.sh "$(history 1)"'


# Use a temp file generated by our parent.
if [ -z $SHELL_TIME_TMP_FILE ]; then
  exit 0
fi

ONE_SECOND=100
THRESHOLD=$((10 * $ONE_SECOND))

PARENT=$(cat /proc/$PPID/stat | awk '{ print ($16 + $17) }')
if [ -s $SHELL_TIME_TMP_FILE ]; then
  PREV=$(cat $SHELL_TIME_TMP_FILE)
else
  PREV=0
fi

ELAPSED=$(($PARENT - $PREV))
if [[ $THRESHOLD -lt $ELAPSED ]]; then
  ELAPSED_SECONDS=$(($ELAPSED / $ONE_SECOND))
  notify-send "Process finished after ${ELAPSED_SECONDS} cpu-seconds. $1" 2> /dev/null
fi

echo $PARENT > $SHELL_TIME_TMP_FILE 2> /dev/null
