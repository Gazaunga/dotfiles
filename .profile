PATH=$PATH:$HOME/bin

# Environment

export EDITOR='emacs'
export GIT_EDITOR='/usr/bin/emacs'
export BROWSER=opera
export TERMINAL=termite
export FILEBROWSER=thunar


# autostartx if running on the first tty:
[[ -z $DISPLAY && $XDG_VTNR -eq 1 && -z $TMUX ]] && exec startx
