# Make sure only root can run our script
if [ "$(id -u)" == "0" ]; then
   echo "This script must not be run as root" 1>&2
   exit 1
fi

sudo apt-get update

# Install basic tools
sudo apt-get -y install vim
sudo apt-get -y install ssh
sudo apt-get -y install screen
sudo apt-get -y install htop iftop
sudo apt-get -y install ipython
sudo apt-get -y install nmap
sudo apt-get -y install tree

# Add user to dialout group for /dev/ttyUSB stuff
sudo usermod -a -G dialout $USER

# Basic developer tools
sudo apt-get -y install openjdk-8-jdk 

# Useful libraries
sudo apt-get -y install lib32z1 lib32ncurses5 lib32bz2-1.0
sudo apt-get -y install python3-pip

# Window management
sudo apt-get -y install i3

# Wireshark
sudo apt-get -y install wireshark
sudo dpkg-reconfigure wireshark-common 
sudo usermod -a -G wireshark $USER

# Git
sudo apt-get -y install git gitk
git config --global core.editor "vim"
git config --global user.email "chad@allthenticate.net"
git config --global user.name "Chad Spensky"
sudo apt-get -y install meld

# Stop nautilis from being annoying
sudo gsettings set org.gnome.desktop.media-handling automount-open false

# Change our shell
sudo apt-get -y install fish csh
chsh -s `which fish`
sudo pip install virtualfish
cp config.fish ~/.config/fish/

# Term stuff
sudo apt-get -y install terminator
sudo apt-get -y install mercurial


# i3 and i3 control utils
sudo apt-get update
sudo apt-get install i3 i3-wm i3blocks i3lock i3status xss-lock xautolock
sudo apt-get install pactl xbacklight
cp config ~/.config/i3/config
cp i3blocks.conf ~/.i3blocks.conf

#wget https://github.com/acrisci/playerctl/releases/download/v0.5.0/playerctl-0.5.0_amd64.deb
#sudo dpkg -i playerctl-0.5.0_amd64.deb

# random build things
sudo apt-get -y install build-essential libtool g++ gcc texinfo curl wget automake autoconf python python-dev git subversion unzip virtualenvwrapper python3 python3-dev


# i3 Stuff
sudo apt-get -y install cmake
sudo apt-get -y install xbacklight
sudo apt-get -y install policykit-1-gnome
# Spotify 
sudo snap install spotify

# Developer tools
sudo snap install clion --classic
sudo snap install pycharm-professional --classic
sudo snap install slack --classic
sudo snap install android-studio --classic

# Graphics stuff
sudo apt-get install -y scrot
sudo apt-get install -y net-tools
sudo apt-get install -y feh

#git clone https://github.com/libthinkpad/dockd.git

# Android
sudo apt-get -y install adb

# Awesome tool for checking disk space
sudo apt-get install -y ncdu

# SDA
#sudo add-apt-repository ppa:cspensky/sda -y
#sudo apt-get update
#sudo apt-get -y install sda


cd ~
rm -rf Desktop 
rm -rf Documents  
rm -rf examples.desktop  
rm -rf Music  
rm -rf Pictures  
rm -rf Public  
rm -rf Templates  
rm -rf Videos

