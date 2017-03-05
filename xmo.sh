#!/bin/bash
sudo pacman -Syu --noconfirm --needed
cd ~/
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
sudo pacman -S xmonad xmonad-contrib xmobar stalonetray dmenu scrot \
    cabal-install xcompmgr screen emacs leafpad nitrogen krita texlive-most \
		spacefm texstudio
sudo cabal update
cabal install --global yeganesh
cd ~/
mv .xmonad .xmonad.orig
git clone https://github.com/Gazaunga/xmonad-config.git .xmonad

# Fonts
mkdir .fonts
cd .fonts
git clone https://github.com/be5invis/Iosevka.git
git clone https://github.com/tonsky/FiraCode.git
git clone https://github.com/sunaku/tamzen-font.git
git clone https://github.com/adobe-fonts/source-code-pro.git

# Bashrc
cd ~/
git clone https://github.com/nojhan/liquidprompt.git
cat "source liquidprompt/liquidprompt" >> .bashrc

cd ~/
wge thttps://raw.githubusercontent.com/Gazaunga/DWM/master/bin/utils.sh
https://raw.githubusercontent.com/Gazaunga/DWM/master/.Xdefaults
wget https://raw.githubusercontent.com/Gazaunga/DWM/master/.bash_functions
wget https://raw.githubusercontent.com/Gazaunga/DWM/master/.profile
wget https://raw.githubusercontent.com/Gazaunga/DWM/master/.screenrc
sudo pacman -Syu --noconfirm --needed
