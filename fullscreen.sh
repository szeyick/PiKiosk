#!/bin/bash
##
# This script is responsible for opening the browser
# and configuring it to be displayed in kiosk mode.
#
# The installKiosk.sh will automatically configure the Pi
# to run this script on startup, however it can be run
# in isolation to automatically load the browser from the command
# line.
#
# Author: Sze Yick
# Last Updated: 22/03/2017
##

echo "Opening Epiphany Browser"
# Opening Browser
# Replace http://www.google.com.au with your own URL
sudo -u pi epiphany-browser -a --profile ~/.config http://www.google.com.au --display=:0 &
sleep 30s;
echo key F11 | xte
