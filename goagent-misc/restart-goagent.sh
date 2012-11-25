#!/bin/sh

goagent_pid=`ps aux | grep 'goagent.*proxy\.py$' | awk '{print $2}'`
goagent_log=/tmp/goagent.log

echo "goagent_pid=$goagent_pid"
echo "goagent_log=$goagent_log"

[ -n "$goagent_pid" ] && kill -9 $goagent_pid


echo ""
read -p "****** start goagent ?? *****" pp
GA_DIR=$HOME/github/goagent/local
echo "nohup python $GA_DIR/proxy.py > $goagent_log &"
nohup python $GA_DIR/proxy.py > $goagent_log &

ps aux | grep 'goagent.*proxy\.py$'
