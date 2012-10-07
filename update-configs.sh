#!/bin/sh

case $1 in
	ssh)
	GITHUB_PREFIX=git@github.com:z7z8th
	;;
	https)
	GITHUB_PREFIX=https://z7z8th@github.com/z7z8th
	;;
	*)
	echo "usage: $0 [ssh|https]"
	exit 1
	;;
esac

TARGET_DIR=$HOME/github

project_list='z7z8th vimrc oh-my-zsh .pentadactyl misc markdown-here'

mkdir -p $TARGET_DIR

cd $TARGET_DIR

for proj in $project_list; do
	echo $proj
	git clone $GITHUB_PREFIX/$proj.git
done
