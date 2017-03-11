#!/bin/bash
##
# Install Epiphany Kiosk
#
# This script is responsible for configuring a Raspberry Pi to display a webpage
# in fullscreen/kiosk mode. It uses the Epiphany browser and will update and download
# the required packages to load the browser.
#
# It will also add the script to the autostart configuration ensuring that it loads
# when the Pi boots up.
#
# Author: Sze Yick
# Last Updated: 11/03/2017
##

clear
echo "Installing Required Tools"
echo "Updating Epiphany, X11 Server Utils, Unclutter"
sudo apt-get install epiphany-browser x11-xserver-utils xautomation unclutter
echo

echo "Updating Autostart Script"
echo
sed -i '/^@xscreensaver -no-splash/a @xset s off' ~/.config/lxsession/LXDE-pi/autostart
sed -i '/^@xset s off/a @xset -dpms' ~/.config/lxsession/LXDE-pi/autostart
sed -i '/^@xset -dpms/a @xset s noblank' ~/.config/lxsession/LXDE-pi/autostart
sed -i '/^@xset s noblank/a @/home/pi/fullscreen.sh' ~/.config/lxsession/LXDE-pi/autostart
sed -i 's/^@xscreensaver -no-splash/#@xscreensaver -no-splash/' ~/.config/lxsession/LXDE-pi/autostart

echo
echo "Finished Updating Autostart Script"
echo "Setting Permissions to Browser Launcher"
chmod 755 /home/pi/fullscreen.sh

echo "Installation Complete...Rebooting"
sleep 10s
sudo reboot