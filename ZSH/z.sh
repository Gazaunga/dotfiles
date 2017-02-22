#!/bin/bash
sudo apt-get -y update
sudo apt-get -y install zsh
zsh
chsh -s /bin/zsh
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/ZSH/.zshrc
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
git pull && git submodule update --init --recursive
cd ~/
mkdir bin
cd bin
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/bin/color_blocks.sh
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/bin/scrot.sh
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/mpd.sh
sudo chmod +x mpd.sh
./mpd.sh
cd ~/
mkdir .config
cd .config
mkdir termite
cd termite
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.config/termite/config
cd ~/
mkdir .ncmpcpp
cd .ncmpcpp
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.ncmpcpp/config
cd ~/
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
sudo add-apt-repository -y 'deb https://typora.io ./linux/'
sudo add-apt-repository -y ppa:noobslab/apps
sudo apt-get -y --allow-unauthenticated install gdm i3 i3blocks dzen2 nautilus mpv youtube-dl scrot dmenu xscreensaver python-pip xfce4-power-manager rofi emacs texstudio arandr leafpad fontforge lxappearance feh darktable rxvt-unicode-256color typora clipgrab variety
sudo pip install rainbowstream glances ImageScraper
sudo apt-get -y --allow-unauthenticated update
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/setup-nautilus.sh
sudo chmod +x setup-nautilus.sh
./setup-nautilus.sh
echo "export FILEBROWSER=nautilus" >> ~/.profile
wget https://github.com/vincelwt/harmony/releases/download/v0.4.5/harmony-0.4.5-amd64.deb
dpkg -i harmony-0.4.5-amd64.deb
echo "Checking..."
sudo apt-get autoclean
sudo apt-get autoremove
cd ~/
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.profile
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.bashrc -O .bashrc
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.bash_aliases
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.bash_functions
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.Xdefaults
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.Xresources
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.screenrc
cd .config
mkdir i3
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.i3/config
mkdir i3blocks
cd ~/.config/i3blocks
wget https://github.com/Gazaunga/dotfiles/blob/master/.config/i3blocks/config
wget https://github.com/Gazaunga/dotfiles/blob/master/.config/i3blocks/i3status.conf
cd ~/.config
mkdir neofetch
mkdir mpv
mkdir cava
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.config/neofetch/config
cd ~/.config
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.config/compton.conf
cd ~/
mkdir Pictures
cd ~/Pictures
wget https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-166605.jpg
sudo apt-get -qq update && sudo apt-get -qq dist-upgrade
reboot
#why doesn't termite fit here?
