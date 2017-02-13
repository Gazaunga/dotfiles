#!/bin/bash
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
mkdir {.config,Pictures,Downloads,Videos,Games,Documents,Python,Sphinx,Music,.startpages}
touch ~/.mpd/{mpd.db,mpd.log,mpd.pid,mpdstate}
pacaur -S --noconfirm --noedit xorg-xinit gpodder3 xmonad sigil evince nitrogen pandoc todotxt trash-cli cylon gdm3 rmlint i-nex-git texlive-localmanager-git htop powertop youtube-dl mpv inkscape cava mpd ncmpcpp discord python-pip krita qutebrowser suckless-tools emacs oblogout roxterm texlive-most texlive-lang udiskie rofi i3-lock-fancy-git fontforge typora texstudio clipgrab variety darktable xfce4-power-manager compton spacefm leafpad ttf-ms-fonts opera
sudo pip install rainbowstream
cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo "nitrogen --restore" >> ~/.xinitrc
echo "exec xmonad" >> ~/.xinitrc
echo "compton -cf" >> ~/.xinitrc
xinit -- :1
