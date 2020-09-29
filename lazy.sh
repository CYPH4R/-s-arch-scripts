#!/bin/sh

# Hands-free bash script for installing most non core Arch packages for quick setups.
# Also sets up main user with home directory, wheel group for sudo, and basic xorg/X11 configuration.

ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc
echo "LANG=en_US.UTF-8" > /etc/locale.conf
locale-gen
echo "KEYMAP=de-latin1" > /etc/vconsole.conf
echo "ThinkPad" > /etc/hosname
echo -e "127.0.0.1\t localhost" "::1 \t \t localhost" "127.0.1.1\t ThinkPad.localdomain Thinkpad" > /etc/hosts
