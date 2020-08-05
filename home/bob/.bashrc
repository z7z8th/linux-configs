# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
umask 0077

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#set -x

if [ "$(uname -s)" = Darwin ]; then
    # Mac did not set locale correctly, ssh to linux warns
    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

. ~/.bash/git-prompt.sh

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[48;5;173m\]\u\[\033[48;5;244m\]@\h\[\033[48;5;106m\] \w \[\033[0m\]$(__git_ps1 " (%s)")\n\[\033[0;38;5;163m\]\$\[\033[0m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
if [ "$(uname -s)" != Darwin ]; then
    alias ll='ls -l'
    alias la='ls -A'
    alias l='ls -CF'

    # Add an "alert" alias for long running commands.  Use like so:
    #   sleep 10; alert
    alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
else
    alias ls='ls -G'
    alias ll='ls -G -l'
    alias la='ls -G -a'
    alias lF='ls -G -F'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  elif [ -d /etc/bash_completion.d ]; then
    for f in /etc/bash_completion.d/*; do . $f; done
  fi
fi

export EDITOR=emacs
export MAKEFLAGS='-j4'

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[0;1;5;31m'     # begin blinking
export LESS_TERMCAP_md=$'\E[0;1;31m'       # begin bold
export LESS_TERMCAP_me=$'\E[0m'            # end mode
export LESS_TERMCAP_se=$'\E[0m'            # end standout-mode
export LESS_TERMCAP_so=$'\E[0;1;32;40m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'            # end underline
export LESS_TERMCAP_us=$'\E[0;1;4;34m'     # begin underline

PATH=$HOME/.local/bin:$HOME/bin:/sbin:/usr/sbin:/usr/local/sbin:$PATH

if [ "$(uname -s)" = Darwin ]; then
    # MacPorts Installer addition on 2019-11-05_at_15:46:46: adding an appropriate PATH variable for use with MacPorts.
    PATH="/opt/local/bin:/opt/local/sbin:$PATH"
    # Finished adapting your PATH environment variable for use with MacPorts.

    PATH=$PATH:~/Library/Python/3.7/bin/
    export PATH

    [ "$(ulimit -n)" -lt 10000 ] && ulimit -n 204800
fi

if [ "$(uname -s)" != Darwin ]; then
    . ~/.bash/bash_ssh_env
fi
. ~/.bash/git-completion.bash

# PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'

# . ~/.bash/bash-powerline.sh

PATH=$HOME/.local/openresty/bin:$PATH

export PATH
