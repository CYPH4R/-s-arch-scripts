#!/bin/sh

# Partitons /dev/sda in preparation for Arch installation
# Creates Boot partition and Linux Swap partition

parted -s /dev/sda mklabel msdos mkpart primary ext2 0% 90% set 1 boot on
parted -s /dev/sda mkpart primary linux-swap 90% 100%
