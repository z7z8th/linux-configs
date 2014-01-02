#android 4
alias lv43='croot && lunch full_iM98xx_evb_v3-eng'
#android 2
alias lv23='croot && lunch generic_iM98xx_evb_v3-eng'

alias cda4='cd /src/android4.0/'
alias cdbt4='cd /src/android4.0/kernel/drivers/bluetooth'
alias cda2='cd /src/android2.2/'

alias cda4s='cd /src/android4.0/ && . my_env_setup-a4.0.sh && lv43 && load_prompt'
alias cda2s='cd /src/android2.2/ && . my_env_setup-a2.2.sh && lv23 && load_prompt'

alias cdbt2='cd /src/android2.2/kernel/drivers/bluetooth'
alias cda2a='cd /src/android2.2-BSP12R_A1/'

alias gae-proxy='~/Downloads/goagent/local/proxy.py'

#alias bboot='croot && echo -e "n\ny\nn" | infomax_brunch boot 3'
alias apti='apt-get install'
alias aptbi='apt-get -t squeeze-backports install'
alias aptei='apt-get -t experimental install'
alias aptu='apt-get update'
alias aptug='apt-get upgrade'
alias aptdug='apt-get dist-upgrade'
alias apts='apt-cache search'
alias aptpl='apt-cache policy'
alias aptsh='apt-cache show'
alias aptpl='apt-cache policy'

alias em='emacs -nw'
alias emacs='emacs -nw'
