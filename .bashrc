#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias awesomerc='$HOME/.confg/awesome/rc.lua'
PS1='[\u@\h \W]\$ '



EDITOR=/usr/bin/vim
export EDITOR
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'
