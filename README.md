## Creating Raspberry Pi Kiosk

This project allows a Raspberry Pi to display a webpage when it is booted into the desktop GUI. 

## Requirements:

As this project is going to be used in an environment where the Raspberry Pi will only be used for display, it has a few requirements that needed to be managed.

- **Configurable** - The solution must allow for different websites to be displayed with minimal to no changes in the scripts.
- **Load Browser on Boot** - Upon restart or startup, the OS will boot and display the browser and page immediately.

## Software Configuration:

The software required for this version of the Raspberry Pi Kiosk will be -

- **Epiphany Web Browser** - The browser used to display the webpage.
- **X-11 Server Utilities** - Allows for control of input/output.
- **Xautomation** - Allows for key presses and mouse movements to be simulated.
- **Unclutter** - Hides the mouse when it is not in use.

## Install Instructions

The installation instructions assume that **Raspbian Debian Wheezy** is installed and **SSH** is enabled. Also the current installation of Raspbian boots into the GUI (Desktop).

- **Download repository files**

Download the three files in this repository and place them into the ```/home/pi``` directory.

- **Configure URL**

Open the **fullscreen.sh** file and in there you will find a URL in the script (default http://www.google.com.au). Replace this with the URL that you wish to display on system startup.

- **Run the installer**

Make sure the **installKiosk.sh** file is executable. You may need to run the following command:

`chmod u+x installKiosk.sh`

Once it is executable, run the script:

`./installKiosk.sh`

The script will install all the neccessary software components to allow the browser to run in kiosk (full screen) mode. It will do this by downloading the Epiphany Web Browser if it isn't already installed, along with the tools to allow a key press to be simulated (F11 is the default key to bring the browser into full screen mode).

Once the required components are downloaded, installed and updated the script will make change to the autostart sequence by adding the **fullscreen.sh** script to the autostart file. This is done as to notify the OS to run this script when it has booted into the desktop.

Lastly it sets the permissions to the **fullscreen.sh** file and reboots the Raspberry Pi to complete the installation.

## Issues:

From testing, there have been a few observable issues that have occured every so often.

- **Epiphany not loading to full screen:**

There have been instances observed, where upon start up the browser will load into full screen, then appears to flicker in an attempt to get into kiosk mode but will not succeed. This behaviour has only been observed when the script auto loads on start up. If the **fullscreen.sh** script is executed when the OS is booted, the browser boots into kiosk mode without an issue.

Not too sure what the cause of this issue is as it seems to only happen on certain installs of Raspbian on the Raspberry Pi 3. It will still however boot until maximised mode without the browser address bar, which whilst seems to do 90% of the job, is still not perfect.

If this does happen, it might also be useful to hide the taskbar with the following steps -

`Right-click on the taskbar and select "Panel Settings". Click on the "Advanced" tab, and check "Minimize panel when not in use".`

- **Web page not loading:**

It has been observed that when using incognito mode, the browser sometimes fails to load the desired webpage. It could be related to a possible performance issue as the script is loading at the same time as the OS is trying to load everything else.

A work around for this, if it happens is to remove the **-i** argument from the **fullscreen.sh** script to load Epiphany into normal browsing mode rather than incognito.

- **Task Bar Interference:**

My initial issue with Epiphany not loading into full screen mode, I thought had to do with the task bar. I ended up changing the Raspberry Pi configuration so that the task bar would be hidden when it is not in use. It resolved my issue but not too sure whether it is entirely neccessary. The link to change it is in the references section below.

## References:

- https://github.com/elalemanyo/raspberry-pi-kiosk-screen
- http://stackoverflow.com/questions/17928992/debian-lxde-terminal-how-to-disable-it-disable-the-panel-bar
- http://stackoverflow.com/questions/20121867/how-do-i-search-a-file-for-a-particular-line-then-comment-out-or-comment-in-tha
- https://www.danpurdy.co.uk/web-development/raspberry-pi-kiosk-screen-tutorial/





