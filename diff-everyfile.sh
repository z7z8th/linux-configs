#!/bin/sh
find usr home etc -type f | while read line;
do
    gvim -d /$line $line
    while [ -n "$(ps aux|grep -v 'grep.*gvim'|grep gvim)" ]; do
        sleep 1s
    done
done
