#!/bin/bash

# Hands-free bash script for installing most non core Arch packages for quick setups.
# Also sets up main user with home directory, wheel group for sudo, and basic xorg/X11 configuration.

#Time setting
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc
#Locale-Gen
sed -i "s/#LANG=en_US.UTF-8 UTF-8/LANG=en_US.UTF-8 UTF-8/" /etc/locale.gen
locale-gen
#Console Keyboard Setting
printf "KEYMAP=de-latin1" > /etc/vconsole.conf
#Host config
printf "ThinkPad" > /etc/hostname
printf "127.0.0.1\t localhost\n::1 \t \t localhost\n127.0.1.1\t ThinkPad.localdomain ThinkPad" > /etc/hosts
#Grub install
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
#User Setup
clear
echo "Enter Root Password"
passwd
useradd -mG wheel cypher
clear
echo "Enter User Cypher Password"
passwd cypher
sed -i "s/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/" /etc/sudoers
sed -i "s/# Defaults!REBOOT !log_output/# Defaults!REBOOT !log_output\nDefaults insults/" /etc/sudoers
#Yay Download
git clone https://aur.archlinux.org/yay-git.git /home/cypher/yay-git
chmod -v a+rwx /home/cypher/yay-git
su -c "cd ~/yay-git/ ; makepkg -si" cypher
su -c "yay -S st" cypher
#Making X11/xorg config
head -n -5 /etc/X11/xinit/xinitrc > /home/cypher/.xinitrc
printf "nitrogen --restore &\npicom &\nexec xmonad" >> /home/cypher/.xinitrc
printf "Section \"InputClass\"\n\tIdentifier \"system-keybaord\"\n\tMatchIsKeyboard \"on\"\n\tOption \"XkbLayout\" \"de\"\nEndSection" > /etc/X11/xorg.conf.d/00-keyboard.conf
#Enable Automatic Networking
systemctl enable NetworkManager
exit
