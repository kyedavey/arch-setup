packages=(
    "gnome"
    "gnome-tweaks"
    "networkmanager"
    "git"
    "fzf"
    "ripgrep"
    "bat"
    "eza"
    "zoxide"
    "plocate"
    "btop"
    "tldr"
    "fd"
    "fastfetch"
    "alacritty"
    "zellij"
    "ttf-cascadia-mono-nerd"
    "mise"
    "neovim"
    "docker"
    "github-cli"
    "starship"
    # AUR Packages
    "google-chrome"
    "visual-studio-code-bin"
    "lazydocker"
    "lazygit"
)

# Install all Packages
for pkg in "${packages[@]}"; do
    paru -S --noconfirm --needed "$pkg"
done

# Enable required Services
sudo systemctl enable NetworkManager.service
sudo systemctl enable gdm.service

# Configure Gnome

# Set gnome bar apps
gsettings set org.gnome.shell favorite-apps "['Alacritty.desktop', 'google-chrome.desktop',  'code.desktop']"

## Fixed number of workspaces - 6
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 6

# Full-screen with title/navigation bar
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Shift>F11']"

# Close Window
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>w']"

## Use alt for pinned apps
gsettings set org.gnome.shell.keybindings switch-to-application-1 "['<Alt>1']"
gsettings set org.gnome.shell.keybindings switch-to-application-2 "['<Alt>2']"
gsettings set org.gnome.shell.keybindings switch-to-application-3 "['<Alt>3']"
gsettings set org.gnome.shell.keybindings switch-to-application-4 "['<Alt>4']"
gsettings set org.gnome.shell.keybindings switch-to-application-5 "['<Alt>5']"
gsettings set org.gnome.shell.keybindings switch-to-application-6 "['<Alt>6']"
gsettings set org.gnome.shell.keybindings switch-to-application-7 "['<Alt>7']"
gsettings set org.gnome.shell.keybindings switch-to-application-8 "['<Alt>8']"
gsettings set org.gnome.shell.keybindings switch-to-application-9 "['<Alt>9']"

# Use super for workspaces
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Super>5']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 "['<Super>6']"

# Use shift super for move to workspaces
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Shift><Super>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Shift><Super>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Shift><Super>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Shift><Super>4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Shift><Super>5']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 "['<Shift><Super>6']"

# Reserve slots for custom keybindings
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"

# Start a new alacritty window (rather than just switch to the already open one)
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'New Alacritty Window'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'alacritty'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Shift><Alt>1'

# Start a new Chrome window (rather than just switch to the already open one)
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'New Chrome Window'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'google-chrome'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Shift><Alt>2'


