# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

sudo apt-get update

# Install basic tools
apt-get -y install vim
apt-get -y install ssh
apt-get -y install screen
apt-get -y install htop iftop

# Add user to dialout group for /dev/ttyUSB stuff
sudo usermod -a -G dialout $USER

# Basic developer tools
apt-get -y install openjdk-7-jdk 

# Useful libraries
apt-get -y install lib32z1 lib32ncurses5 lib32bz2-1.0

# Window management
apt-get -y install gnome-do
apt-get -y install gnome-session-fallback
apt-get -y install python-xlib

# Download pywo
wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/pywo/pywo-0.2.tar.gz
tar -xzvf pywo-0.2.tar.gz
mv pywo-0.2 ~/.pywo-0.2
rm pywo-0.2.tar.gz

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

# Update our sudors file

echo 'Defaults  env_keep += "http_proxy"' >> /etc/sudoers
echo 'Defaults  env_keep += "https_proxy"' >> /etc/sudoers
echo 'Defaults  env_keep += "HTTP_PROXY"' >> /etc/sudoers
echo 'Defaults  env_keep += "HTTPS_PROXY"' >> /etc/sudoers
echo 'Defaults  env_keep += "PYTHONPATH"' >> /etc/sudoers

sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free" &&
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D2C19886 &&
sudo apt-get update -qq &&
sudo apt-get install spotify-client

# Change our shell
sudo apt-get -y install fish
chsh -s `which fish`

# ctf-tools stuff
sudo apt-get -y install build-essential libtool g++ gcc texinfo curl wget automake autoconf python python-dev git subversion unzip virtualenvwrapper
