#!/bin/sh

# set time zone
dpkg-reconfigure tzdata

# remove not needed pkgs
apt-get purge live-boot* live-config*

# git to get configs from github
apt-get install git

echo -e "Update your /etc/apt/sources.list now, and Delete this line after you finished!"
exit 0

############################ BEGIN OF UPDATE BASE DEPENDENCY ########################
###
# install new kernel and firmware, remove old kernel
apt-get install linux-image-amd64
apt-get install firmware-linux-nonfree
apt-get purge linux-image-2.6-*

# cpu freq and acpi
apt-get install cpufrequtils
apt-get install acpi pm-utils acpitool acpi-support xapm xserver-xorg-video-apm

# resouce monitor
apt-get install htop iotop iftop nmon

# sysv rc utils
apt-get install sysv-rc-conf
apt-get install chkconfig

# kernel utils
apt-get install kexec-tools
apt-get install bootchart2
apt-get install uswsusp

# editor
apt-get install vim vim-gtk vim-doc ctags cscope

# shell
apt-get install zsh

# terminal utils
apt-get install screen

# python
apt-get install python python-pip python-dev

# archive utils
apt-get install zip unzip xz-utils unrar bzip2 p7zip-full

# internet utils
apt-get install w3m w3m-img curl mtr axel 

# background image of desktop and grub
apt-get install desktop-base

# disk utils
apt-get install gdisk gparted

# trace tools, for debug
apt-get install strace
apt-get install ltrace

# text process
apt-get install gawk
###
############################ END OF UPDATE BASE DEPENDENCY ########################

read -p "Install X Windows Environment? Not a Server? Ctrl-C to Quit!"

############################ BEGIN OF X ENVIRONMENT ###############################
###
# fonts
apt-get install ttf-wqy-* xfonts-wqy unifont fonts-droid gsfonts

# xserver
apt-get install xserver-xorg-core xdm xserver-xorg-video-intel xserver-xorg-input-all

# accessories
apt-get install gnome-terminal xterm gcalctool

# theme and backgrounds
apt-get install gtk-chtheme gtk2-engines gtk2-engines-murrine clearlooks-phenix-theme gnome-themes gnome-themes-extras gnome-backgrounds

# input method
apt-get install im-config fcitx fcitx-tools fcitx-pinyin

# www-browser and mail-client
apt-get install iceweasel icedove
apt-get install flashplugin-nonfree

# file browser/manager
## apt-cache search nautilus plugin
apt-get install nautilus nautilus-open-terminal

# sound and video
apt-get install alsamixergui alsa-utils libasound2-plugins pulseaudio
apt-get install mplayer2 smplayer

# graphics
apt-get install mirage gimp scrot

# instant messager
apt-get install pidgin
### skype
### i386
# wget -O skype-install.deb http://www.skype.com/go/getskype-linux-deb
# dpkg -i skype-install.deb
### x86_64
# wget -O skype-install.deb http://www.skype.com/go/getskype-linux-deb-64
# dpkg -i skype-install.deb
### skype need ia32-libs-gtk, the cmd below fix it
# apt-get install -f

# archive manager
apt-get install file-roller

# bluetooth gui utils
apt-get install blueman

# desktop environment
apt-get install lxde
apt-get purge lxterminal xarchiver leafpad gpicview lxmusic

# need by lxde-logout for supporting suspend/hibernate
# but hal conflicts with xserver-xorg
aptitude install hal

# X utils
apt-get install vbetools xscreensaver x11-apps

###
############################ END OF X ENVIRONMENT ###############################

# for vim plugins
apt-get install ruby ruby-dev
easy_install vim-bridge

# scsi
apt-get install sg3-utils lsscsi

# serial
apt-get install ckermit setserial

# development utils and libraries (android or ...)
apt-get install sun-java6-jdk
apt-get purge openjdk*
apt-get install make automake autoconf autotools-dev
aptitude install lib32readline5-dev  # have dependency problem, so use aptitude
apt-get install schedtool git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev libc6-dev lib32ncurses5-dev ia32-libs x11proto-core-dev libx11-dev lib32readline5-dev lib32z-dev libgl1-mesa-dev g++-multilib mingw32 tofrodos python-markdown libxml2-utils xsltproc

# wine
apt-get install wine-bin wine-utils libwine libwine-alsa libwine-gl libwine-gecko-1.4
apt-get install lib32nss-mdns    # for wine to connect internet

# file share
apt-get install samba

# yes, bluetooth and me
apt-get install bluez-hcidump
apt-get install bluez-utils

# printer
apt-get install foomatic-db-compressed-ppds printer-driver-hpijs cups

# video tools, previously ffmpeg
apt-get install libav-tools

# i wanna get away from this
apt-get install dos2unix
apt-get install unix2dos

# graphics
apt-get install mesa-utils glew-utils

# office
apt-get install evince libreoffice

echo -e "\n\n###############################################################################"
echo -e "Everything finished, go bringup your configs of vim/zsh/iceweasel"



