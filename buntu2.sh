#!/bin/bash
sudo apt-get -y update
sudo add-apt-repository -y 'deb https://typora.io ./linux/'
sudo add-apt-repository -y ppa:noobslab/apps
sudo add-apt-repository -y ppa:peterlevi/ppa
sudo add-apt-repository -y ppa:jonathonf/texlive-2016
sudo apt-get -y --allow-unauthenticated update
mkdir .config
cd .config
mkdir termite
cd termite
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.config/termite/config
cd ~/
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
mkdir bin
cd bin
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/setup-nautilus.sh
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/bin/color_blocks.sh
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/bin/scrot.sh
cd ~/
mkdir ~/Pictures
wget --directory-prefix=~/Pictures/ https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-89055.jpg 
touch ~/.xsessionrc
sudo apt-get -y --allow-unauthenticated install gdm3 texlive-full xmonad dzen2 xmobar nautilus stalonetray mpv youtube-dl libghc-xmonad-contrib-dev cabal-install xcompmgr scrot dmenu xscreensaver python-pip xfce4-power-manager moc rofi termite emacs texstudio arandr leafpad fontforge lxappearance feh darktable rxvt-unicode-256color typora clipgrab variety
sudo pip install rainbowstream glances ImageScraper
sudo cabal update
sudo cabal install --global yeganesh
echo "#!/bin/bash" >> ~/.xsessionrc
echo "xscreensaver -no-splash &" >> ~/.xsessionrc
echo "feh --bg-scale ~/Pictures/wallhaven-89055.jpg &" >> ~/.xsessionrc
echo "exec xmonad" >> ~/.xsessionrc
#echo "xfce4-power-manager &" >> ~/.xsessionrc
echo "udiskie &" >> ~/.xsessionrc
echo "xrdb -merge .Xresources" >> ~/.xsessionrc
echo "export GIT_EDITOR='/usr/bin/emacs'" >> ~/.profile
echo "export FILEBROWSER=nautilus" >> ~/.profile
wget https://github.com/vincelwt/harmony/releases/download/v0.4.5/harmony-0.4.5-amd64.deb
dpkg -i harmony-0.4.5-amd64.deb
echo "Checking..."
sudo apt-get autoclean
sudo apt-get autoremove
mkdir ~/mpv
cd ~/mpv
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/mpv.conf
cd ~/
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.profile
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.bashrc -O .bashrc
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.bash_aliases
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.bash_functions
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.Xdefaults
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.Xresources
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.screenrc
mkdir ~/Templates/
touch ~/Templates/new
mkdir .xmonad
echo "Loading Xmonad Config"
cd ~/.xmonad
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/xmonad.hs
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/Config.hs
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/Hooks.hs
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/Layouts.hs
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/Scratch.hs
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/Themes.hs
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/Topics.hs
wget https://github.com/Gazaunga/dotfiles/blob/master/.xmonad/Utils.hs
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/config.sh
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/conkyrc
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/dzenBar.sh
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/dzenCal.sh
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/dzenHardware.sh
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/dzenLog.sh
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/dzenMusic.sh
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/dzenNetwork.sh
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/dzenPacman.hs
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/mpdConkyrc
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/playPause.sh
sudo apt-get -qq update && sudo apt-get -qq dist-upgrade
echo "Your Xmo Box is ready!"
reboot
