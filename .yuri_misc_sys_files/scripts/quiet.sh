#!/bin/bash

# run a command quietly in the background even after shell exit

# yuri - Jun 2014

usage() {
  echo "Usage: `basename $0` command"
  echo -e "\nCommands with arguments must be quoted:"
  echo "       `basename $0` \"command --with args\""
  exit 1

}

[ -z "$1" ] && usage

nohup $1 > /dev/null 2>&1 &
