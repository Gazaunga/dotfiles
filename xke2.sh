#!/bin/bash
sudo pacman -Syu --noconfirm -- needed
pacaur -S --noconfirm --noedit xmonad xmonad-contrib xmobar stalonetray dmenu scrot \
    cabal-install xcompmgr
sudo cabal update
cabal install --global yeganesh
pacaur -S --noconfirm --noedit xorg xorg-xinit \
  compton \
  ttf-hack-powerline-git ttf-hack-ibx otf-fontawesome \
  libreoffice \
  scrot \
  howdoi \
  rxvt-unicode \
  fontforge \
  pandoc \
  typora \
  redshift \
  texlive-most \
  kdm \
  plasma5-applets-eventcalendar \
  kdeplasma-applets-fancytasks \
  plasma5-applets-redshift-control-git \
  plasma5-applet-netctl-gui \
  kdeplasma-applets-veromix-git \
  plasma5-applets-thermal-monitor-git \
  plasma5-applets-active-window-control-git \
  plasma5-applets-keystate \
  plasma5-applets-resources-monitor-git \
  kde-applications-meta
cd
mv .xmonad .xmonad.orig
git clone https://github.com/Gazaunga/xmonad-config.git .xmonad
cd ~/
wget https://raw.githubusercontent.com/Gazaunga/Ubi3/master/.Xresources -O .Xresources
wget https://raw.githubusercontent.com/Gazaunga/Ubi3/master/.bash_aliases -O .bash_aliases
wget https://raw.githubusercontent.com/Gazaunga/Ubi3/master/.bash_functions -O .bash_functions
wget https://raw.githubusercontent.com/Gazaunga/Ubi3/master/.bashrc -O .bashrc
reboot
