#!/bin/sh
sudo apt-get install tlp tlp-rdw acpi-call-dkms tp-smapi-dkms acpi-call-dkms

echo "Section "Device"
        Identifier  "Intel Graphics"
        Driver      "intel"
        Option      "Backlight"  "intel_backlight"
    EndSection" >> /etc/X11/xorg.conf
