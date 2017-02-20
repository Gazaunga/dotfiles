#!/bin/bash
sudo pacman -Syu
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/mpv.conf
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.profile
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.bashrc -O .bashrc
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.Xdefaults
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.Xresources
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.screenrc
mkdir .config
git clone --recursive https://github.com/copycat-killer/awesome-copycats.git
sudo mv -bv awesome-copycats/* ~/.config/awesome
cd ~/
pacaur -S --noconfirm --noedit sigil rofi clerk-git okular pandoc typora trash-cli cylon rmlint i-nex-git texlive-localmanager-git texlive-most leafpad youtube-dl mpv inkscape discord krita fira-code-git qutebrowser opera dmenu emacs roxterm gnome-tweak-tools fontforge clipgrab variety darktable xfce4-power-manager compton okular thunar gvfs file-roller thunar-archive-plugin thunar-shares-plugin thunar-volman ffmpegthumbnailer tumbler raw-thumbnailer gvfs-smb sshfs
reboot
