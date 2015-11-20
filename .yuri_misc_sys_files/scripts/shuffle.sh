#!/bin/bash

for file in *.mp3
do
    if [[ -d $file ]]
    then
        continue    # skip directories
    fi
    if [[ $file =~ ^[0-9]{3}-(.*).mp3$ ]]    # get basename
    then
        name=${file#*-}                # of a previously shuffled file
    else
        name=$file                      # of an unshuffled file
    fi
    if [[ $1 != -u ]]
    then
        mv "$file" "`shuf -i 100-999 -n 1`-$name"    # shuffle
    else
        mv "$file" "$name"                           # unshuffle
    fi
done
