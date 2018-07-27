#
# ~/.bashrc
#

HISTSIZE=25000
HISTFILESIZE=25000

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
PS1='[\u:\[\033[1;37m\]\w\[\033[0m\]]\$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
