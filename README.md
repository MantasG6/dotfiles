# Use archinstall:
- Mirrors and repositories: choose US
- Disk configuration: Partitioning. Use a best-effort default partitioning layout. Choose btrfs, compression (yes on CoW)
- Swap: Swap on zram: Enabled
- Bootloader: Systemd-boot
- UKI: Yes
- Hostname: your computer name
- Authentication: create your user
- Profile: minimal
- Applications: Bluetooth: Enabled; Audio: pipewire
- Kernels: linux-zen only
- Network configuration: use NetworkManager
- NTP Enabled

# Move files to appropriate locations
- faillock.conf goes to /etc/security/faillock.conf
- greetd/config.toml goes to /etc/greetd/config.toml
- wallpapers go to ~/Pictures/wallpapers

# Use initial_setup_arch.sh to do the rest
