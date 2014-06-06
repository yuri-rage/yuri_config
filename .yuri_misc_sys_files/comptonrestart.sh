#!/bin/bash
# ----------
# Simple script to restart compton

if [ "$(pidof compton)" ]; then
    killall compton && sleep 1s && compton --config ~/.config/compton.conf -b
    exit 0
else
    compton --config ~/.config/compton.conf -b
    exit 0
fi
