#!/bin/bash

# Hands-free bash script for installing most non core Arch packages for quick setups.
# Also sets up main user with home directory, wheel group for sudo, and basic xorg/X11 configuration.


ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc
sed -i "s/#LANG=en_US.UTF-8 UTF-8/LANG=en_US.UTF-8 UTF-8/" /etc/locale.conf
locale-gen
printf "KEYMAP=de-latin1" > /etc/vconsole.conf
printf "ThinkPad" > /etc/hostname
printf "127.0.0.1\t localhost\n::1 \t \t localhost\n127.0.1.1\t ThinkPad.localdomain ThinkPad" > /etc/hosts
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
passwd
useradd -mG wheel cypher
passwd cypher
sed -i "s/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/" /etc/sudoers
sed -i "s/# Defaults!REBOOT !log_output/# Defaults!REBOOT !log_output\nDefaults insults/" /etc/sudoers
git clone https://aur.archlinux.org/yay-git.git /home/cypher/yay-git
chmod -v a+rwx /home/cypher/yay-git
su -c "cd /home/yay-git/ && makepkg -si" cypher
yay -S spectrwm
head -n -5 /etc/X11/xinit/xinitrc > /home/cypher/.xinitrc
printf "nitrogen --restore &\npicom &\nexec spectrwm" >> /home/cypher/.xinitrc
#exit
