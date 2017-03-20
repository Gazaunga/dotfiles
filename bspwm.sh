#!/bin/bash
sudo apt-get -qqy update && sudo apt-get -qqy dist-upgrade
sudo apt -y install git python tmux
git clone https://github.com/kmARC/dotfiles ~/.dotfiles
cd ~/.dotfiles && git submodule update --init && ./install && cd -
base16_materia
sudo apt -y install htop mc mutt
sudo apt -y install dfc iotop powertop rar tlp zip
sudo apt -y install elementary-icon-theme fonts-noto lightdm lightdm-gtk-greeter xfce4-appfinder xfce4-panel xfce4-power-manager xfce4-pulseaudio-plugin xfce4-settings x11-utils x11-xserver-utils xinit xinput xscreensaver
sudo apt -y install consolekit compton dex feh jq mpc rxvt-unicode-256color xcape xsel
mkdir -p ~/.local/src
sudo apt -y install build-essential
sudo apt -y install libxcb-{xinerama0,icccm4,randr0,util,ewmh,keysyms1}-dev
git clone https://github.com/baskerville/bspwm.git ~/.local/src/bspwm
cd ~/.local/src/bspwm
make
sudo make install
cd -
git clone https://github.com/baskerville/sxhkd.git ~/.local/src/sxhkd
cd ~/.local/src/sxhkd
make
sudo make install
cd -
mkdir -p ~/.fonts
wget http://fontawesome.io/assets/font-awesome-4.7.0.zip -P /tmp
unzip /tmp/font-awesome-4.7.0.zip -d ~/.fonts
fc-cache -f
sudo apt -y install cmake pkg-config
sudo apt -y install libasound2-dev libcairo2-dev libcurl4-openssl-dev \
                 libmpdclient-dev libxcb-xkb-dev libxcb-image0-dev \
                 libiw-dev xcb-proto

git clone --recursive https://github.com/jaagr/polybar ~/.local/src/polybar
mkdir ~/.local/src/polybar/build
cd ~/.local/src/polybar/build
cmake ..
make -j5
sudo make install
cd -
sudo add-apt-repository ppa:nilarimogard/webupd8 
sudo apt -y update
sudo apt -y install arc-theme qt5ct ncmpcpp
sudo apt -y install python-pip

wget -q -O - https://apt.mopidy.com/mopidy.gpg | sudo apt-key add -
sudo wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/jessie.list
sudo apt-get -y update
sudo apt-get -y install mopidy mopidy-spotify
sudo pip install Mopidy-TuneIn
