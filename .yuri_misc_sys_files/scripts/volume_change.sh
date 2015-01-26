#!/bin/bash

# wrapper for amixer volume changes - sends notifications to wm

step=5

if [[ $# -eq 1 ]]; then
    case $1 in 
        "up")
            amixer set Master,0 $step+;;
        "down")
            amixer set Master,0 $step-;;
        "toggle")
            amixer set Master,0 toggle;;
        *)
            echo "Invalid option";;
    esac
fi

muted=`amixer get Master|tail -n1|sed -E 's/.*\[([a-z]+)\]/\1/'`
volume=`amixer get Master|tail -n1|sed -E 's/.*\[([0-9]+)\%\].*/\1/'`

if [ $volume -lt 33 ]; then
    intensity="low"
elif [ $volume -lt 66 ]; then
    intensity="medium"
else
    intensity="high"
fi

if [[ $muted == "off" ]]; then
    notify-send "Muted" -t 1000 -i notification-audio-volume-muted -h int:value:0

else
    notify-send "Volume" -t 1000 -i notification-audio-volume-"$intensity" -h int:value:$volume
fi
