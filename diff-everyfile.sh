#!/bin/sh

hostlist='red im'
for h in `echo $hostlist`; do
    hostname | grep -iq $h && hosttype=$h
done
h=

find etc -type f | 
while read line; do
    remote_file=$line
    local_file=/$line

    matchedhost=
    for h in `echo $hostlist`; do
        echo $line | grep -q "${h}\$" && { matchedhost=$h; break; }
    done
    [ x$matchedhost != x -a x$matchedhost != x$hosttype ] && continue
    [ x$matchedhost = x$hosttype ] && local_file=${local_file%.${hosttype}}
    diff $local_file $remote_file >/dev/null 2>&1 && continue
    gvim -f -d  $local_file $remote_file
    # while [ -n "`ps aux|grep -v 'grep.*gvim'|grep gvim`" ]; do
    #     sleep 1s
    # done
done
