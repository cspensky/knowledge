# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

sudo apt-get update

# Install basic tools
apt-get -y install vim
apt-get -y install ssh
apt-get -y install htop iftop

# Basic developer tools
apt-get -y install openjdk-7-jdk 

# Useful libraries
apt-get -y install lib32z1 lib32ncurses5 lib32bz2-1.0

# Window management
apt-get -y install gnome-do
apt-get -y install gnome-session-fallback
apt-get -y install python-xlib
# Add PyWo to startup
mkdir $HOME/.config/autostart
cat << EOF >> ~/.config/autostart/pywo.desktop
[Desktop Entry]
Type=Application
Exec=$HOME/.pywo-0.2/pywo.py
Name=Python Window Organizer
Comment=Organizer to add hotkeys for tiling windows.
Terminal=false
Categories=Utility;Application;
EOF
# Set a nice wallpaper
gsettings set org.gnome.desktop.background picture-uri file://$PWD/wallpaper.png

# Wireshark
apt-get -y install wireshark
dpkg-reconfigure wireshark-common 
usermod -a -G wireshark $USER

# Git
apt-get -y install git gitk
git config --global core.editor "vim"
apt-get -y install meld

# Chrome
apt-get -y install chromium-browser

# Stop nautilis from being annoying
gsettings set org.gnome.desktop.media-handling automount-open false
