sudo pacman -Syu
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.Xdefaults -O .Xdefaults
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.Xresources -O .Xresources
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.bashrc -O .bashrc
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.profile -O .profile
mkdir .config
cd .config
mkdir termite
cd ~/
wget https://github.com/Gazaunga/dotfiles/blob/master/.bash_aliases
wget https://github.com/Gazaunga/dotfiles/blob/master/.bash_functions
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.screenrc
touch .xinitrc
echo "exec i3" >> .xinitrc
mkdir .i3
cd .config
mkdir i3blocks
cd ~/.config/i3blocks
wget https://github.com/Gazaunga/dotfiles/blob/master/.config/i3blocks/config
wget https://github.com/Gazaunga/dotfiles/blob/master/.config/i3blocks/i3status.conf
pacaur -S xorg-xinit i3-gaps-git i3blocks-git dmenu rofi emacs polkit-kde-agent-1 termite compton gsimplecal thunar gvfs file-roller thunar-archive-plugin thunar-shares-plugin thunar-volman ffmpegthumbnailer tumbler raw-thumbnailer gvfs-smb sshfs nitrogen lxappearance pandoc typora xfce4-taskmanager mpv texlive-most cmake darktable
cd ~/.i3
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.i3/config -O config
cd ~/.config/termite
wget https://github.com/Gazaunga/dotfiles/blob/master/.config/termite/config
cd ~/.config
mkdir neofetch
mkdir mpv
mkdir cava
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.config/neofetch/config
cd ~/.config
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.config/compton.conf
cd ~/.config/mpv
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.config/mpv/mpv.conf
cd ~/.config/cava
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.config/cava/config
cd ~/Pictures
wget https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-166605.jpg
reboot
