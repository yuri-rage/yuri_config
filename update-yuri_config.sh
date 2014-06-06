#!/bin/bash

# updates README.md with current system info
# copies some additional files for inclusion in the repo
# stages all tracked files for upload to the git repo

INPUT_FILE='/home/yuri/README.md'
TMP_FILE='/tmp/update-yuri_config.md'
OUTPUT_FILE='/home/yuri/README.md'
BACKUP_FILE="$INPUT_FILE.old"

# files not in my home directory are listed in $ADDL_FILES_LIST
# this script will copy them to $ADDL_FILES_PATH
# files matching *.sh will be copied to $ADDL_FILES_PATH/scripts
ADDL_FILES_LIST='/home/yuri/.yuri_misc_sys_files/FILES.txt'
ADDL_FILES_PATH='/home/yuri/.yuri_misc_sys_files'

# back up the previous file
echo -e "Backing up $INPUT_FILE as $BACKUP_FILE\n"
cp $INPUT_FILE $BACKUP_FILE

# remove previous system info/output
echo -e "Creating temporary $TMP_FILE\n"
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

# update files to include in the git repository
# (files that are external to my home directory)
echo -e "Copying selected system files to $ADDL_FILES_PATH\n"
if [ ! -d "$ADDL_FILES_PATH"/scripts ]; then
  mkdir "$ADDL_FILES_PATH"/scripts
fi
while IFS= read -r f; do
  if [ ${f: -3} == ".sh" ]; then
    cp $f "$ADDL_FILES_PATH"/scripts
  else
    cp $f $ADDL_FILES_PATH
  fi
  if [[ $? -ne 0 ]] ; then
    echo "Error: did not copy $f"
  else
    echo "Success: copied $f"
  fi
done < $ADDL_FILES_LIST
echo

# ask whether to stage update files for git
# default = yes
read -n 1 -r -p 'Stage tracked files (git add/commit)? [Y/n] '
if [[ $REPLY =~ ^[Nn]$ ]]; then
  echo -e "\nExiting - files not staged."
  exit 0
fi

# git add/commit
git add $ADDL_FILES_PATH
git add -u
git commit -m "`date +"scripted update: %a, %d %b %Y  %H:%M:%S"`"
if [[ $? -ne 0 ]] ; then
  echo -e "\nError - exiting, files not staged."
  exit 1
fi
echo -e "\nFiles staged for upload.\n"

# ask whether to push files to git
# default = yes
read -n 1 -r -p 'Push files to current git branch? [Y/n] '
if [[ $REPLY =~ ^[Nn]$ ]]; then
  echo -e "\nExiting - no files pushed."
  exit 0
fi

# git push
echo
git push origin master
if [[ $? -ne 0 ]] ; then
  echo -e "\nError - exiting, no files pushed."
  exit 1
fi
echo -e "\n\nSuccess! Files pushed to current git branch.\n"
