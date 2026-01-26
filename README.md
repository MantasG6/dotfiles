# ISO
Before installing be sure to download new ISO and mount it. Arch Linux keys are rolled every 3 months so old one will not pass the authentication!

# Use archinstall:
- Mirrors and repositories: choose Worldwide
- Disk configuration: Partitioning. Use a best-effort default partitioning layout. Choose btrfs, compression (yes on CoW)
- Swap: Swap on zram: Enabled
- Bootloader: Systemd-boot
- UKI: Yes
- Hostname: your computer name
- Authentication: create your user
- Profile: minimal
- Applications: Bluetooth: Enabled; Audio: pipewire
- Kernels: linux-zen only
- Network configuration: don't use Network Manager, set up the same as iso (install)
- NTP Enabled

# fix Spotify
edit /etc/spotify-launcher.conf

# Use initial_setup_arch.sh to do the rest
