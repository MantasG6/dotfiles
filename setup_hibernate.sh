#!/bin/bash

# Create the subvolume for swap
sudo btrfs subvolume create /swap

# Create swap file
sudo btrfs filesystem mkswapfile --size 34g --uuid clear /swap/swapfile

# Add swap entry to fstab
echo -e "\n#For the swap file (hibernate configuration)\n/swap/swapfile none swap defaults,pri=10 0 0" | sudo tee -a /etc/fstab

# Activate swap file
sudo swapon -a

# Set HOOKS containting systemd for automatic resume
sudo nvim /etc/mkinitcpio.conf 

# regenerate all unified kernel images:
sudo mkinitcpio -P
