#!/bin/bash
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
sudo add-apt-repository -y 'deb https://typora.io ./linux/'
sudo apt-get -y update
sudo apt-get -y install xdg-user-dirs
xdg-user-dirs-update
sudo apt-get -y install typora
mkdir .config
cd .config
mkdir termite
cd termite
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.config/termite/config
cd ~/
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
sudo apt-get -y install libghc-xmonad-contrib-dev xinit cabal-install conky-cli mate-desktop rxvt-unicode-256color ncurses-term texlive-full nautilus mpv youtube-dl scrot dmenu python-pip xfce4-power-manager moc emacs texstudio arandr leafpad fontforge lxappearance feh darktable typora
sudo pip install rainbowstream glances ImageScraper
sudo cabal update
sudo cabal install --global yeganesh
mkdir bin
cd bin
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/setup-nautilus.sh
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/bin/color_blocks.sh
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/bin/scrot.sh
sudo chmod +x setup-nautilus.sh
./setup-nautilus.sh
cd ~/
touch .profile
wget --directory-prefix=~/Pictures/ https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-89055.jpg 
touch ~/.xsessionrc
echo "#!/bin/bash" >> ~/.xsessionrc
echo "exec xmonad" >> ~/.xsessionrc
echo "export BROWSER=qutebrowser" >> ~/.profile
echo "feh --bg-scale ~/Pictures/wallhaven-89055.jpg &" >> ~/.xsessionrc
echo "export GIT_EDITOR='/usr/bin/emacs'" >> ~/.profile
echo "export FILEBROWSER=nautilus" >> ~/.profile
echo "alias tmux='tmux -2' #Make tmux assume 256 colors." >> ~/.profile
echo "alias paste="curl -F 'sprunge=<-' http://sprunge.us"" >> ~/.profile
echo "alias make="clear && make"" >> ~/.profile
echo "alias shot="scrot ~/Screenshots/`date +%y-%m-%d-%H:%M:%S`.png"" >> ~/.profile
echo "alias getip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"" >> ~/.profile
echo "alias l="ls -o -hX --group-directories-first"" >> ~/.profile
echo "alias la="ls -o -AhX --group-directories-first"" >> ~/.profile
wget https://github.com/vincelwt/harmony/releases/download/v0.4.5/harmony-0.4.5-amd64.deb
sudo dpkg -i harmony-0.4.5-amd64.deb
sudo rm -rf harmony-0.4.5-amd64.deb
echo "Checking..."
sudo apt-get autoclean
sudo apt-get autoremove
cd .config
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.config/compton.conf
mkdir ~/mpv
mkdir albert
mkdir neofetch
mkdir qutebrowser
cd ~/mpv
wget https://github.com/Gazaunga/dotfiles/blob/master/.config/mpv/mpv.conf
cd ~/.config
mkdir cava
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.config/cava/config
cd ~/.config/albert
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.config/albert/albert.conf
cd ~/.config/neofetch
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.config/neofetch/config
cd ~/.config/qutebrowser
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.config/qutebrowser/qutebrowser.conf
cd ~/
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.profile -O .profile
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.bashrc -O .bashrc
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.bash_aliases
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.bash_functions
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.Xdefaults -O .Xdefaults
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.Xresources -O .Xresources
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.screenrc
sudo systemctl start gdm.service
mkdir ~/Templates/
touch ~/Templates/new
mkdir .xmonad
echo "Loading Xmonad Config"
cd ~/.xmonad
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/Mate/xmonad.hs -O xmonad.hs
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
echo "Your Xmo Box is ready!"
sudo apt-get -qq update && sudo apt-get -qq dist-upgrade
reboot
