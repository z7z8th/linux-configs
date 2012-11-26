#!/bin/sh

goagent_pid=`ps aux | grep 'python.*goagent.*proxy\.py$' 2>/dev/null | grep -v 'grep' | awk '{print $2}'`
goagent_log=/tmp/goagent.log

echo "goagent_pid=$goagent_pid"
echo "goagent_log=$goagent_log"

[ -n "$goagent_pid" ] && { kill -TERM $goagent_pid; kill -KILL $goagent_pid; }


echo ""
read -p "****** start goagent ?? *****" pp
GA_DIR=$HOME/github/goagent/local
echo "nohup python $GA_DIR/proxy.py > $goagent_log &"
nohup python $GA_DIR/proxy.py > $goagent_log &

ps aux | grep 'python.*goagent.*proxy\.py$' 2>/dev/null | grep -v grep 1>/dev/null 2>&1 \
    && echo "=== succeed, start goagent" \
    || echo "*** error, start goagent"
