#!/bin/bash

set -e

echo "🌌 Starting Finalize Arch script..."

# ----------------------------
# Confirmation
# ----------------------------
read -rp "Do you want to start the installation? [Y/N] " choice
if [[ ! $choice =~ ^[YyOo]$ ]]; then
    echo "❌ Installation cancelled."
    exit 0
fi

# ----------------------------
# Functions
# ----------------------------

install_pacman_packages() {
    echo "📦 Installing base packages via pacman..."
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm \
        flatpak \
        git \
        base-devel \
        cmatrix \
        cava \
        fastfetch \
        dolphin \
        fish
    echo "✅ Pacman packages installed"
}

install_yay() {
    if ! command -v yay &>/dev/null; then
        echo "⬇️ Installing yay (AUR helper)..."
        git clone https://aur.archlinux.org/yay.git /tmp/yay
        cd /tmp/yay || exit
        makepkg -si --noconfirm
        cd - || exit
        rm -rf /tmp/yay
        echo "✅ yay installed"
    else
        echo "✅ yay already installed"
    fi
}

add_flathub() {
    if ! flatpak remotes | grep -q flathub; then
        echo "🛰️ Adding Flathub repository..."
        sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    else
        echo "✅ Flathub already configured"
    fi
}

install_flatpak_apps() {
    echo "⬇️ Installing Flatpak applications..."
    apps=(
        # From your original list
        "org.prismlauncher.PrismLauncher"
        "org.DolphinEmu.dolphin-emu"
        "org.citra_emu.citra"
        "org.vinegarhq.Sober"

        # Replacing Snap apps with Flatpak equivalents
        "com.opera.Opera"
        "com.spotify.Client"
        "com.discordapp.Discord"
        "com.valvesoftware.Steam"
        "com.mojang.Minecraft"
    )
    for app in "${apps[@]}"; do
        if flatpak list | grep -q "$app"; then
            echo "   ✅ $app already installed"
        else
            echo "   ⬇️ Installing $app..."
            flatpak install -y flathub "$app"
        fi
    done
}

set_grub_timeout() {
    grub_file="/etc/default/grub"
    if grep -q 'GRUB_TIMEOUT=-1' "$grub_file"; then
        echo "✅ GRUB timeout already set to -1"
    else
        echo "⏳ Setting GRUB timeout to -1..."
        sudo sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=-1/' "$grub_file"
        sudo grub-mkconfig -o /boot/grub/grub.cfg
    fi
}

install_grub_theme() {
    theme_dir="/boot/grub/themes/Cipher"
    if [ -d "$theme_dir" ]; then
        echo "✅ GRUB theme 'Cipher' already installed"
    else
        echo "🎨 Installing GRUB theme 'Cipher'..."
        git clone https://github.com/voidlhf/StarRailGrubThemes.git /tmp/StarRailGrubThemes
        sudo mkdir -p /boot/grub/themes
        sudo cp -r /tmp/StarRailGrubThemes/assets/themes/Cipher /boot/grub/themes/
        sudo sed -i 's|^GRUB_THEME=.*|GRUB_THEME="/boot/grub/themes/Cipher/theme.txt"|' /etc/default/grub
        sudo grub-mkconfig -o /boot/grub/grub.cfg
        rm -rf /tmp/StarRailGrubThemes
    fi
}

# ----------------------------
# Execution
# ----------------------------

install_pacman_packages
install_yay
add_flathub
install_flatpak_apps
set_grub_timeout
install_grub_theme

echo "🌟 Finalize Arch script completed! Enjoy your setup 🚀"
read -n 1 -s -r -p "Press any key to exit..."
echo
