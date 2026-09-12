sudo pacman -Syu
sudo pacman -S --needed --noconfirm base-devel git
# For man choose 1st option (man-db)
sudo pacman -S --needed --noconfirm man
sudo pacman -S --needed --noconfirm nvim
sudo pacman -S --needed --noconfirm tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo pacman -S --needed --noconfirm wget
sudo pacman -S --needed --noconfirm xdg-user-dirs
xdg-user-dirs-update
cd ~/Downloads
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ../
rm -rf paru
sudo pacman -S --needed --noconfirm hyprland
sudo pacman -S --needed --noconfirm ghostty
sudo pacman -S --needed --noconfirm linux-zen-headers
# Uncomment if using Nvidia
# sudo pacman -S --needed --noconfirm nvidia-dkms
# echo -e "options nvidia_drm modeset=1" | sudo tee -a /etc/modprobe.d/nvidia.conf
sudo pacman -S --needed --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-atkinson-hyperlegible ttf-firacode-nerd ttf-jetbrains-mono-nerd
sudo pacman -S --needed --noconfirm mako
mkdir -p ~/.local/share/dbus-1/services
echo -e "[D-BUS Service]\nName=org.freedesktop.Notifications\nExec=/usr/bin/mako" | sudo tee -a ~/.local/share/dbus-1/services/org.freedesktop.Notifications.service
sudo pacman -S --needed --noconfirm libnotify
sudo pacman -S --needed --noconfirm xdg-desktop-portal-hyprland
paru -S --needed --noconfirm nwg-look
sudo pacman -S --needed --noconfirm qt6ct qt5ct
sudo pacman -S --needed --noconfirm xdg-desktop-portal-gtk
sudo pacman -S --needed --noconfirm greetd
paru -S --needed --noconfirm hyprpolkitagent
sudo pacman -S --needed --noconfirm brightnessctl
sudo pacman -S --needed --noconfirm playerctl
sudo pacman -S --needed --noconfirm greetd-tuigreet
sudo systemctl enable greetd.service
# Setup Login screen
sh ~/dotfiles/.other/setup_login.sh
sudo pacman -S --needed --noconfirm wofi
sudo pacman -S --needed --noconfirm hypridle
sudo pacman -S --needed --noconfirm hyprpaper
sudo pacman -S --needed --noconfirm imagemagick
sudo pacman -S --needed --noconfirm hyprlock
sudo pacman -S --needed --noconfirm spotify-launcher
sudo pacman -S --needed --noconfirm gimp
sudo pacman -S --needed --noconfirm hyprsunset
sudo pacman -S --needed --noconfirm firefox
paru -S --needed --noconfirm google-chrome
# Set chrome defaults to firefox instead
grep "MimeType" /usr/share/applications/com.google.Chrome.desktop \
  | tr ';' '\n' \
  | grep -v "^MimeType=" \
  | grep -v "^$" \
  | xargs -I{} xdg-mime default firefox.desktop {}
sudo pacman -S --needed --noconfirm zip unzip
sudo pacman -S --needed --noconfirm waybar
sudo pacman -S --needed --noconfirm otf-font-awesome
sudo usermod -aG input $(whoami)
sudo pacman -S --needed --noconfirm pavucontrol
sudo pacman -S --needed --noconfirm bluetui
sudo pacman -S --needed --noconfirm impala
sudo pacman -S --needed --noconfirm fastfetch
sudo pacman -S --needed --noconfirm openssh
sudo pacman -S --needed --noconfirm usbutils
sudo pacman -S --needed --noconfirm bluez-utils
sudo pacman -S --needed --noconfirm bat
sudo pacman -S --needed --noconfirm zsh
chsh -s $(which zsh)
curl -s https://ohmyposh.dev/install.sh | bash -s
sudo pacman -S --needed --noconfirm stow
sudo pacman -S --needed --noconfirm ripgrep
sudo pacman -S --needed --noconfirm grim slurp swappy
sudo pacman -S --needed --noconfirm fd
paru -S --needed --noconfirm miraclecast-git
sudo pacman -S --needed --noconfirm npm
sudo pacman -S --needed --noconfirm yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick
ya pkg add BennyOe/tokyo-night
sudo pacman -S --needed --noconfirm transmission-gtk
sudo pacman -S --needed --noconfirm vlc
sudo pacman -S --needed --noconfirm vlc-plugins-all
curl -s "https://get.sdkman.io" | bash
sudo pacman -S --needed --noconfirm docker docker-compose
sudo ln -sf /usr/bin/iptables-legacy /usr/local/bin/iptables
sudo ln -sf /usr/bin/ip6tables-legacy /usr/local/bin/ip6tables
sudo pacman -S --needed --noconfirm openvpn
sudo pacman -S --needed --noconfirm postgresql
# follow https://wiki.archlinux.org/title/ProtonVPN to finish installing ProtonVPN
sudo pacman -S --needed --noconfirm rsync # cp with progress
paru -S --needed --noconfirm jmtpfs # to connect android phone through USB
sudo pacman -S --needed --noconfirm kdenlive # video editor
# Link configurations
stow -t ~/ -d ~/dotfiles .
stow -t ~/.config -d ~/dotfiles .config
mkdir ~/.local/share/icons 
ln -s ~/dotfiles/.other/Red-C ~/.local/share/icons
ln -s ~/dotfiles/.other/nwg-look ~/.local/share
# Make bluetooth fast when charging
sh ~/dotfiles/.other/bt-fast-conn/setup_bt-fast-conn.sh
# Fingerprint setup
sh ~/dotfiles/.other/fprint/setup_fprint.sh
