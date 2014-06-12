#!/bin/bash

# starts selected conkys in ~/.config/conky/
# looks for all config files ending in .desktop

# yuri - Jun 2014

CONFPATH=$HOME/.config/conky/*.desktop

# kill existing conkys
pgrep -x conky && pkill -x conky

for f in $CONFPATH; do
  conky -c "$f" &
done
