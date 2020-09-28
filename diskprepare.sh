#!/bin/sh

# Partitons /dev/sda in preparation for Arch installation
# Creates Boot partition and Linux Swap partition

parted -s /dev/sda mklabel msdos mkpart primary ext4 0% 90% set 1 boot on
mkfs.ext4 /dev/sda1
parted -s /dev/sda mkpart primary linux-swap 90% 100%
mkswap /dev/sda2
mount /dev/sda1 /mnt
swapon /dev/sda2
pacstrap /mnt base base-devel linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc
echo "LANG=en_US.UTF-8" > /etc/locale.conf
locale-gen
echo "KEYMAP=de-latin1" > /etc/vconsole.conf
