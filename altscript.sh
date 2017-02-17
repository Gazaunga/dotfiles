#!/bin/bash
sudo pacman -Syu
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/mpv.conf
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.profile
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.bashrc -O .bashrc
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.Xdefaults
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.Xresources
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.screenrc
wget https://github.com/torakiki/sejda/releases/download/v3.0.0.M11/sejda-console_3.0.0.M11-1_all.deb
sudo dpkg -i sejda-console_3.0.0.M11-1_all.deb
touch .ncmpcpp
cd .ncmpcpp
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/config
cd ~
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
mkdir {.config,Pictures,Downloads,.xmobar, Videos,Games,Documents,Python,Sphinx,Music,.startpages}
touch ~/.mpd/{mpd.db,mpd.log,mpd.pid,mpdstate}
touch ~/.xmobar/.xmobarrc
pacaur -S --noconfirm --noedit xorg-xinit gpodder3 xmonad sigil xmobar-git clerk-git evince nitrogen pandoc todotxt trash-cli cylon rmlint i-nex-git texlive-localmanager-git htop powertop youtube-dl mpv inkscape cava mpd ncmpcpp discord python-pip krita qutebrowser dmenu emacs oblogout roxterm texlive-most texlive-lang udiskie rofi fontforge typora texstudio clipgrab variety darktable xfce4-power-manager compton spacefm leafpad ttf-ms-fonts opera
sudo pip install rainbowstream glances ImageScraper
cabal install xmobar --flags="all_extensions"
cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo "nitrogen --restore" >> ~/.xinitrc
echo "exec xmonad" >> ~/.xinitrc
sudo cp /etc/xdg/compton.conf ~/.config/compton.conf
cat 'compton -cCGfF -o 0.38 -O 200 -I 200 -t 0 -l 0 -r 3 -D2 -m 0.88' >> ~/.config/compton.conf
compton -b --config ~/.config/compton.conf
reboot
