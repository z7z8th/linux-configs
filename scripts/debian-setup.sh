#!/bin/sh

# set time zone
dpkg-reconfigure tzdata

# remove not needed pkgs
apt purge live-boot* live-config*

# git to get configs from github
apt install git git-doc ca-certificates

echo -e "Update your /etc/apt/sources.list now, and Delete this line after you finished!"
exit 0

########### SYSTEM ###########
apt install linux-image-amd64 firmware-linux firmware-misc-nonfree
#apt install sysv-rc-conf chkconfig    # sysv rc utils
#apt install kexec-tools bootchart2 uswsusp    # kernel utils
apt install cpufrequtils linux-cpupower dmidecode smartmontools memtest86+ lm-sensors ntpd ntpdate
# apt install acpi pm-utils acpitool acpi-support xapm xserver-xorg-video-apm
apt install htop iotop iftop nmon
apt install vim vim-gtk3 vim-doc ctags cscope
apt install zsh screen
apt install python python-pip python-dev python3-pip
apt install zip unzip xz-utils unrar bzip2 p7zip-full cabextract p7zip 
apt install w3m w3m-img curl axel
apt install dig nslookup telnet nmap mtrdnsutils
apt install desktop-base gdisk gparted
apt install strace ltrace gawk

# text Mail
#apt install mutt notmuch-mutt mutt-patched mutt-vc-query abook
#apt install getmail4 procmail mailcheck

apt install libnotify-bin    # /usr/bin/notify-send, for new mail notification


########### /SYSTEM ###########

read -p "Install X Windows Environment? Not a Server? Ctrl-C to Quit!"

########### DESKTOP ###########
apt install gnome gnome-shell gdm3
apt install synaptic gnome-shell-extension-autohidetopbar gnome-shell-extension-dashtodock gnome-shell-extension-system-monitor gnome-shell-extension-taskbar gnome-shell-extensions gnome-shell-extension-no-annoyance gnome-shell-extension-pixelsaver
apt install fonts-dejavu* fonts-noto-cjk fonts-noto-cjk-extra
#apt install qbittorrent chromium nautilus nautilus-open-terminal pidgin file-roller
#apt install evince libreoffice libreoffice-gtk libreoffice-gtk3 chmsee # office
apt install im-config fcitx-full fcitx-tools fcitx-pinyin
apt install alsamixergui alsa-utils libasound2-plugins pulseaudio    # audio and video
apt install gimp mirage scrot    # photos
apt install blueman    # bluetooth gui utils
apt install foomatic-db-compressed-ppds printer-driver-hpijs cups
apt install grdesktop remmina    # remote desktop control
apt install synaptic    # package manager

########### /DESKTOP ###########

########### DEVELOPMENT ###########
apt install sg3-utils lsscsi    # scsi
apt install ckermit setserial lrzsz minicom    # serial
apt install d-feet intltool pkg-config
apt install g++ gdb gdb-doc libstdc++6-6-dbg libc6-dbg

#### ANDROID ####
apt install sun-java6-jdk
apt purge openjdk*
apt install make automake autoconf autotools-dev
aptitude install lib32readline5-dev  # have dependency problem, so use aptitude
apt install schedtool git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev libc6-dev lib32ncurses5-dev ia32-libs x11proto-core-dev libx11-dev lib32readline5-dev lib32z-dev libgl1-mesa-dev g++-multilib mingw32 tofrodos python-markdown libxml2-utils xsltproc
#### /ANDROID ####

apt install wine64-bin wine64-tools libwine winetricks ttf-mscorefonts-installer lib32nss-mdns    # wine
apt install samba bluez-hcidump bluez-utils

#### FFMPEG ####
apt install ffmpeg libavresample libpng libpng12-0 librtmp
apt install libavcodec-dev libavformat-dev libavutil-dev libavfilter-dev libswscale-dev libavresample-dev  libopenblas-dev libpng-dev libpng12-dev
apt install mediainfo mediainfo-gui

# build ffmpeg 4.1
apt install doxygen doxygen-doc doxygen-gui nginx-doc graphviz
apt install autoconf   automake   build-essential   cmake   git-core  pkg-config   texinfo   wget  libtool  zlib1g-dev libass-dev   libfreetype6-dev   libsdl2-dev     libva-dev   libvdpau-dev   libvorbis-dev   libxcb1-dev   libxcb-shm0-dev   libxcb-xfixes0-dev  libncursesw*
apt install nasm yasm libx264-dev libx265-dev libnuma-dev libfdk-aac-dev libmp3lame-dev librtmp-dev
apt install vdpauinfo libvdpau-doc
apt install vlc v4l-utils
#### /FFMPEG ####

apt install nginx nginx-full spawn-fcgi libnginx-mod-rtmp
apt install mesa-utils glew-utils # graphics
########### /DEVELOPMENT ###########

echo -e "\n\n############################"
echo -e "Everything finished, go bringup your configs of vim/zsh/iceweasel"



