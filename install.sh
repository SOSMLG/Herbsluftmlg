#!/bin/bash

set -e

echo "📦 Updating system and installing core packages..."
sudo apt update && sudo apt install -y \
    build-essential libfreetype6-dev libxft-dev libxinerama-dev libx11-dev libxcb1-dev \
    libharfbuzz-dev xserver-xorg xbacklight xbindkeys xvkbd xinit dbus xinput gcc \
    flameshot make binutils picom git network-manager herbstluftwm kitty \
    thunar-archive-plugin thunar-volman xarchiver lxappearance dialog mtools avahi-daemon \
    acpi acpid gvfs xfce4-power-manager pulseaudio pavucontrol pulsemixer feh \
    papirus-icon-theme exa maim dunst xdotool unzip micro geany geany-plugins redshift \
    firefox-esr vlc fonts-font-awesome fonts-terminus libnotify-bin sddm \
    firmware-iwlwifi firmware-misc-nonfree libxcb-res0-dev libx11-xcb-dev \
    fonts-arabeyes fonts-kacst fonts-kacst-one fonts-sil-scheherazade fonts-sil-lateef \
    polybar rofi fonts-noto-color-emoji curl wget ranger brightnessctl zathura zathura-pdf-poppler

echo "Actiavting Services"
sudo ln -sf /etc/sv/dbus /var/service
sudo ln -sf /etc/sv/network-manager /var/service
sudo ln -sf /etc/sv/sddm /var/service 
sudo sv up dbus
sudo sv up sdddm 
sudo sv up network-manager

echo "🎨 Creating fonts directory..."
mkdir -p ~/.local/share/fonts

echo "🔠 Downloading JetBrainsMono Nerd Font..."
cd ~/.local/share/fonts
wget -q https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -q JetBrainsMono.zip
rm JetBrainsMono.zip

echo "🔄 Refreshing font cache..."
fc-cache -fv

echo "💻 Installing Oh My Bash..."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

echo "✅ Done! You can now configure Alacritty, Polybar, and Rofi with full font/icon support."

echo "🚀 Suggested Next Step:"
echo "• Set Alacritty font to: JetBrainsMono Nerd Font"
echo "• Set Polybar fallback fonts to: Font Awesome 6 Free / Brands"
