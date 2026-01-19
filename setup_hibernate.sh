#!/bin/bash

# Create the subvolume for swap
btrfs subvolume create /swap

# Create swap file
btrfs filesystem mkswapfile --size 34g --uuid clear /swap/swapfile

# Add swap entry to fstab
echo -e "\n#For the swap file (hibernate configuration)\n/swap/swapfile none swap defaults,pri=10 0 0" | sudo tee -a /etc/fstab

# Activate swap file
swapon -a

# Set HOOKS containting systemd for automatic resume
vi /etc/mkinitcpio.conf 

# regenerate all unified kernel images:
sudo mkinitcpio -P
