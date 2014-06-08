#!/bin/bash

# start process(es) after killing all instances of the same

# yuri - Jun 2014


# if no argument, usage/exit with error status
usage(){
  echo "Usage: `basename $0` command1 command2 .."
  echo -e "\nCommands with arguments must be quoted:"
  echo "       `basename $0` \"command --with args\""
  exit 1
}
[ -z "$1" ] && usage

# treat each argument as a separate command

# kill all instances of each command
for ARG in "$@"; do
  # accept commands with multiple arguments
  BASECMD=`echo "$ARG" | awk '{ print $1 }'`
  # if process(es) running, kill 'em
  pgrep $BASECMD && pkill $BASECMD
done

# run specified command(s)
for ARG in "$@"; do
  $ARG &
done
