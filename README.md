# Finalize Arch

Finalize Arch is an automated post-installation script for Arch Linux and Arch-based distributions.  
It installs and configures common components such as Flatpak, AUR support, essential applications, and a custom GRUB theme.

---

## Features

- Installs and configures Flatpak with Flathub
- Installs the following Flatpak applications:
  - PrismLauncher
  - Dolphin Emulator
  - Citra
  - Sober
  - Spotify
  - Discord
  - Steam
  - Opera
  - Minecraft Launcher
- Installs Dolphin file manager
- Installs `yay` for AUR support
- Applies a custom GRUB theme

---

## Requirements

- Arch Linux or an Arch-based distribution
- `sudo` privileges
- Active internet connection

---

## Installation

Clone the repository and run the script:

```bash
git clone https://github.com/Louchat/finalize-arch.git
```

## 2. Enter the project directory

```bash
cd finalize-arch
```

## 3. Make the script executable

```bash
chmod +x finalize.sh
```

## 4. Run the script

```bash
./finalize.sh
```

