#!/bin/sh

GA_DIR=$HOME/gitrepos/goagent
GA_DIR_LOC=$GA_DIR/local
GA_EXEC=$GA_DIR_LOC/proxy.py

echo ""

goagent_pid=`ps aux | grep 'python.*goagent.*proxy\.py' 2>/dev/null | grep -v 'grep' | awk '{print $2}'`
goagent_log=/tmp/goagent.log

echo "goagent_pid=$goagent_pid"
echo "goagent_log=$goagent_log"

[ -n "$goagent_pid" ] && { kill -TERM $goagent_pid; kill -KILL $goagent_pid; }

read -p "****** start goagent ?? *****" pp
echo "nohup python $GA_EXEC > $goagent_log &"
chmod 755 $GA_EXEC
nohup python $GA_EXEC 2>&1 > $goagent_log &

echo "======================================"
sleep 1
ps aux | grep 'python.*goagent.*proxy\.py$' 2>/dev/null | grep -v grep 1>/dev/null 2>&1 \
    && echo "### succeed, start goagent" \
    || echo "*** error, start goagent"
echo "======================================"
