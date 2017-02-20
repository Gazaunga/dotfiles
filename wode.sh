#!/bin/bash
sudo pacman -Syu
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.profile
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.bashrc -O .bashrc
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
pacaur -S --noconfirm --noedit i3 i3lock-fancy-git i3-wm-iconpatch ttf-font-awesome sigil rofi clerk-git okular pandoc typora trash-cli cylon rmlint i-nex-git texlive-localmanager-git texlive-most leafpad youtube-dl mpv inkscape discord krita fira-code-git qutebrowser opera dmenu emacs roxterm gnome-tweak-tools fontforge clipgrab variety darktable xfce4-power-manager compton okular thunar gvfs file-roller thunar-archive-plugin thunar-shares-plugin thunar-volman ffmpegthumbnailer tumbler raw-thumbnailer gvfs-smb sshfs
git clone https://github.com/wodesuck/dotfiles.git
cd dotfiles
make vim
make xinit
make Xresources
make conky
make stalonetray
make screen
make tmux
make vimperator
make dunst
make fontconfig
make i3
make ranger
reboot
