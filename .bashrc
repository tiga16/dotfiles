#
# ~/.bashrc
#

# If not running interactively, don't do anything
set -o vi

shopt -s autocd



export EDITOR=vim
export PAGER=less
export TERMINAL=st
export BROWSER=firefox
export WEBBROWSER=firefox
export HISTFILESIZE=
export HISTSIZE=
export HISTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history

[[ $- != *i* ]] && return

alias l='/bin/ls --color=auto'
alias ls='ls -lsh --color=auto'
alias la='ls -lsah --color=auto'
alias sp='sudo pacman -S'
alias ap='aurman -S'
alias spy='sudo pacman -Syu'
alias spr='sudo pacman -Rs'
alias v='vim'
alias r='ranger'
alias sr='sudo ranger'
alias sshraspi='ssh -p 2718 root@jorisraspi.ddns.net'
alias sshlocal='ssh -p 2718 root@192.168.178.73'
alias sshfsraspi='sshfs root@jorisrasi.ddns.net:/var/www/ /home/ssnape/mnt/Server -C -p 2718 && cd /home/ssnape/mnt/Server'
alias sshfslocal='sshfs root@192.168.178.73:/var/www/ /home/ssnape/mnt/Server -C -p 2718 && cd /home/ssnape/mnt/Server'
alias test='ping -c4 jorisraspi.ddns.net:31415'
alias testd='ping -c4 duckduckgo.com'
alias psgrep='ps -A|grep'
alias cl='clear'
alias cputemp='cat /sys/class/thermal/thermal_zone0/temp'
alias ss='sudo systemctl'
alias hc='cd ~ && clear';
alias kmap='setxkbmap -layout de -option caps:escape'
alias sb='sudo brightness'

PS1='${debian_chroot:+($debian_chroot)}\[\033[0;32m\]\u\[\033[01;35m\]@\[\033[01;34m\]\h\:\[\033[01;34m\]\w\[\033[00m\]\$ '
export PS1="\[$(tput bold)\]\[\033[38;5;64m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;13m\]@\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;55m\]\H\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;60m\]\\[$(tput sgr0)\]\[\033[38;5;20m\]\\[$(tput sgr0)\]\[\033[38;5;18m\]:\[$(tput sgr0)\]\[\033[38;5;33m\]\w\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;44m\]\\$\[$(tput sgr0)\]"

PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

art
 
source /home/ssnape/.shortcuts
source ~/.shortcuts
