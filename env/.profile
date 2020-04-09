# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# opam
test -r /home/aaron/.opam/opam-init/init.sh && . /home/aaron/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# vagrant
export VAGRANT_DEFAULT_PROVIDER=virtualbox
