#!/bin/sh

sudo apt-get install libxrandr-dev -y
sudo apt-get install libsystemd-dev libudev-dev acpid -y

git clone https://github.com/libthinkpad/dockd.git
git clone https://github.com/libthinkpad/libthinkpad.git

cd libthinkpad
cmake .
make
sudo make install

cd ..

cd dockd

cmake .
make
sudo make install

sudo ln -s /usr/lib64/libthinkpad.so.1 /usr/lib/
