#!/bin/bash
##
# This script is responsible for opening the browser
# and configuring it to be displayed in kiosk mode.
#
# It reads the configuration file to load the URL into
# the browser as soon as the Raspberry Pi loads.
#
# The installKiosk.sh will automatically configure the Pi
# to run this script on startup, however it can be run
# in isolation to automatically load the browser from the command
# line.
#
# Author: Sze Yick
# Last Updated: 11/03/2017
##

echo "Opening Epiphany Browser"
# Loading configuration URL.
while read -r line; do declare $line; done < configuration

# Opening Browser
sudo -u pi epiphany-browser -a -i --profile ~/.config $URL --display=:0 &
sleep 30s;
echo key F11 | xte