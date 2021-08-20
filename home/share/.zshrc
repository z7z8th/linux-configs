# ~/.zshrc: executed by zsh(1) for all interactive shell and login shells.

umask 0022

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
export HISTCONTROL=ignorespace   # leading space hides commands from history
setopt autocd  # cd with only dir given
setopt extendedglob
setopt nomatch
setopt notify  # notify immediately for jobs status change
setopt PROMPT_SUBST
unsetopt beep

# Fix `git reset HEAD^` returns `zsh: no matches found: HEAD^`
#setopt NO_NOMATCH
unsetopt nomatch

bindkey -e  # Emacs style line edit
bindkey "\e[3~" delete-char
bindkey "\e[H"  beginning-of-line
bindkey "\e[F"  end-of-line

# git completion related, see ~/.zsh/git-completion.zsh
fpath=(~/.zsh $fpath)

# the following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# end of lines added by compinstall
# end of lines add by zsh-newuser-install

PS1=$'$? %n@%m %~ \n%# '

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

# update terminal title
precmd  () { print -Pn "\e]0;%n:%~/\a" }
preexec  () { print -Pn "\e]0;%n:%~/\a" }
# bash uses PROMPT_COMMAND

. ~/.zsh/git-prompt.sh

if [ "$color_prompt" = yes ]; then
    PS1=$'$? %{$(tput init)%}%{\e[48;5;173m%}%n%{\e[48;5;244m%}@%m%{\e[m \e[48;5;106m%} %<..<%~%<< %{\e[0m%}$(__git_ps1 " (%s)")
%{\e[0;38;5;163m%}%#%{\e[0m%} '
#    PS1=$'$? %{\e[48;5;173m%}%n%{\e[48;5;244m%}@%m%{\e[m \e[48;5;106m%} %<..<%~%<< %{\e[0m%}$(__git_ps1 " (%s)")
#%{\e[0;38;5;163m%}%#%{\e[0m%} '
    # %50<..<%~%<< to truncate to max length 50
    # %{...%} to include an escape sequence
else
    PS1=$'$? %n@%m:%~%# '
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
fi

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# less options: -R raw control char, -i ignore case
#export LESS='-Ri'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ "$(uname -s)" != Darwin ]; then
    . ~/.zsh/ssh_agent.sh
fi

[ -e "/opt/local/share/fzf/shell/key-bindings.bash" ] && source /opt/local/share/fzf/shell/key-bindings.zsh
[ -e /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh

# Append this line to ~/.zshrc to enable fuzzy auto-completion for Zsh:
[ -e /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
