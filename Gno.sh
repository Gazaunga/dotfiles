#!/bin/bash
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
sudo add-apt-repository -y 'deb https://typora.io ./linux/'
sudo add-apt-repository -y ppa:dawidd0811/neofetch
sudo add-apt-repository -y ppa:gekkio/xmonad
sudo apt-get -y update
sudo apt-get -y install xdg-user-dirs
xdg-user-dirs-update
mkdir .config
cd .config
mkdir termite
cd termite
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.config/termite/config
cd ~/
touch ~/.profile
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
sudo apt-get -y install gdm gnome-session-xmonad typora rxvt-unicode-256color neofetch python-pip nautilus ncurses-term texlive-full pandoc mpv youtube-dl scrot dmenu python-pip xfce4-power-manager moc emacs texstudio arandr leafpad fontforge gnome-tweak-tool feh darktable
sudo pip install rainbowstream glances ImageScraper
mkdir bin
cd bin
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/bin/color_blocks.sh
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/bin/scrot.sh
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/setup-nautilus.sh
sudo chmod +x setup-nautilus.sh
./setup-nautilus.sh
cd ~/
wget --directory-prefix=~/Pictures/ https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-27931.png
touch ~/.xsessionrc
echo "#!/bin/bash" >> ~/.xsessionrc
echo "exec xmonad" >> ~/.xsessionrc
echo "export BROWSER=qutebrowser" >> ~/.profile
echo "feh --bg-scale ~/Pictures/wallhaven-27931.png &" >> ~/.xsessionrc
echo "export GIT_EDITOR='/usr/bin/emacs'" >> ~/.profile
echo "export FILEBROWSER=nautilus" >> ~/.profile
echo "alias tmux='tmux -2' #Make tmux assume 256 colors." >> ~/.profile
echo "alias minscr='screen -DRU'" >> ~/.profile
echo "alias minmux='tmux attach || tmux'" >> ~/.profile
echo "alias busy="cat /dev/urandom | hexdump -C | grep "ca fe""" >> ~/.profile
echo "alias meminfo='free -m -l -t'" >> ~/.profile
echo "alias nano='vi'" >> ~/.profile
echo "alias ^L='clear'" >> ~/.profile
echo "alias nethack='telnet nethack.alt.org'" >> ~/.profile
wget https://github.com/vincelwt/harmony/releases/download/v0.4.5/harmony-0.4.5-amd64.deb
sudo dpkg -i harmony-0.4.5-amd64.deb
sudo rm -rf harmony-0.4.5-amd64.deb
echo "Checking..."
sudo apt-get autoclean
sudo apt-get autoremove
cd .config
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.config/compton.conf
mkdir albert
cd ~/.config/albert
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.config/albert/albert.conf -O albert.conf
mkdir neofetch
cd neofetch
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.config/neofetch/config
cd ~/
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.bashrc -O .bashrc
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.bash_aliases
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.bash_functions
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.screenrc
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.Xresources -O .Xresources
echo "Your Xmo Box is ready!"
sudo systemctl start gdm.service
sudo apt-get -qq update && sudo apt-get -qq dist-upgrade
reboot
