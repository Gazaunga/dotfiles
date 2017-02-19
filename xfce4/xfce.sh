#!/bin/bash
sudo pacman -Syu
git clone https://www.github.com/syl20bnr/spacemacs ~/.emacs.d
mkdir .xmonad
mkdir .config
cd .config
mkdir neofetch
mkdir termite
cd termite
wget https://github.com/Gazaunga/dotfiles/blob/master/.config/termite/config
cd ~/.config/neofetch
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.config/neofetch/config
cd ~/
mkdir mpv
cd mpv
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/mpv.conf
cd ~/
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.profile
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.bashrc -O .bashrc
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.Xdefaults
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.Xresources
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.screenrc
pacaur -S xmonad xmonad-contrib neofetch termite emacs pandoc typora
cd .xmonad
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/xfce4/xmonad.hs
cd ~/
xmonad --replace
xmonad --recompile && xmonad --restart
