#!/bin/sh

goagent_pid=`ps aux | grep 'python.*goagent.*proxy\.py' 2>/dev/null | grep -v 'grep' | awk '{print $2}'`
goagent_log=/tmp/goagent.log

echo "goagent_pid=$goagent_pid"
echo "goagent_log=$goagent_log"

[ -n "$goagent_pid" ] && { kill -TERM $goagent_pid; kill -KILL $goagent_pid; }

cd `dirname $0`

GA_DIR=$HOME/github/goagent
GA_DIR_LOC=$GA_DIR/local
GA_LOCAL_CERTS=$GA_DIR/../local-certs.tar.bz2
GA_EXEC=$GA_DIR_LOC/proxy.py
GA_CONF=$GA_DIR_LOC/proxy.ini

cd $GA_DIR/
appid=`awk '/appid/{print $3; exit;}' $GA_CONF`
passwd=`awk '/password/ {print $3; exit;}' $GA_CONF`
tar jcf $GA_LOCAL_CERTS local/certs/ local/CA.*
git branch -a
git reset --hard HEAD
echo "=== do git clean -df"
git clean -df >/dev/null
# git checkout -b 3.0 remotes/upstream/3.0
echo "=== do git pull"
git remote update
git checkout remotes/upstream/3.0
echo "=== restore certs"
rm -rf $GA_DIR_LOC/certs
rm $GA_DIR_LOC/CA.*
tar xf $GA_LOCAL_CERTS
#cp ../CA.* $GA_DIR_LOC

echo "======================================"
echo "== backup->update->restore finished =="
echo "======================================"


echo "=== change proxy config"
# read -p "input appid: " appid
# read -p "input passwd: " passwd
sed -i -r -e "s/^(appid\\s*=).*$/\\1 $appid/" -e "s/^(password\\s*=).*$/\\1 $passwd/" $GA_CONF

echo ""
read -p "****** start goagent ?? *****" pp
echo "nohup python $GA_EXEC > $goagent_log &"
chmod 755 $GA_EXEC
nohup python $GA_EXEC > $goagent_log &

echo "======================================"
sleep 1
ps aux | grep 'python.*goagent.*proxy\.py$' 2>/dev/null | grep -v grep 1>/dev/null 2>&1 \
    && echo "### succeed, start goagent" \
    || echo "*** error, start goagent"
echo "======================================"
