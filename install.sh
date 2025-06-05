set -e

# Source the package list
if [ ! -f "config/packages.conf" ]; then
  echo "Error: packages.conf not found!"
  exit 1
fi

source config/packages.conf

# Update the system first
echo "Updating system..."
sudo pacman -Syu --noconfirm

# Installing paru
sudo pacman -S --noconfirm --needed base-devel
git clone https://aur.archlinux.org/paru.git /tmp/paru >/dev/null
cd /tmp/paru
makepkg -si --noconfirm
cd ~

# Install all Packages
for pkg in "${PKGS[@]}"; do
    paru -S --noconfirm --needed "$pkg"
done

# Enable required Services
sudo systemctl enable NetworkManager.service
sudo systemctl enable cosmic-greeter.service

# Dotfiles

DOTFILES_REMOTE="https://github.com/kyedavey/dotfiles"
DOTFILES_LOCAL="$HOME/code/dotfiles"

git clone $DOTFILES_REMOTE $DOTFILES_LOCAL

"$DOTFILES_LOCAL/dotfiles.sh" -f install alacritty
"$DOTFILES_LOCAL/dotfiles.sh" -f install bash
"$DOTFILES_LOCAL/dotfiles.sh" -f install cosmic
"$DOTFILES_LOCAL/dotfiles.sh" -f install git
"$DOTFILES_LOCAL/dotfiles.sh" -f install starship
"$DOTFILES_LOCAL/dotfiles.sh" -f install zellij