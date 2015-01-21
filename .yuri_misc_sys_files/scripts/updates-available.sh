#!/bin/bash

# consolidates data from arch's built in checkupdates script
#
# if run as a normal user, output is simply to stdout
# if run as root, output is also logged to OUTFILE
#
# this file can be run as a systemd.timer or cron job on a periodic basis
# if run as a timer, conky can display the output file's results
#
# yuri - Jan 2015
#
# requires a typical arch install as well as the `bc` package
#
# *** SAMPLE  /usr/lib/systemd/system/updates-available-sh.service ***
# [Unit]
# Description=Check for Arch updates
#
# [Service]
# Type=simple
# ExecStart=/usr/local/bin/updates-available.sh
# *** END SAMPLE ***
#
# *** SAMPLE  /usr/lib/systemd/system/updates-available-sh.timer ***
# [Unit]
# Description=Hourly check for Arch updates
# 
# [Timer]
# OnCalendar=hourly
# Persistent=true
# Unit=updates-available.service
# 
# [Install]
# WantedBy=multi-user.target
# *** END SAMPLE ***

# declare a couple of variables
OUTFILE="/var/local/updates-available-sh.info"
DBPATH="/tmp/checkup-db-$USER"
USER_ID=`id -u`

# check for Internet connectivity
wget -q --tries=10 --timeout=20 --spider http://google.com > /dev/null
# if no connectivity, append (offline) to the previous output
if [[ $? -ne 0 ]]; then
  RESULT=`cat $OUTFILE`
  RESULT="${RESULT// (offline)/} (offline)"
  # if root, append to output file
  [ $USER_ID -eq 0 ] && echo "$RESULT" > $OUTFILE
  echo "$RESULT"
  exit 1
fi

NUMPKGS=0

# run arch's checkupdates script and capture output
PKGS=`checkupdates`

# pacman -Si will retrieve a wealth of info
# here we strip the "Download size" lines and count the number of iterations
# DBPATH is probably unnecessary, but I suppose it's safe to use the
#   temp path created by `checkupdates`
SIZES=''
for pkg in $PKGS
do
  SIZES+=`pacman -Si $pkg --dbpath $DBPATH | grep 'Download'`'\n'
  ((NUMPKGS++))
done

# further strip pacman output to separate KiB from MiB
KBLIST=`echo -e "$SIZES" | grep 'KiB' | awk '{ print $4 }'`
MBLIST=`echo -e "$SIZES" | grep 'MiB' | awk '{ print $4 }'`

# count KiBs
KBS='0.0'
for kb in $KBLIST
do
  KBS=`echo "$KBS + $kb" | bc`
done

# add KiBs to MiBs for the grand total download size
MBS=`echo "$KBS / 1000.0" | bc`
for mb in $MBLIST
do
  MBS=`echo "$MBS + $mb" | bc`
done

# display results
RESULT="$NUMPKGS updates available ($MBS MiB)"
# if root, write output to file
[ $USER_ID -eq 0 ] && echo "$RESULT" > $OUTFILE
echo "$RESULT"

