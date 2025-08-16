# 🌌 Finalize Ubuntu An **intelligent installation script** for Ubuntu. It automatically sets up your system with Flatpak, Snap, GRUB customization, essential applications, and even a custom wallpaper. --- ## ✨ Features - 📦 Installs and configures **Flatpak** with Flathub - 📦 Installs popular **Snap applications** (Spotify, Discord, Steam, Opera, Minecraft launcher, etc.) - 🎮 Installs Flatpak apps like PrismLauncher, Dolphin Emulator, Citra, Sober - 🎨 Applies a **custom GRUB theme** - 🖼️ Optionally sets your **wallpaper** from the wallpeper/ folder --- ## 🔧 How to use Clone the repository and run the script:
bash
git clone https://github.com/Louchat/finalize-ubuntu.git
cd finalize-ubuntu
chmod +x finalize.sh
./finalize.sh

🖼️ Wallpaper

You can put your wallpapers inside the wallpeper/ folder.
By default, the script will try to apply:

$(pwd)/wallpeper/wallpeper.jpg

If you are using GNOME, you can uncomment the following line in the script to apply it automatically:

gsettings set org.gnome.desktop.background picture-uri "file://$wallpaper_path"

⚠️ Requirements

    Ubuntu-based distribution (tested on Ubuntu 22.04+)

    sudo privileges

🌟 Enjoy your setup!

This script is designed to make post-installation faster, easier, and smarter 🚀
