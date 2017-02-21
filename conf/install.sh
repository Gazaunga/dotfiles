#!/bin/bash
printf 'In which directory are the configuration files located? (.) '
read $HOME
[ "x$HOME" == x ] && $HOME=.

hasparttable=
while [ "$hasparttable" != Y ] && [ "$hasparttable" != N ]; do
  printf 'Is the disk you wish to install on already partitioned? (y/N) '
  read hasparttable
  [ "x$hasparttable" == x ] && hasparttable=N
  [ "$hasparttable" == n ] && hasparttable=N
  [ "$hasparttable" == y ] && hasparttable=Y
done
haspart=
[ $hasparttable == N ] && haspart=N
while [ "$haspart" != Y ] && [ "$haspart" != N ]; do
  printf 'Are the partitions you wish to install on already prepared? (y/N) '
  read haspart
  [ "x$haspart" == x ] && haspart=N
  [ "$haspart" == n ] && haspart=N
  [ "$haspart" == y ] && haspart=Y
done
mode=
while [ "$mode" != UEFI ] && [ "$mode" != BIOS ]; do
  printf 'Would you like to install for UEFI or BIOS? '
  read mode
done
if [ $hasparttable == N ]; then
  printf 'Please enter the name of the device you wish to freshly partition: '
  read devname
  sizebytes="$(blockdev --getsize64 "$devname")"
  sizemibs="$((sizebytes/1048576))"
  printf 'How many GiB of swap space do you want? (0) '
  read swapgibs
  [ "x$swapgibs" == x ] && swapgibs=0
  swapmibs="$((swapgibs*1024))"
  mainend="$((sizemibs-swapmibs))"
  if [ $mode == BIOS ]; then
    parted -a optimal "$devname" mklabel msdos
    parted -a optimal "$devname" mkpart primary ext4 0% "$mainend"MiB
    if [ "$swapmibs" -gt 0 ]; then
      parted -a optimal "$devname" mkpart primary linux-swap "$mainend"MiB 100%
      swapon "$devname"2
    fi
    parted -a optimal "$devname" set 1 boot on
    efipart=
    mainpart="$devname"1
  else
    parted -a optimal "$devname" mklabel gpt
    parted -a optimal "$devname" mkpart ESP fat32 1MiB 513MiB
    parted -a optimal "$devname" mkpart primary ext4 513MiB "$mainend"MiB
    if [ "$swapmibs" -gt 0 ]; then
      parted -a optimal "$devname" mkpart primary linux-swap "$mainend"MiB 100%
      swapon "$devname"3
    fi
    parted -a optimal "$devname" set 1 boot on
    efipart="$devname"1
    mainpart="$devname"2
  fi
  homepart=
else
  if [ $mode == BIOS ]; then
    printf 'Which partition is the primary partition? (/dev/sda1) '
    read mainpart
    [ "x$mainpart" == x ] && mainpart=/dev/sda1
    efipart=
  else
    printf 'Which partition is the primary partition? (/dev/sda2) '
    read mainpart
    [ "x$mainpart" == x ] && mainpart=/dev/sda2
    printf 'Which partition is the EFI partition? (/dev/sda1) '
    read efipart
    [ "x$efipart" == x ] && efipart=/dev/sda1
  fi
  printf 'Which partition is the home partition? (empty for none) '
  read homepart
fi
if [ $haspart == N ]; then
  printf 'Where should the target filesystem be mounted? (/mnt) '
  read mntdir
  [ "x$mntdir" == x ] && mntdir=/mnt
  mkfs -t ext4 "$mainpart"
  mount "$mainpart" /mnt
  if [ "x$efipart" != x ]; then
    mkfs.fat -F32 "$efipart"
    mkdir -p /mnt/boot
    mount "$efipart" /mnt/boot
  fi
  if [ "x$homepart" != x ]; then
    mkfs -t ext4 "$homepart"
    mkdir -p /mnt/home
    mount "$homepart" /mnt/home
  fi
else
  printf 'Please make sure to swapon and mount target /, /home, and /boot as needed.\nWhere is the target filesystem mounted? (/mnt) '
  read mntdir
  [ "x$mntdir" == x ] && mntdir=/mnt
fi

printf 'Copying mirrorlist...\n'
tmpfile="$(mktemp)"
printf 'Server = http://mirror.csclub.uwaterloo.ca/archlinux/$repo/os/$arch\n\n' | cat - /etc/pacman.d/mirrorlist >"$tmpfile" && mv "$tmpfile" /etc/pacman.d/mirrorlist

printf 'Updating archlinux-keyring...\n'
pacman -Sy archlinux-keyring

printf 'Installing base system...\n'
pacstrap -i "$mntdir" base

printf 'Generating fstab...\n'
genfstab -U -p "$mntdir" >> "$mntdir/etc/fstab"
printf '\e[31mREMEMBER\e[39m: check the fstab before rebooting.\n'

printf 'Configuring time settings...\n'
ln -s /usr/share/zoneinfo/Canada/Eastern "$mntdir/etc/localtime"
hwclock --systohc --utc

printf 'Please choose a hostname for the newly installed system: '
read newhostname
printf '%s\n' "$newhostname" > "$mntdir/etc/hostname"

printf 'Chrooting into installed system...\n'
arch-chroot "$mntdir" /bin/sh ~/preboot.sh "$mode"

printf 'Installation complete! Please run `umount -R %s` and reboot.\n' "$mntdir"
