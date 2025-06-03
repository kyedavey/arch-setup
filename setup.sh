set -e

echo "Cloning Arch Setup..."
git clone https://github.com/kyedavey/arch-setup.git ~/code/arch-setup >/dev/null

source ~/code/arch-setup/install.sh

echo "Setup complete"