#!/bin/sh

cd `pwd`/`dirname $0`
echo -n "current dir: "
pwd

file_list='.bashrc
.config/openbox
.config/openbox/lxde-rc.xml
.config/Trolltech.conf
.config/pcmanfm
.config/pcmanfm/LXDE.conf
.config/lxterminal
.config/lxterminal/lxterminal.conf
.config/lxpanel
.config/lxpanel/LXDE
.config/lxpanel/LXDE/config
.config/lxpanel/LXDE/panels
.config/lxpanel/LXDE/panels/panel
.bash_aliases'

echo "$file_list" | while read line;
do
    [ -d "$HOME/$line" ] && continue
    echo $line
    cp --parent "$HOME/$line" .
done


sys_file_list='/etc/hosts'

echo "$sys_file_list" | while read line;
do
    [ -d "$line" ] && continue
    echo $line
    cp --parent "$line" .
done
