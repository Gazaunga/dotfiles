#!/bin/bash
mkdir ~/bin
cd ~/bin
wget https://raw.githubusercontent.com/Gazaunga/Scripts/master/bin/.scripts/utils.sh

source $HOME/bin/utils.sh
cd ~/
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
e_success "Spacemacs is ready!"

e_header "Checking for Packages"

recipes=(
  xorg-xinit
  gpodder3
  package
  xmonad
  sigil 
  xmobar-git 
  okular 
  nitrogen 
  pandoc 
  todotxt 
  trash-cli 
  cylon 
  rmlint 
  glances 
  howdoi 
  rainbowstream 
  i-nex-git
  texlive-localmanager-git
  context-minimals-git
  htop
  powertop
  youtube-dl
  mpv
  inkscape
  mpd
  ncmpcpp
  discord
  qutebrowser
  suckless-tools
  rofi
  emacs
  oblogout
  texlive-most
  texstudio
  fontforge
  typora
  darktable
  krita
  xfce4-power-manager
  thunar
  scrot
  cabal-install
  xcompmgr
  leafpad
  ttf-ms-fonts
  fira-code-git
  opera
  adapta-gtk-theme 
  xbindkeys 
  xbindkeys_config-gtk2 
  lxappearance
  gvfs 
  file-roller 
  thunar-archive-plugin 
  thunar-shares-plugin 
  thunar-volman 
  ffmpegthumbnailer 
  tumbler 
  raw-thumbnailer 
  gvfs-smb
  redshift
  sshfs
)
list="$(to_install "${recipes[*]}" "$(pacaur -S --noconfirm --noedit list)")"
if [[ "$list" ]]; then
for item in ${list[@]}
  do
   echo "$item is not on the list"
  done
else
e_arrow "Nothing to install. You've already got them all."
fi

e_note "Preparing Xmonad"
sudo cabal update
sudo cabal install --global yeganesh
cd ~/
mv .xmonad .xmonad.orig
git clone https://github.com/vicfryzel/xmonad-config.git .xmonad
e_success "Your XmoBox is Ready!"
