#!/bin/bash

# Partitons /dev/sda in preparation for Arch installation
# Creates Boot partition and Linux Swap partition

parted -s /dev/sda mklabel msdos mkpart primary ext4 0% 100% set 1 boot on
mkfs.ext4 /dev/sda1
mount /dev/sda1 /mnt
pacstrap /mnt base base-devel linux linux-firmware grub sudo
genfstab -U /mnt >> /mnt/etc/fstab
cp ./lazy.bash /mnt/lazy.bash
cp ./yay-installer.bash /mnt/yay-installer.bash
cp ./packages.txt /mnt/packages.txt
chmod +x /mnt/lazy.bash
chmod +x /mnt/yay-installer.bash
arch-chroot /mnt ./lazy.bash
#umount /mnt
#reboot
