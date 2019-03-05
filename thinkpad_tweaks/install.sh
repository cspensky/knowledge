#!/bin/sh

chmod +x thinkpad-dock.sh
sudo cp thinkpad-dock.sh /usr/sbin/
sudo cp 81-thinkpad-dock.rules /etc/udev/rules.d/81-thinkpad-dock.rules
