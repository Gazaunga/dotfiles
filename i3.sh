sudo pacman -Syu
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.Xdefaults
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.Xresources
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.bashrc
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.profile
# change .profile $term to termite
mkdir .config
cd .config
mkdir termite
cd ~/
mkdir .i3
mkdir i3blocks
pacaur -S i3-gaps-git i3blocks-git dmenu rofi emacs termite compton thunar gvfs file-roller thunar-archive plugin thunar-shares-plugin thunar-volman ffmpegthumbnailer tumbler raw-thumbnailer gvfs-smb sshfs nitrogen lxappearance pandoc typora mpv texlive-most cmake darktable
cd .i3
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.i3/config
cd ~/.config/i3blocks
wget https://github.com/Gazaunga/dotfiles/blob/master/.config/i3blocks/config
wget https://github.com/Gazaunga/dotfiles/blob/master/.config/i3blocks/i3status.conf
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
