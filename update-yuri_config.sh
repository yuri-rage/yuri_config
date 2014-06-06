#!/bin/bash

# updates README.md with current system info
# stages all tracked files for upload to GitHub

INPUT_FILE='/home/yuri/README.md'
TMP_FILE='/tmp/update-yuri_config.md'
OUTPUT_FILE='/home/yuri/README.md'
BACKUP_FILE="$INPUT_FILE".old

# back up the previous file
echo "Backing up $INPUT_FILE as $BACKUP_FILE"
cp $INPUT_FILE $BACKUP_FILE

# remove previous system info/output
echo "Removing previous system info"
sed '/cut_here/q' $INPUT_FILE > $TMP_FILE

# append date/time stamp
date +"Appending time stamp: %a, %d %b %Y  %H:%M:%S" 
date +"System info current as of: %a, %d %b %Y  %H:%M:%S" >> $TMP_FILE

# append uname info to temp file
echo "Appending output of uname -a"
echo -ne '\nOutput of `uname -a >> README.md` :\n\n    ' >> $TMP_FILE
uname -a >> $TMP_FILE

# append package info to temp file
# sed indents the lines for markdown purposes
echo "Appending output of pacman -Qe"
echo -ne '\nOutput of `pacman -Qe >> README.md` :<br>\n' >> $TMP_FILE
echo -ne '(all explicitly installed Arch packages)\n\n' >> $TMP_FILE
pacman -Qe | sed  's/^/    /' >> $TMP_FILE

# move temp file to output file
mv $TMP_FILE $OUTPUT_FILE
echo -e "\nFile updated: $OUTPUT_FILE\n"

# ask whether to stage update files for git
# default = yes
read -n 1 -r -p 'Stage tracked files (git add/commit)? [Y/n] '
if [[ $REPLY =~ ^[Nn]$ ]]; then
  echo -e "\nExiting - files not staged."
  exit 0
fi

# git add/commit
echo -e "\nStaging tracked files to current commit."
git add -u
git commit -m "`date +"scripted update: %a, %d %b %Y  %H:%M:%S"`"

# ask whether to push files to git
# default = yes
read -n 1 -r -p 'Push files to GitHub? [Y/n] '
if [[ $REPLY =~ ^[Nn]$ ]]; then
  echo -e "\nExiting - no files pushed."
  exit 0
fi

# git push
echo -e "\nPushing staged files to GitHub."
git push origin master
