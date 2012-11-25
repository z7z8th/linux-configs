#!/bin/sh

cd `dirname $0`

GA_DIR=$HOME/github/goagent/local

rm -rf $GA_DIR/certs
mkdir $GA_DIR/certs
cp CA.* $GA_DIR

./restart-goagent.sh

