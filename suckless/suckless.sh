#!/bin/bash
sudo pacman -Syu
mkdir dwm
mkdir bin
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/suckless/.Xdefaults -O .Xdefaults
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/suckless/.conkyrc -O .conkyrc
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/suckless/.xinitrc -O .xinitrc
mkdir .config
cd .config
mkdir qutebrowser
cd ~/qutebrowser
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.config/qutebrowser/qutebrowser.conf
cd ~/
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.profile -O .profile
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.Xresources -O .Xresources
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.bashrc -O .bashrc
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.screenrc
cd .config
mkdir termite
cd termite
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.config/termite/config2 -O config
cd ~/
cd dwm
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/suckless/config.h -O config.h
cd ~/
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.bash_aliases
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.bash_functions
pacaur -S --noconfirm --noedit xorg-xinit dwm dmenu dzen2 conky-cli st emacs typora texlive-most texstudio pandoc surf gpodder3 sigil clerk-git xbindkeys okular thunar gvfs file-roller thunar-archive plugin thunar-shares-plugin thunar-volman ffmpegthumbnailer tumbler raw-thumbnailer gvfs-smb sshfs gnome-tweak-tools trash-cli todotxt cylon rmlint texlive-localmanager-git htop powertop inxi openssh mpv inkscape cava mpd ncmpcpp python-pip qutebrowser oblogout termite udiskie vifm fontforge variety compton leafpad ttf-ms-fonts
sudo pip install rainbowstream glances ImageScraper
echo "alias surf='tabbed -c surf -e &'" >> ~/.profile
echo "Recompiling..."
cd ~/dwm
sudo makepkg -fi
