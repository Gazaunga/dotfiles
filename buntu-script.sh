#!/bin/bash
sudo apt-get -y update
sudo add-apt-repository -y 'deb https://typora.io ./linux/'
sudo add-apt-repository -y ppa:noobslab/apps
sudo add-apt-repository -y ppa:peterlevi/ppa
sudo add-apt-repository -y ppa:jonathonf/texlive-2016
sudo apt-get -y --allow-unauthenticated update
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
mkdir bin
mkdir ~/Pictures
wget --directory-prefix=~/Pictures/ https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-89055.jpg 
git clone https://github.com/vicfryzel/xmonad-config.git .xmonad
touch ~/.xmobarrc
touch ~/.xsessionrc
sudo apt-get -y --allow-unauthenticated install gdm3 texlive-full xmonad xmobar stalonetray thunar gvfs file-roller thunar-archive plugin thunar-shares-plugin thunar-volman ffmpegthumbnailer tumbler raw-thumbnailer gvfs-smb sshfs libghc-xmonad-contrib-dev cabal-install xcompmgr scrot suckless-tools xscreensaver python-pip xfce4-power-manager moc rofi konsole emacs texstudio arandr leafpad fontforge lxappearance feh darktable rxvt-unicode-256color typora clipgrab variety
sudo pip install rainbowstream glances ImageScraper
sudo cabal update
sudo cabal install --global yeganesh
echo "#!/bin/bash" >> ~/.xsessionrc
echo "xrdb -merge .Xresources" >> ~/.xsessionrc
echo "xmobar &" >> ~/.xsessionrc
echo "xscreensaver -no-splash &" >> ~/.xsessionrc
echo "exec xmonad" >> ~/.xsessionrc
echo "feh --bg-scale ~/Pictures/wallhaven-89055.jpg &" >> ~/.xsessionrc
echo "udiskie &" >> ~/.xsessionrc
echo "xfce4-power-manager &" >> ~/.xsessionrc
echo "PATH=$PATH:$HOME/bin" >> ~/.profile
echo "export EDITOR='emacs'" >> ~/.profile
echo "export GIT_EDITOR='/usr/bin/emacs'" >> ~/.profile
echo "export BROWSER=qutebrowser" >> ~/.profile
#echo "export TERMINAL=konsole" >> ~/.profile
echo "export FILEBROWSER=thunar" >> ~/.profile
echo "alias tmux='tmux -2' #Make tmux assume 256 colors." >> ~/.profile
echo "alias paste="curl -F 'sprunge=<-' http://sprunge.us"" >> ~/.profile
echo "alias make="clear && make"" >> ~/.profile
echo "alias shot="scrot ~/Screenshots/`date +%y-%m-%d-%H:%M:%S`.png"" >> ~/.profile
echo "alias getip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"" >> ~/.profile
echo "alias mv="mv -i"" >> ~/.profile
echo "alias brc='emacs ~/.bashrc'" >> ~/.profile
echo "alias bsu='source ~/.bashrc'" >> ~/.profile
echo "alias ...='cd .'" >> ~/.profile
echo "alias ..='cd ..'" >> ~/.profile
echo "alias cp='cp -r'" >> ~/.profile
echo "alias home='cd ~/'" >> ~/.profile
echo "alias scripts='cd ~/.scripts'" >> ~/.profile
echo "alias mkgrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'" >> ~/.profile
echo "alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date' # Stopwatch" >> ~/.profile
echo "alias man='man -P most'" >> ~/.profile
echo "alias l="ls -o -hX --group-directories-first"" >> ~/.profile
echo "alias la="ls -o -AhX --group-directories-first"" >> ~/.profile
wget https://github.com/vincelwt/harmony/releases/download/v0.4.5/harmony-0.4.5-amd64.deb
dpkg -i harmony-0.4.5-amd64.deb
echo "Checking..."
sudo apt-get autoclean
sudo apt-get autoremove
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/mpv.conf
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.profile
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.bashrc -O .bashrc
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.Xdefaults
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.Xresources
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.screenrc
echo "Your Xmo Box is ready!"
reboot
