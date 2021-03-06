# ----------------------------------------------------------------------
# ALIASES
# ----------------------------------------------------------------------

alias tmux='tmux -2' #Make tmux assume 256 colors.
#alias cavampd='cava -i fifo -p /tmp/mpd.fifo -b 20'
alias paste="curl -F 'sprunge=<-' http://sprunge.us"
alias make="clear && make"
alias shot="scrot ~/Screenshots/`date +%y-%m-%d-%H:%M:%S`.png"
alias getip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
#alias mv="mv -i"
alias urx="urxvtcd -e bash -c 'screen -dRR -S $HOSTNAME"
alias fuck="sudo !!"
alias mcd='mkdircd'
alias tmux="TERM=screen-256color-bce tmux"
alias path='echo $PATH | tr -s ":" "\n"'

# ----------------------------------------------------------------------
# PACMAN ALIASES - (if desired, adapt for your favourite AUR helper)
# ---------------------------------------------------------------------- 

alias pac="sudo /usr/bin/pacman -S" # default action - install one or more packages

alias pacu="sudo /usr/bin/pacman -Syu" # '[u]pdate' - upgrade all packages to their newest version

alias pacr="sudo /usr/bin/pacman -Rns" # '[r]emove' - uninstall one or more packages

alias pacs="/usr/bin/pacman -Ss" # '[s]earch' - search for a package using one or more keywords

alias paci="/usr/bin/pacman -Si" # '[i]nfo' - show information about a package

alias paclo="/usr/bin/pacman -Qdt" # '[l]ist [o]rphans' - list all packages which are orphaned

alias pacc="sudo /usr/bin/pacman -Scc" # '[c]lean cache' - delete all not currently installed package files

alias paclf="/usr/bin/pacman -Ql" # '[l]ist [f]iles' - list all files installed by a given package

alias pacexpl="sudo /usr/bin/pacman -D --asexp" # 'mark as [expl]icit' - mark one or more packages as explicitly installed 

alias pacimpl="sudo /usr/bin/pacman -D --asdep" # 'mark as [impl]icit' - mark one or more packages as non explicitly installed


# '[r]emove [o]rphans' - recursively remove ALL orphaned packages

alias pacro="/usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rns \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"


# Custom

alias brc='emacs ~/.bashrc'

alias bsu='source ~/.bashrc'

alias psync='sudo pacman -Syy'

alias paco='sudo pacman -Sc && sudo pacman-optimize'

alias pcf='profile-cleaner f'

alias pcc='profile-cleaner c'

alias yd='youtube-dl'

alias lcp='sudo localepurge'

alias lcc='sudo /usr/bin/localepurge-config'

alias speed='speedtest-cli'

alias q='exit'

alias fig='sudo emacs /etc/pacman.conf'

alias md='sudo updatedb'


alias tree="tree -A"
alias treed="tree -d"
alias tree1="tree -d -L 1"
alias tree2="tree -d -L 2"

# Git
alias ginit='git init'

alias clone='git clone'

alias gstatus='git status'

alias gdiff='git diff'

alias gadd='git add'
alias gdiffs='git diff --staged'

alias greset='git reset'

alias Commit='git commit -m'

alias gbranch='git branch'

alias gcheck='git checkout'

alias Merge='git merge'


alias psg='ps aux | grep'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'


alias cp='cp -r'

alias home='cd ~/'


alias scripts='cd ~/.scripts'

alias mkgrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'


alias wpa='wpa_gui'



# This makes it so it will only get to use CPU and disk whenever nothing else is using it. In theory, this should make it so it 
alias makepkg='chrt --idle 0 ionice -c idle makepkg'

alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date' # Stopwatch

#alias man='man -P most'

alias ya="yaourt  --nameonly --pager --color --noconfirm $1"

alias l="ls -o -hX --group-directories-first"
alias la="ls -o -AhX --group-directories-first"

alias texupdate='tlmgr update --all'

#resolution for your system
alias res='xdpyinfo | grep resolution'

# fonts
alias fontc='fc-cache -fv'

alias exe='sudo chmod +x'

# make `less` not clear the screen upon exit
alias less='less -X'
