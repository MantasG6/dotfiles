sudo pacman -S --needed --noconfirm base-devel git
# For man choose 1st option (man-db)
sudo pacman -S --needed --noconfirm man
sudo pacman -S --needed --noconfirm nvim
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
sudo pacman -S --needed --noconfirm kitty
sudo pacman -S --needed --noconfirm linux-zen-headers
# Uncomment if using Nvidia
# sudo pacman -S --needed --noconfirm nvidia-dkms
# echo -e "options nvidia_drm modeset=1" | sudo tee -a /etc/modprobe.d/nvidia.conf
sudo pacman -S --needed --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-atkinson-hyperlegible ttf-firacode-nerd
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
echo "alias ll='ls -laF'" | sudo tee -a ~/.bashrc
sudo pacman -S --needed --noconfirm greetd-tuigreet
sudo systemctl enable greetd.service
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
# Make bluetooth fast when charging
sudo cp ./conf/bt-fast-conn/toggle_bt_fast_connect.sh /usr/local/bin/
sudo chmod 775 /usr/local/bin/toggle_bt_fast_connect.sh
sudo cp ./conf/bt-fast-conn/99-bt-power.rules /etc/udev/rules.d/
sudo cp ./conf/bt-fast-conn/bt-fast-conn.service /etc/systemd/system/bt-fast-conn.service
sudo cp ./conf/bt-fast-conn/bt-fast-conn /usr/lib/systemd/system-sleep/bt-fast-conn
sudo chmod 775 /usr/lib/systemd/system-sleep/bt-fast-conn
sudo chown root:root /etc/udev/rules.d/99-bt-power.rules
sudo chown root:root /etc/systemd/system/bt-fast-conn.service
sudo chown root:root /usr/lib/systemd/system-sleep/bt-fast-conn
sudo chown root:root /usr/local/bin/toggle_bt_fast_connect.sh
sudo udevadm control --reload
sudo systemctl daemon-reload
# Uncomment if you use fingerprint
#sudo pacman -S --needed --noconfirm fprintd
#paru -S --needed --noconfirm pam-fprint-grosshack
# Copy over the configurations
cp -r ./conf/mako ~/.config/
sudo cp -r ./conf/greetd /etc/
cp -r ./conf/wofi ~/.config/
cp -r ./wallpapers ~/Pictures/
mkdir ~/.local/share/icons 
cp -r ./Red-C ~/.local/share/icons/
cp -r ./conf/waybar ~/.config/
cp -r ./conf/hypr ~/.config/
cp -r ./conf/fastfetch ~/.config/
sudo cp ./conf/faillock.conf /etc/security/
cp -r ./conf/nwg-look ~/.local/share/
cp -r ./conf/qt5ct ~/.config/
cp -r ./conf/qt6ct ~/.config/
cp -r ./conf/procps ~/.config/
# Fingerprint configurations. Uncomment if you use fingerprint
#sudo cp ./conf/fprint/50-net.reactivated.fprint.device.enroll.rules /etc/polkit-1/rules.d/
#sudo cp ./conf/fprint/hyprlock /etc/pam.d/
#sudo cp ./conf/fprint/sudo /etc/pam.d/
#sudo cp ./conf/fprint/su /etc/pam.d/
