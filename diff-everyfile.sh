#!/bin/sh
find usr home etc -type f | while read line;
do
    remote_file=$line
    local_file=/$line
    diff $local_file $remote_file && continue
    gvim -d  $local_file $remote_file
    while [ -n "$(ps aux|grep -v 'grep.*gvim'|grep gvim)" ]; do
        sleep 1s
    done
done
