#!/bin/bash
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
mkdir {.config,Pictures,Downloads,Videos,Games,Documents,Python,Sphinx,Music,.startpages}
touch ~/.mpd/{mpd.db,mpd.log,mpd.pid,mpdstate}
pacaur -S --noconfirm --noedit xorg-xinit gpodder3 xmonad texlive-localmanager-git youtube-dl mpv inkscape mpd ncmpcpp discord python-pip krita qutebrowser suckless-tools emacs oblogout roxterm texlive-most texlive-lang udiskie rofi i3-lock-fancy-git fontforge typora texstudio clipgrab variety darktable xfce4-power-manager compton spacefm leafpad ttf-ms-fonts opera
sudo pip install rainbowstream
cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo "exec xmonad" >> ~/.xinitrc
echo "compton -cf" ~/.xinitrc
xinit -- :1
