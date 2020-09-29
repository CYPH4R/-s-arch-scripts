#!/bin/bash

# Hands-free bash script for installing most non core Arch packages for quick setups.
# Also sets up main user with home directory, wheel group for sudo, and basic xorg/X11 configuration.

ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc
echo "LANG=en_US.UTF-8" > /etc/locale.conf
locale-gen
echo "KEYMAP=de-latin1" > /etc/vconsole.conf
echo "ThinkPad" > /etc/hostname
printf "127.0.0.1\t localhost\n::1 \t \t localhost\n127.0.1.1\t ThinkPad.localdomain Thinkpad" > /etc/hosts
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
passwd
useradd -aG wheel cypher
passwd cypher
