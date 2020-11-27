
export LD_LIBRARY_PATH=/opt/local/lib:$LD_LIBRARY_PATH

# MacPorts Installer addition on 2019-11-05_at_15:46:46: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

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


if [ "$(uname -s)" = Darwin ]; then
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

export LUA_PATH="?;?.lua;$HOME/.local/openresty/lualib/?.lua;$HOME/.local/openresty/site/lualib/?.lua;$HOME/.luarocks/share/lua/5.1/?.lua;$HOME/.luarocks/share/lua/5.1/?/init.lua;lua/?.lua;;"
export LUA_CPATH="?;?.so;?.dylib;$HOME/.local/openresty/lualib/?.so;$HOME/.luarocks/lib/lua/5.1/?.so;$HOME/.luarocks/lib/lua/5.1/?.dylib;lib/?.so;lib/bin/?.so;lib/?.dylib;lib/bin/?.dylib;;"

NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

export MACOSX_DEPLOYMENT_TARGET=10.14  # Fix unwind symbol not found by ld issue
