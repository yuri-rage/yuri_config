#!/bin/bash

# modifies a conky file with text from user input
# intended to make conky into a bit of a "sticky note" app

# yuri - Jan 2015

INFILE=~/.config/conky/stickynote.conky

# if no argument, usage/exit with error status
usage(){
  echo "Usage: `basename $0` [--clear] <text to append>"
  exit 1
}
[ -z "$1" ] && usage

# remove all lines after TEXT if --clear flag is the first argument
[ $1 == '--clear' ] && sed -i '/TEXT/q' $INFILE

for ARG in "$@"; do
 [ "$ARG" != '--clear' ] && MSG="$MSG $ARG"
done

echo $MSG >> $INFILE
