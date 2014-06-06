#!/bin/bash

# toggles a tilda/guake/yakuake-like urxvt window
# requires wmctrl, openbox, and custom .config/rc.xml application settings

# grab the window ID of the bashrun terminal window
WINID=`wmctrl -lx | grep bashrun.URxvt | awk '{ print $1 }'`

# if no existing window, start the terminal
if [ -z "$WINID" ]; then
  urxvt -geometry 80x20 -name bashrun &
else # toggle hidden
  wmctrl -i -r $WINID -b toggle,hidden
  # if window is visible, activate it
  if [ -z `xprop -id $WINID | grep HIDDEN` ]; then
    wmctrl -i -a $WINID
  fi
fi


