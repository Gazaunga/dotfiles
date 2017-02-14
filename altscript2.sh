#!/bin/bash
sudo pacman -Syu
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
mkdir {.config,.scripts,Python,Sphinx,Music,.startpages}
touch ~/.mpd/{mpd.db,mpd.log,mpd.pid,mpdstate}
packagelist=(
  menulibre # menu editor
  xorg-xkill
  xfce4-pulseaudio-plugin
  xfce-polkit-git
  gvfs # mounted volume manager
  emacs
  ttf-ms-fonts
  ttf-droid
  compiz
  emerald
  emerald-themes
  fusion-icon
  compiz-manager
  gpodder3 # podcast application
  sigil
  evince
  pandoc
  todotxt # cli todo notes
  trash-cli
  cylon # maintenance and backups
  rmlint # remove duplicates
  i-nex-git # hardware details
  texlive-localmanager-git
  htop
  powertop
  youtube-dl
  mpv
  inkscape
  cava
  mpd
  ncmpcpp
  discord # chat
  python-pip
  krita
  qutebrowser
  dmenu
  oblogout
  roxterm
  texlive-most
  texlive-lang
  context-minimals-git
  rofi
  fontforge
  typora
  texstudio
  clipgrab # dl/process videos from the web
  variety # gtk wallpaper manager
  darktable
  opera
)
pacaur -S --noconfirm --noedit ${packagelist[@]}
sudo pip install rainbowstream
compiz --replace ccp
