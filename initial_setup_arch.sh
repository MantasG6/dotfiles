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
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ../
rm -rf yay
yay -S --needed --noconfirm ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite libxrender libxcuror pixman wayland-protocols cairo pango libxkbcommon xcb-util-wm xorg-xwayland libinput libliftoff libdisplay-info cpio tomlplusplus hyprlang-git hyprcursor-git hyprwayland-scanner-git xcb-util-errors hyprutils-git glaze hyprgraphics-git aquamarine-git re2 hyprland-qtutils-git
git clone --recursive https://github.com/hyprwm/Hyprland
cd Hyprland
make all && sudo make install
cd ../
rm -rf Hyprland
sudo pacman -S --needed --noconfirm kitty
sudo pacman -S --needed --noconfirm linux-zen-headers
sudo pacman -S --needed --noconfirm nvidia-dkms
echo -e "options nvidia_drm modeset=1" | sudo tee -a /etc/modprobe.d/nvidia.conf
sudo pacman -S --needed --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-atkinson-hyperlegible ttf-firacode-nerd
sudo pacman -S --needed --noconfirm mako
mkdir .config/mako
cp ./conf/mako .config/mako/config
makoctl reload
mkdir -p ~/.local/share/dbus-1/services
echo -e "[D-BUS Service]\nName=org.freedesktop.Notifications\nExec=/usr/bin/mako" | sudo tee -a ~/.local/share/dbus-1/services/org.freedesktop.Notifications.service
sudo pacman -S --needed --noconfirm libnotify
pkill dunst
notify-send "Helo from D-Bus activation!"
sudo pacman -S --needed --noconfirm xdg-desktop-portal-hyprland
paru -S --needed --noconfirm nwg-look hyprqt6engine
sudo pacman -S --needed --noconfirm qt6-wayland qt5-wayland
sudo pacman -S --needed --noconfirm xdg-desktop-portal-gtk
sudo pacman -S --needed --noconfirm greetd
paru -S --needed --noconfirm hyprpolkitagent
sudo pacman -S --needed --noconfirm brightnessctl
sudo pacman -S --needed --noconfirm playerctl
echo "alias ll='ls -la'" | sudo tee -a ~/.bashrc
sudo pacman -S --needed --noconfirm greetd-tuigreet
sudo cp ./conf/greetd-config.toml /etc/greetd/config.toml
sudo systemctl enable greetd.service
sudo pacman -S --needed --noconfirm wofi
mkdir ~/.config/wofi
cp ./conf/wofi/config ~/.config/wofi/config
cp ./conf/wofi/style.css ~/.config/wofi/style.css
sudo pacman -S --needed --noconfirm hypridle
cp ./conf/hypr/hypridle.conf ~/.config/hypr/hypridle.conf
sudo pacman -S --needed --noconfirm hyprpaper
cp -r ./wallpapers ~/Pictures/wallpapers
cp ./conf/hypr/hyprpaper.conf ~/.config/hypr/hyprpaper.conf
sudo pacman -S --needed --noconfirm imagemagick
sudo pacman -S --needed --noconfirm hyprlock
cp ./conf/faillock.conf /etc/security/faillock.conf
cp -r ./conf/hypr/scripts ~./config/hypr/
cp ./conf/hypr/hyprlock.conf ~/.config/hypr/hyprlock.conf
sudo pacman -S --needed --noconfirm spotify-launcher # edit /etc/spotify-launcher.conf to fix issues
sudo pacman -S --needed --noconfirm gimp
sudo pacman -S --needed --noconfirm hyprsunset
paru -S --needed --noconfirm google-chrome
sudo pacman -S --needed --noconfirm zip unzip
mkdir ~/.local/share/icons # move cursor here and set with nwg-look
cp -r ./Red-C ~/.local/share/icons
sudo pacman -S --needed --noconfirm waybar
cp -r ./conf/waybar ~/.config/
sudo pacman -S --needed --noconfirm otf-font-awesome
sudo usermod -aG input $(whoami)
sudo pacman -S --needed --noconfirm pavucontrol
sudo pacman -S --needed --noconfirm bluetui
sudo pacman -S --needed --noconfirm impala
sudo pacman -S --needed --noconfirm fastfetch
