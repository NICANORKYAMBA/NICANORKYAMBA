#!/usr/bin/env bash
# Restore the DarkMint Neon desktop (Kali XFCE) from this repo.
#   Packages: sudo apt install -y darkmint-gtk-theme papirus-icon-theme picom conky-all qt5ct qt6ct \
#               rofi fastfetch zoxide fd-find eza bat fzf xscreensaver-gl btop tmux
#   Fonts:    JetBrainsMono Nerd Font, Cascadia Code NF; cursor: Bibata-Modern-Classic
#   Optional, sudo: ~/.local/bin/darkmint-login-setup   (login screen)
#                   ~/.local/bin/darkmint-boot-setup    (GRUB menu + boot splash)
set -euo pipefail
cd "$(dirname "$0")"

echo "Copying dotfiles into $HOME"
find . -type f ! -name 'install-darkmint.sh' ! -path './.git/*' | while read -r f; do
  install -Dm"$( [ -x "$f" ] && echo 755 || echo 644 )" "$f" "$HOME/${f#./}"
done
xrdb -merge ~/.Xresources

echo "Applying theme settings"
x() { xfconf-query -c "$1" -p "$2" -n -t "$3" -s "$4"; }
x xsettings /Net/ThemeName string DarkMint
x xsettings /Net/IconThemeName string Papirus-Dark
x xsettings /Gtk/CursorThemeName string Bibata-Modern-Classic
x xsettings /Xft/Antialias int 1
x xsettings /Xft/Hinting int 1
x xsettings /Xft/HintStyle string hintslight
x xsettings /Xft/RGBA string rgb
x xfwm4 /general/theme string Kali-Green-Dark      # DarkMint ships no xfwm4 borders
x xfce4-notifyd /theme string DarkMint-Notify
W="$HOME/Pictures/wallpapers/darkmint-kali-net.jpg"
x xfce4-screensaver /lock/background string "$W"
gsettings set org.gnome.desktop.interface gtk-theme DarkMint
gsettings set org.gnome.desktop.interface icon-theme Papirus-Dark
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.x.apps.portal color-scheme prefer-dark   # XFCE asks the XApp portal; apps read dark mode from it

# Wallpaper on every monitor and workspace
for m in $(xrandr --listmonitors | awk 'NR>1{print $4}'); do
  for w in 0 1 2 3; do
    b=/backdrop/screen0/monitor$m/workspace$w
    x xfce4-desktop $b/last-image string "$W"
    x xfce4-desktop $b/image-style int 5
  done
done

# Panel: green-black background
xfconf-query -c xfce4-panel -p /panels/panel-1/background-style -n -t uint -s 1
xfconf-query -c xfce4-panel -p /panels/panel-1/background-rgba -n \
  -t double -s 0.043 -t double -s 0.067 -t double -s 0.051 -t double -s 0.92

# GTK4 apps: borrow Kali-Green-Dark (DarkMint has no gtk-4.0)
mkdir -p ~/.config/gtk-4.0
for f in /usr/share/themes/Kali-Green-Dark/gtk-4.0/*; do ln -sfn "$f" ~/.config/gtk-4.0/; done

# Qt apps
for v in 5 6; do
  f=~/.config/qt${v}ct/qt${v}ct.conf
  [ -f "$f" ] && sed -i "s|^icon_theme=.*|icon_theme=Papirus-Dark|; s|^color_scheme_path=.*|color_scheme_path=/usr/share/qt${v}ct/colors/Kali-Green-Dark.conf|" "$f"
done

# qterminal
q=~/.config/qterminal.org/qterminal.ini
[ -f "$q" ] && sed -i 's/^colorScheme=.*/colorScheme=DarkMint-Neon/; s/^fontFamily=.*/fontFamily=Cascadia Code NF/; s/^fontSize=.*/fontSize=10/; s/^MenuVisible=.*/MenuVisible=false/' "$q"

# Folders open in Thunar
xdg-mime default thunar.desktop inode/directory

# Hotkeys: Super+Space launcher, Ctrl+Alt+P privacy shield, Ctrl+Alt+U Windows disguise
k() { x xfce4-keyboard-shortcuts "/commands/custom/$1" string "$2"; }
k '<Super>space' 'rofi -show drun'
k '<Primary><Alt>p' "$HOME/.local/bin/privacy-shield"
k '<Primary><Alt>u' "$HOME/.local/bin/privacy-mode"

# Matrix screensaver
x xfce4-screensaver /saver/mode int 2
xfconf-query -c xfce4-screensaver -p /saver/themes/list -n --force-array -t string -s screensavers-darkmint-matrix

xfdesktop --reload 2>/dev/null || true
~/.local/bin/fx-on || true
echo "Done. Log out and back in to pick up everything."
