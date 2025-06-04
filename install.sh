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
# sudo systemctl enable gdm.service

# # Configure Gnome

# ## Set gnome bar apps
# gsettings set org.gnome.shell favorite-apps "['Alacritty.desktop', 'google-chrome.desktop',  'code.desktop']"

# ## Set Wallpaper
# BACKGROUND_ORG_PATH="$HOME/code/arch-setup/assets/background.jpg"
# BACKGROUND_DEST_DIR="$HOME/.local/share/backgrounds"
# BACKGROUND_DEST_PATH="$BACKGROUND_DEST_DIR/background.jpg"

# if [ ! -d "$BACKGROUND_DEST_DIR" ]; then mkdir -p "$BACKGROUND_DEST_DIR"; fi

# [ ! -f $BACKGROUND_DEST_PATH ] && cp $BACKGROUND_ORG_PATH $BACKGROUND_DEST_PATH
# gsettings set org.gnome.desktop.background picture-uri $BACKGROUND_DEST_PATH
# gsettings set org.gnome.desktop.background picture-uri-dark $BACKGROUND_DEST_PATH
# gsettings set org.gnome.desktop.background picture-options 'zoom'

# ## Gnome Shell User Theme
# GNOME_CSS_ORG_PATH="$HOME/code/arch-setup/assets/gnome-shell.css"
# GNOME_CSS_DEST_DIR="$HOME/.themes/everforest/gnome-shell"
# GNOME_CSS_DEST_PATH="$GNOME_CSS_DEST_DIR/gnome-shell.css"

# if [ ! -d "$GNOME_CSS_DEST_DIR" ]; then mkdir -p "$GNOME_CSS_DEST_DIR"; fi

# [ ! -f $GNOME_CSS_DEST_PATH ] && cp $GNOME_CSS_ORG_PATH $GNOME_CSS_DEST_PATH
# gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
# gsettings set org.gnome.shell.extensions.user-theme name "everforest"

# ## Set Keybinds

# ### Fixed number of workspaces - 6
# gsettings set org.gnome.mutter dynamic-workspaces false
# gsettings set org.gnome.desktop.wm.preferences num-workspaces 6

# ### Full-screen with title/navigation bar
# gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Shift>F11']"

# ### Close Window
# gsettings set org.gnome.desktop.wm.keybindings close "['<Super>w']"

# ### Use alt for pinned apps
# gsettings set org.gnome.shell.keybindings switch-to-application-1 "['<Alt>1']"
# gsettings set org.gnome.shell.keybindings switch-to-application-2 "['<Alt>2']"
# gsettings set org.gnome.shell.keybindings switch-to-application-3 "['<Alt>3']"
# gsettings set org.gnome.shell.keybindings switch-to-application-4 "['<Alt>4']"
# gsettings set org.gnome.shell.keybindings switch-to-application-5 "['<Alt>5']"
# gsettings set org.gnome.shell.keybindings switch-to-application-6 "['<Alt>6']"
# gsettings set org.gnome.shell.keybindings switch-to-application-7 "['<Alt>7']"
# gsettings set org.gnome.shell.keybindings switch-to-application-8 "['<Alt>8']"
# gsettings set org.gnome.shell.keybindings switch-to-application-9 "['<Alt>9']"

# ### Use super for workspaces
# gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
# gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
# gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
# gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"
# gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Super>5']"
# gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 "['<Super>6']"

# ### Use shift super for move to workspaces
# gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Shift><Super>1']"
# gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Shift><Super>2']"
# gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Shift><Super>3']"
# gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Shift><Super>4']"
# gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Shift><Super>5']"
# gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 "['<Shift><Super>6']"

# ### Reserve slots for custom keybindings
# gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"

# ### Start a new alacritty window (rather than just switch to the already open one)
# gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'New Alacritty Window'
# gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'alacritty'
# gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Shift><Alt>1'

# ### Start a new Chrome window (rather than just switch to the already open one)
# gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'New Chrome Window'
# gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'google-chrome'
# gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Shift><Alt>2'

# Dotfiles

mkdir -p ~/.config/alacritty
mkdir -p ~/.config/zellij

ln -fs ~/code/arch-setup/dotfiles/.bashrc ~/.bashrc
ln -fs ~/code/arch-setup/dotfiles/.gitconfig ~/.gitconfig
ln -fs ~/code/arch-setup/dotfiles/.config/starship.toml ~/.config/starship.toml
ln -fs ~/code/arch-setup/dotfiles/.config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -fs ~/code/arch-setup/dotfiles/.config/zellij/config.kdl ~/.config/zellij/config.kdl