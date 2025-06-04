set -e

REPO_NAME="arch-setup"
REPO_LOCAL_LOCATION="${HOME}/code/${REPO_NAME}"

echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers

echo "Installing Git"
sudo pacman -S --noconfirm --needed base-devel git

echo -e "\nCloning ${REPO_NAME}..."
git clone https://github.com/kyedavey/${REPO_NAME}.git ${REPO_LOCAL_LOCATION} >/dev/null
cd ${REPO_LOCAL_LOCATION}
source install.sh

sudo sed -i "s/$USER ALL=(ALL) NOPASSWD: ALL//g" /etc/sudoers

echo "Setup complete"