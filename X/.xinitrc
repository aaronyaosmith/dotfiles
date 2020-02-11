setxkbmap -option "ctrl:swapcaps"
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
/usr/bin/dropbox &
exec i3

