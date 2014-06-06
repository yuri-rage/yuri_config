#!/bin/bash 
# A very simple Bash script to download a YouTube video 
# and extract the music file from it.
if [ -n "$1" ]; then
  youtube-dl -i --extract-audio --audio-format mp3 --audio-quality 0 -o '%(title)s.%(ext)s' $1
else
  echo "Nothing to download."
  exit 1
fi

# ask about normalizing audio (adjust track volume/gain)
# default = yes
read -n 1 -r -p 'Normalize all tracks? [Y/n] '
if [[ $REPLY =~ ^[Nn]$ ]]; then
  echo -e "\nExiting - tracks not normalized."
  exit 0
fi

# normalize all mp3 audio tracks in this directory
mp3gain -r *.mp3

exit 0 # code below will not be executed

# alternate method below, including regex matching of video id

address=$1 
regex='v=(.*)' 
if [[ $address =~ $regex ]]; then 
  video_id=${BASH_REMATCH[1]}
  video_id=$(echo $video_id | cut -d'&' -f1) 
  video_title="$(youtube-dl --get-title $address)"
  echo "Video title:     $video_title"
  video_filename="$(youtube-dl -f bestaudio --get-filename $address)"
  echo "Download target: $video_filename"
  youtube-dl -f bestaudio $address
  avconv -i "$video_filename" "$video_title".wav 
  lame "$video_title".wav "$video_title".mp3 
  rm "$video_filename" "$video_title".wav
  echo -e "\nSuccess:         $video_title.mp3\n"
else 
  echo "Sorry but the system encountered a problem." 
fi
