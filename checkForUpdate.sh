#!/bin/bash
# Script to check for updates
echo "Checking for updates"
sudo rm -r /home/pi/HotspotUpdates/new

#turn the wifi back on
sudo airmon-ng stop mon0
sudo ifconfig wlan0 down
sudo iwconfig wlan0 mode managed 
sudo ifconfig wlan0 up

sleep 60

#download Hotspot repository from github

git clone https://github.com/Thingitude/Hotspot /home/pi/HotspotUpdates/new

version=`sudo python /home/pi/HotspotUpdates/checkForUpdate.py`
echo "And the answer is $version"

if [ $version -eq 1 ]; then
  echo No update received. Rebooting...
else
  echo Updating...
  sudo rm -r /home/pi/HotspotUpdates/old
  sudo mv /home/pi/Hotspot /home/pi/HotspotUpdates/old
  sudo cp -r /home/pi/HotspotUpdates/new /home/pi/Hotspot
  sudo chown -R pi:pi /home/pi/Hotspot
  echo Update completed. Rebooting...
fi

sudo reboot
