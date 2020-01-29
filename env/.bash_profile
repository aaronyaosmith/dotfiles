#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -f ~/.profile ]] && . ~/.profile
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# opam configuration
test -r /home/aaron/.opam/opam-init/init.sh && . /home/aaron/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
