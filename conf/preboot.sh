#!/bin/bash

printf 'Installing packages...\n'
pacaur -S --noconfirm --noedit xorg-xinit gpodder3 sigil gnome-tweak-tool evince pandoc typora trash-cli rmlint i-nex-git texlive-localmanager-git htop powertop youtube-dl mpv inkscape mpd ncmpcpp discord python-pip krita qutebrowser dmenu emacs termite texlive-most texlive-lang fontforge texstudio clipgrab variety darktable compton thunar gvfs file-roller thunar-archive plugin thunar-shares-plugin thunar-volman ffmpegthumbnailer tumbler raw-thumbnailer gvfs-smb sshfs leafpad ttf-ms-fonts opera
sudo pip install rainbowstream glances ImageScraper

printf 'Updating pkgfile cache...\n'
pkgfile --update

printf 'Setting up network...\n'
ip link
printf 'Please enter the wired interface name: '
read wirediface
if [ ! "x$wirediface" == x ]; then
    systemctl enable "netctl-ifplugd@$wirediface.service"
    systemctl enable "dhcpcd@$wirediface.service"
fi
printf 'Please enter the wireless interface name: '
read wirelessiface
if [ ! "x$wirelessiface" == x ]; then
    systemctl enable "netctl-auto@$wirelessiface.service"
    systemctl enable "dhcpcd@$wirelessiface.service"
fi
mkdir -p /etc/systemd/system/dhcpcd@.service.d/
printf '[Service]\nRestart=always\n' > /etc/systemd/system/dhcpcd@.service.d/dhcpcdrestart.conf

printf 'Please set a root password.\n'
passwd

mode="$1"
while [ "$mode" != "UEFI" ] && [ "$mode" != "BIOS" ]; do
  printf 'Would you like to install as UEFI or BIOS? '
  read mode
done

printf 'Setting up bootloader...\n'
rootpart=$(cat /etc/fstab | grep '\s/\s' | sed -re 's/\s.*//')
if [ "$mode" == "UEFI" ]; then
  pacman -S refind-efi
  refind-install
else
  pacman -S grub
  grub-install --target=i386-pc --recheck /dev/sda # TODO
  grub-mkconfig -o /boot/grub/grub.cfg
fi

echo Pre-boot configuration complete!
