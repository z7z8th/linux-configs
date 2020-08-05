# ~/.zshrc: executed by zsh(1) for all interactive shell and login shells.

umask 0077

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

if [ "$(uname -s)" = Darwin ]; then
    # Mac did not set locale correctly, ssh to linux warns
    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8
fi

# begin of lines add by zsh-newuser-install
# zsh -U zsh-newuser-install
# zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=300000
setopt HIST_IGNORE_DUPS
setopt appendhistory
setopt autocd  # cd with only dir given
setopt extendedglob 
setopt nomatch 
setopt notify  # notify immediately for jobs status change
setopt PROMPT_SUBST
unsetopt beep
bindkey -e  # Emacs style line edit

# git completion related, see ~/.zsh/git-completion.zsh
fpath=(~/.zsh $fpath)

# the following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# end of lines added by compinstall
# end of lines add by zsh-newuser-install

PS1=$'%n@%m %~ \n%# '

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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

. ~/.zsh/git-prompt.sh

if [ "$color_prompt" = yes ]; then
    PS1=$'%{\e[48;5;173m%}%n%{\e[48;5;244m%}@%m%{\e[48;5;106m%} %<..<%~%<< %{\e[0m%}$(__git_ps1 " (%s)")
%{\e[0;38;5;163m%}%#%{\e[0m%} '
    # %50<..<%~%<< to truncate to max length 50
    # %{...%} to include an escape sequence
else
    PS1=$'%n@%m:%~%# '
fi
unset color_prompt force_color_prompt

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

export EDITOR=emacs
export MAKEFLAGS='-j4'

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\e[0;1;5;31m'     # begin blinking
export LESS_TERMCAP_md=$'\e[0;1;31m'       # begin bold
export LESS_TERMCAP_me=$'\e[0m'            # end mode
export LESS_TERMCAP_se=$'\e[0m'            # end standout-mode
export LESS_TERMCAP_so=$'\e[0;1;32;40m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'            # end underline
export LESS_TERMCAP_us=$'\e[0;1;4;34m'     # begin underline

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
    . ~/.zsh/ssh_env
fi


PATH=$HOME/.local/openresty/bin:$PATH

export PATH
