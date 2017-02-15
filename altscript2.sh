#!/bin/bash
sudo pacman -Syu --noconfirm -- needed
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
mkdir{.config,.scripts,Python,Sphinx,Music,.startpages}
touch ~/.mpd/{mpd.db,mpd.log,mpd.pid,mpdstate}
pacaur -S --noconfirm --noedit menulibre xorg-xkill xfce4-pulseaudio-plugin xfce-polkit-git gvfs adapta-gtk-theme xbindkeys xbindkeys_config-gtk2 lxappearance emacs ttf-ms-fonts ttf-droid compiz emerald emerald-themes fusion-icon compiz-manager gpodder3 sigil evince pandoc todotxt trash-cli cylon rmlint i-nex-git texlive-localmanager-git htop powertop youtube-dl mpv inkscape cava mpv ncmpcpp discord python-pip krita qutebrowser dmenu oblogout roxterm texlive-most texlive-lang context-minimals-git rofi fontforge typora texstudio clipgrab variety darktable opera
sudo pip install rainbowstream
compiz --replace ccp &
