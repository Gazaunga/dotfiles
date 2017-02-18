#!/bin/bash

sudo pacman -Syu
mkdir dwm
mkdir bin
mkdir .config
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.profile
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.Xresources
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.bashrc
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.screenrc
cd dwm
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/dwm/config.h
cd ~/
pacaur -S xorg-xinit dwm dmenu conky-cli st emacs typora texlive-most texstudio pandoc surf gpodder3 sigil clerk-git xbindkeys okular thunar gvfs file-roller thunar-archive plugin thunar-shares-plugin thunar-volman ffmpegthumbnailer tumbler raw-thumbnailer gvfs-smb sshfs gnome-tweak-tools trash-cli todotxt cylon rmlint texlive-localmanager-git htop powertop inxi openssh mpv inkscape cava mpd ncmpcpp python-pip qutebrowser oblogout termite udiskie fontforge variety compton leafpad ttf-ms-fonts
sudo pip install rainbowstream glances ImageScraper
echo "exec dwm" >> ~/.xinitrc
echo "alias surf='tabbed -c surf -e &'" >> ~/.profile
echo "Recompiling..."
sudo makepkg -fi
