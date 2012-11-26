#!/bin/sh

cd `dirname $0`

GA_DIR=$HOME/github/goagent
GA_DIR_LOC=$GA_DIR/local

set -x

cd $GA_DIR/
git br -a
git reset --hard HEAD
git clean -df
git pull
git apply ../proxy.ini.diff

rm -rf $GA_DIR_LOC/certs
mkdir $GA_DIR_LOC/certs
cp ../CA.* $GA_DIR_LOC

../restart-goagent.sh

