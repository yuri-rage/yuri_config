#!/bin/bash

# wrapper for xbacklight - mostly to avoid turning the sreen off (brightness = 0)

# yuri - Nov 2014

# obsoleted by (grub) kernel parameter video.use_native_backlight=0 on Asus K55A laptop

# if no argument, usage/exit with error status
usage(){
  echo "Usage: `basename $0` [brightness]"
  echo "  [brightness] can be an integer from 1 to 100"
  echo "  [brightness] also be \"up\" or \"down\""
  exit 1
}
[ -z "$1" ] && usage

# round brightness to integer part
brightness=`xbacklight |  awk '{printf("%d\n",$1 + 0.5)}'`

[ "$1" == "up" ] && xbacklight -inc 10

[ "$1" == "down" ] && [ $brightness -gt 10 ] && xbacklight -dec 10

# test for integer greater than 0
[[ $1 =~ ^-?[0-9]+$ ]] && [ $1 -gt 0 ] && xbacklight -set $1

echo `xbacklight |  awk '{printf("%d\n",$1 + 0.5)}'`
