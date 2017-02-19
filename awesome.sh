#!/bin/bas
sudo pacman -Syu
mkdir .config
git clone --recursive https://github.com/copycat-killer/awesome-copycats.git
mv -bv awesome-copycats/* ~/.config/awesome
reboot
