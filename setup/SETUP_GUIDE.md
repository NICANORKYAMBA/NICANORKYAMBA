# Modern DevOps Workstation Setup

This directory contains all configuration files for a modern, professional DevOps development environment on Kali Linux with XFCE.

## Quick Setup

### 1. Install Dependencies
```bash
sudo apt update
sudo apt install -y \
  git docker.io docker-compose kubectl curl wget \
  htop tmux jq unzip build-essential python3 python3-pip \
  nodejs npm minikube helm terraform awscli ansible \
  dracula-theme papirus-icon-theme breeze-gtk-theme darkmint-gtk-theme \
  zsh-syntax-highlighting zsh-autosuggestions redshift redshift-gtk \
  fonts-cascadia-code
```

### 2. Install Google Cloud SDK
```bash
curl https://sdk.cloud.google.com | bash
exec -l $SHELL
```

### 3. Restore Configurations

#### Shell Configuration
```bash
cp setup/configs/.zshrc ~/.zshrc
source ~/.zshrc
```

#### XFCE Desktop Environment
```bash
cp setup/configs/xfce4/* ~/.config/xfce4/xfconf/xfce-perchannel-xml/
```

#### Terminal (QTerminal)
```bash
mkdir -p ~/.config/qterminal.org
cp setup/configs/terminal/qterminal.ini ~/.config/qterminal.org/
```

#### GTK Theme & Styling
```bash
mkdir -p ~/.config/gtk-3.0
cp setup/configs/gtk/gtk.css ~/.config/gtk-3.0/
```

#### Redshift (Blue Light Reduction)
```bash
mkdir -p ~/.config/autostart
cp setup/configs/autostart/redshift-gtk.desktop ~/.config/autostart/
```

#### LightDM Login Screen
```bash
sudo cp /etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf.backup
sudo tee /etc/lightdm/lightdm-gtk-greeter.conf > /dev/null << 'EOF'
[greeter]
background = /usr/share/desktop-base/kali-theme/login/background
theme-name = DarkMint
icon-theme-name = Adwaita
font-name = Cascadia Code 9
cursor-theme-name = Adwaita
cursor-theme-size = 16
keyboard = us
position = center
active-monitor = 0
EOF
```

### 4. Reload XFCE
```bash
pkill -9 xfce4-session
# Log out and back in
```

## Configuration Details

### Shell (.zshrc)
- **Theme**: Ultra-modern professional with box-drawing characters
- **Plugins**: zsh-syntax-highlighting, zsh-autosuggestions
- **Fonts**: JetBrains Mono Nerd Font (terminal), Cascadia Code (UI)
- **Features**: 
  - Git integration with vcs_info
  - Cloud context detection (AWS, K8s, Docker, Terraform)
  - Network info display
  - Command execution time tracking
  - Custom aliases for DevOps tools

### Desktop Environment (XFCE)
- **Theme**: DarkMint (modern flat Numix design)
- **Icons**: Adwaita (minimal modern GNOME standard)
- **Panel**: 24px ultra-compact with transparency
- **Fonts**: Cascadia Code 7pt (UI), 6pt (monospace)
- **Features**:
  - Smooth animations and transitions
  - Rounded window decorations
  - Subtle shadows (25% opacity)
  - Dark background (#0A0E27)
  - Center-aligned window titles

### Terminal (QTerminal)
- **Font**: Cascadia Code 9pt
- **Color Scheme**: GreenOnBlack
- **Features**: Transparency, modern styling

### GTK Theming (gtk.css)
- Rounded dialog corners (8-12px radius)
- Modern button styling with padding
- Smooth 200ms transitions
- Custom scrollbar styling

### Blue Light Reduction (Redshift)
- **Tool**: Redshift GTK
- **Auto-start**: Enabled via autostart desktop entry
- Reduces blue light for eye health
- Adjustable color temperature (3000K-6500K)

## DevOps Tools Included

### Container & Orchestration
- Docker 28.5.2
- Kubernetes (kubectl) v1.36.1
- Minikube
- Helm
- Docker Compose

### Infrastructure as Code
- Terraform v1.6.3
- Ansible

### Cloud Platforms
- AWS CLI v2.31.35
- Google Cloud SDK v568.0.0 (gcloud, bq, gsutil)

### Development
- Git 2.53.0
- Node.js v22.22.2
- npm 11.12.1
- Python 3.13.12

### Utilities
- curl, wget, jq
- tmux, htop
- build-essential

## Keyboard Shortcuts

### XFCE Panel
- `Ctrl+Shift+T` - New terminal tab
- `Ctrl+Shift+W` - Close tab
- `Alt+1-9` - Switch to tab 1-9
- `Ctrl+PgDown` - Next tab
- `Ctrl+PgUp` - Previous tab

### Window Manager
- `Alt+Tab` - Switch windows
- `Super+D` - Show desktop
- `Alt+F2` - Run command
- `Alt+F4` - Close window
- `Alt+F7` - Move window
- `Alt+F8` - Resize window

### Terminal (QTerminal)
- `Ctrl+Shift+C` - Copy
- `Ctrl+Shift+V` - Paste
- `Ctrl+Shift+F` - Find
- `Ctrl+Shift+N` - New window

## Customization

### Change Theme
```bash
xfconf-query -c xsettings -p /Net/ThemeName -s "ThemeName"
xfconf-query -c xsettings -p /Net/IconThemeName -s "IconThemeName"
pkill -9 xfce4-panel xfwm4
```

### Change Fonts
```bash
xfconf-query -c xsettings -p /Gtk/FontName -s "FontName Size"
xfconf-query -c xsettings -p /Gtk/MonospaceFontName -s "FontName Size"
```

### Add Aliases
Edit `~/.zshrc` and add your custom aliases under the alias section.

### Configure Cloud Credentials
```bash
aws configure                    # AWS
gcloud auth login               # Google Cloud
kubectl config set-context ...  # Kubernetes
```

## Troubleshooting

### Icons Not Updating
```bash
rm -rf ~/.cache/icon-cache ~/.cache/gtk-* ~/.cache/thumbnails
pkill -9 xfce4-panel xfwm4
```

### Fonts Look Wrong
```bash
fc-cache -fv
pkill -9 xfce4-panel
xfce4-panel &disown
```

### Terminal Colors Off
```bash
export TERM=xterm-256color
```

### Redshift Not Working
```bash
redshift-gtk &
# Or manually: redshift -l 40.7128:-74.0060 -t 4500
```

## Files Included

```
setup/
├── SETUP_GUIDE.md              # This file
├── configs/
│   ├── .zshrc                  # Shell configuration
│   ├── gtk/
│   │   └── gtk.css             # Modern dialog styling
│   ├── terminal/
│   │   └── qterminal.ini       # Terminal configuration
│   ├── autostart/
│   │   └── redshift-gtk.desktop # Blue light filter auto-start
│   └── xfce4/
│       ├── xsettings.xml       # GTK theme, fonts, icons
│       ├── xfwm4.xml           # Window manager theme
│       ├── xfce4-panel.xml     # Panel configuration
│       └── xfce4-desktop.xml   # Desktop background
```

## Version Control

This setup is version-controlled on GitHub for easy restoration across machines:

```bash
git clone <repo-url>
cd NICANORKYAMBA/setup
# Follow setup steps above
```

## Notes

- All configurations are for Kali Linux with XFCE
- Tested on XFCE 4.20.2
- Requires modern fonts (Cascadia Code, JetBrains Mono)
- Blue light reduction (Redshift) auto-starts on login
- All themes and icons are from official Kali/GNOME repos

## Support

For issues or improvements, update configs and commit to GitHub.

---

**Last Updated**: 2026-05-16  
**Setup Version**: 1.0  
**Status**: Production-Ready ✅
