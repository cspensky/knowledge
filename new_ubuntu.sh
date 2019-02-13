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
apt-get -y install ipython
apt-get -y install nmap
apt-get -y install tree

# Add user to dialout group for /dev/ttyUSB stuff
sudo usermod -a -G dialout $USER

# Basic developer tools
apt-get -y install openjdk-8-jdk 

# Useful libraries
apt-get -y install lib32z1 lib32ncurses5 lib32bz2-1.0
sudo apt-get -y install python-usb python-serial
sudo apt-get -y install python-matplotlib pyhton-numpy python-scipy
sudo apt-get install python-pip

# Window management
apt-get -y install i3

# Wireshark
apt-get -y install wireshark
dpkg-reconfigure wireshark-common 
usermod -a -G wireshark $USER

# Git
sudo apt-get -y install git gitk
git config --global core.editor "vim"
git config --global user.email "cspensky@cs.ucsb.edu"
git config --global user.name "Chad Spensky"
sudo apt-get -y install meld

# Stop nautilis from being annoying
gsettings set org.gnome.desktop.media-handling automount-open false

sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free" &&
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D2C19886 &&
sudo apt-get update -qq &&
sudo apt-get install spotify-client

# Change our shell
sudo apt-get -y install fish csh
chsh -s `which fish`

# Term stuff
sudo apt-get -y install terminator
sudo apt-get -y install mercurial


# i3 and i3 control utils
sudo apt-get update
sudo apt-get install i3 i3-wm i3blocks i3lock i3status xss-lock xautolock
sudo apt-get install pactl xbacklight
cp /etc/i3blocks.conf ~/.i3/

wget https://github.com/acrisci/playerctl/releases/download/v0.5.0/playerctl-0.5.0_amd64.deb
sudo dpkg -i playerctl-0.5.0_amd64.deb

# random build things
sudo apt-get -y install build-essential libtool g++ gcc texinfo curl wget automake autoconf python python-dev git subversion unzip virtualenvwrapper

sudo apt-get install cmake
sudo apt-get install xbacklight

# Spotify 
snap install spotify

# Developer tools
snap install clion --classic
sudo snap install pycharm-professional --classic

sudo apt-get install scrot

sudo apt-get install net-tools

sudo snap install slack --classic
sudo apt-get install feh
