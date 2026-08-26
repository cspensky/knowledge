# knowledge


## VMWare
- [Using a USB mouse with a VM](http://forum.yubico.com/viewtopic.php?t=1774&p=6987)

## X1 Carbon stuff
- [pkexec not working](https://qiita.com/cielavenir/items/bad3a62583acc088be9e)

- Disable the middle click
```bash
xinput set-button-map 12 1 1 3 4 5 6 7 8 9 10 11 12
```
https://unix.stackexchange.com/questions/438725/disabling-middle-click-on-bottom-of-a-clickpad-touchpad

```bash
xinput set-prop 12 "libinput Tapping Enabled" 1
```
https://major.io/2021/07/18/tray-icons-in-i3/

## Southwest Checkin Script
- https://github.com/jdholtz/auto-southwest-check-in
```bash
docker pull jdholtz/auto-southwest-check-in
```
```bash
docker run -d jdholtz/auto-southwest-check-in
```
