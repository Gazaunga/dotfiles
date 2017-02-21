#!/bin/sh
hname="$(uname -n)"

printf 'Setting graphical editor...\n'
if which emacs; then
    printf 'Found spacemacs\n'
    export EDITOR='emacs -fs'
elif which vim; then
    printf 'Found vim\n'
    export EDITOR='vim'
fi

printf 'Loading default Xresources...\n'
xrdb -merge "$HOME/conf/Xresources"
if [ -f "$HOME/.Xresources" ]; then
    printf 'Loading %s/.Xresources...\n' "$HOME"
    xrdb -merge "$HOME/.Xresources"
fi

printf 'Searching for xbindkeys...\n'
if which xbindkeys; then
    printf 'Running xbindkeys...\n'
    xbindkeys
fi

if which redshift; then
    printf 'Launching redshift...\n'
    redshift &
    redpid=$!
fi

if [ -x "$HOME/xsession.sh" ]; then
    printf 'Running xsession.sh for %s...\n' "$hname"
    . "$HOME/xsession.sh"
fi
