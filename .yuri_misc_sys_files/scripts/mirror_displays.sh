#!/bin/bash
# yuri - mirror HDMI display at correct resolution
#      - useful for lightdm setup
xrandr --output LVDS1 --mode 1366x768 --output HDMI1 --mode 1360x768 --same-as LVDS1
exit 0
