echo "Updating..."
sudo pacman -Syu
echo "Loading Xmonad Config"
cd ~/.xmonad
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/xmonad.hs
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/Config.hs
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/Hooks.hs
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/Layouts.hs
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/Scratch.hs
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/Themes.hs
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/Topics.hs
wget https://github.com/Gazaunga/dotfiles/blob/master/.xmonad/Utils.hs
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/config.sh
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/conkyrc
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/dzenBar.sh
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/dzenCal.sh
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/dzenHardware.sh
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/dzenLog.sh
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/dzenMusic.sh
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/dzenNetwork.sh
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/dzenPacman.hs
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/mpdConkyrc
wget https://raw.githubusercontent.com/Gazaunga/dotfiles/master/.xmonad/playPause.sh
cd ~/
sudo pacman -Syu
echo "Your Xmonad-Box is ready!"
reboot
