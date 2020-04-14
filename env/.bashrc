#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# nvm
source /usr/share/nvm/init-nvm.sh

# opam configuration
test -r /home/aaron/.opam/opam-init/init.sh && . /home/aaron/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
