#!/bin/bash

kernel=$(uname -s)

if [ "$kernel" = Darwin ]; then
    export LD_LIBRARY_PATH=/opt/local/lib:$LD_LIBRARY_PATH
    # MacPorts Installer addition on 2019-11-05_at_15:46:46: adding an appropriate PATH variable for use with MacPorts.
    export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
    # Finished adapting your PATH environment variable for use with MacPorts.
fi

export EDITOR=emacs
#export MAKEFLAGS='-j4'

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\e[0;1;5;33m'     # begin blinking
export LESS_TERMCAP_md=$'\e[0;1;33m'       # begin bold
export LESS_TERMCAP_me=$'\e[0m'            # end mode
export LESS_TERMCAP_se=$'\e[0m'            # end standout-mode
export LESS_TERMCAP_so=$'\e[0;1;32;40m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'            # end underline
export LESS_TERMCAP_us=$'\e[0;1;4;34m'     # begin underline


if [ "$kernel" = Darwin ]; then
    # MacPorts Installer addition on 2019-11-05_at_15:46:46: adding an appropriate PATH variable for use with MacPorts.
    PATH="/opt/local/bin:/opt/local/sbin:$PATH"
    # Finished adapting your PATH environment variable for use with MacPorts.

    PATH=$PATH:~/Library/Python/3.7/bin:/opt/local/Library/Frameworks/Python.framework/Versions/3.7/bin:/opt/local/libexec/gnubin

    export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk8/Contents/Home

    [ "$(ulimit -n)" -lt 10000 ] && ulimit -n 204800
    ulimit -c unlimited
fi

PATH=$PATH:$HOME/.local/openresty/bin:$HOME/.luarocks/bin:$HOME/src/garbage/tools:$HOME/src/garbage/tools/setup-remote
PATH=$HOME/.local/sbin:$HOME/.local/bin:$HOME/bin:$PATH
PATH=/sbin:/usr/sbin:/usr/local/sbin:$PATH

export LUA_PATH="?;?.lua;lua/?.lua;$HOME/.luarocks/share/lua/5.1/?.lua;$HOME/.luarocks/share/lua/5.1/?/init.lua;$HOME/.local/openresty/site/lualib/?.lua;$HOME/.local/openresty/lualib/?.lua;;"
export LUA_CPATH="?;?.so;?.dylib;lib/?.so;lib/bin/?.so;lib/?.dylib;lib/bin/?.dylib;$HOME/.luarocks/lib/lua/5.1/?.so;$HOME/.luarocks/lib/lua/5.1/?.dylib;$HOME/.local/openresty/lualib/?.so;;"

NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

#export MACOSX_DEPLOYMENT_TARGET=10.14  # Fix unwind symbol not found by ld issue

safepath ()
{
    export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
}

# MacPorts Installer addition on 2021-06-01_at_09:02:43: adding an appropriate MANPATH variable for use with MacPorts.
[ "$kernel" = Darwin ] && export MANPATH="/opt/local/share/man:$MANPATH"
# Finished adapting your MANPATH environment variable for use with MacPorts.

export PATH=/usr/local/cuda-11.4/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-11.4/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# set scale factor in application specific .desktop file
# if [ "$kernel" = Linux ]; then
#     HiDPI_SCALE=$(xrandr  --current | gawk 'match($0, /primary ([0-9]+)x([0-9]+).*\(.*\) ([0-9]+)mm x ([0-9]+)mm/, m) { print m[1]/m[3]*25.4/96 }')
#     export QT_SCALE_FACTOR=$HiDPI_SCALE
# fi
