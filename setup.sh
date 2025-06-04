set -e

echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers

echo "Installing Git"
sudo pacman -S --noconfirm --needed base-devel git

echo "Cloning Arch Setup"
git clone https://github.com/kyedavey/arch-setup.git ~/code/arch-setup >/dev/null

source ~/code/arch-setup/install.sh

sudo sed -i "s/$USER ALL=(ALL) NOPASSWD: ALL//g" /etc/sudoers

echo "Setup complete"