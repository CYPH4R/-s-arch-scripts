#!/bin/bash

# Partitons /dev/sda in preparation for Arch installation
# Creates Boot partition and Linux Swap partition

parted -s /dev/sda mklabel msdos mkpart primary ext4 0% 100% set 1 boot on
mkfs.ext4 /dev/sda1
mount /dev/sda1 /mnt
pacstrap /mnt base base-devel linux linux-firmware vim git grub sudo xorg xorg-xinit nvidia nitrogen picom xmonad firefox networkmanager
genfstab -U /mnt >> /mnt/etc/fstab
cp ./lazy.bash /mnt/lazy.bash
chmod +x /mnt/lazy.bash
arch-chroot /mnt ./lazy.bash
#umount -af
#reboot
