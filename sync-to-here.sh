#!/bin/sh

cd `pwd`/`dirname $0`
pwd

file_list='./.config/openbox
./.config/openbox/lxde-rc.xml
./.config/Trolltech.conf
./.config/pcmanfm
./.config/pcmanfm/LXDE.conf
./.config/lxterminal
./.config/lxterminal/lxterminal.conf
./.config/lxpanel
./.config/lxpanel/LXDE
./.config/lxpanel/LXDE/config
./.config/lxpanel/LXDE/panels
./.config/lxpanel/LXDE/panels/panel'

echo "$file_list" | while read line;
do
    [ -d "$line" ] && continue
    echo $line
    cp --parent "$HOME/$line" .
done
