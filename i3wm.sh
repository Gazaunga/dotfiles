#!/bin/bash
pacaur -S --noedit --noconfirm polybar rofi firefox nitrogen compton dmenu krita polkit nm-applet xfce4-power-manager pamac-aur clipit blueman xbindkeys conky pavucontrol octopi discord oblogout lxappearance clipgrab pcmanfm skype gksu ranger dunst xdotool neovim python2-neovim python-neovim screen
git clone https://github.com/unix121/i3wm-themes.git
cd i3wm-themes/themes/Minimal/
cp .i3/config ~/.config/i3/config
cp .config/compton.conf ~/.config/compton.conf
mkdir ~/.config/polybar
cp .config/polybar/config ~/.config/polybar/config
cp ../scripts/polybar/launch.sh ~/.config/polybar/launch.sh
cp ../scripts/polybar/music.sh ~/.config/polybar/music.sh
cp .resources/.Xresources ~/.Xresources
cp .resources/.extend.Xresources ~/.extend.Xresources
cp -R ../.fonts/. ~/.fonts/
xrdb ~/.Xresources
cd ~
wget https://raw.githubusercontent.com/Gazaunga/Ubi3/master/.screenrc -O .screenrc
wget https://raw.githubusercontent.com/Gazaunga/Ubi3/master/.lesskey -O .lesskey
wget https://raw.githubusercontent.com/Gazaunga/Ubi3/master/.editorconfig -O .editorconfig
curl -sLf https://spacevim.org/install.sh | bash
i3-msg restart
