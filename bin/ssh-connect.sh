#! /bin/sh

# SSH-CONNECT
# Version 0.1
# Author: Francisco Valenzuela
# Url: https://fravawebmaster.com
# Date: 02/07/2020
# Description: Connect to a device using SSH.
# Usage: ./ssh-connect

connect_to_device () {
  local device_ip=$1
  ssh u0_a176@$device_ip -p 8022
}

# Menu
line=---------------------
clear
echo "$line\nSSH-CONNECT V0.1\n$line"
echo "Script use: ssh [user]@[host] -p [PORT]\nPlease select the device you want to connect to:\n 1. Tablet\n 2. Phone"

# Get the device IP address and port number from the user
read -p "Device number: " device_number

# Check if the user has entered a valid device number
if [ $device_number != "1" ] && [ $device_number != "2" ]; then
  echo "Error: invalid device number"
  exit 1
fi

# Get the device IP address and port number based on the user's selection
if [ $device_number = "1" ]; then
  device_ip="10.0.0.9"
elif [ $device_number = "2" ]; then
  device_ip="10.0.0.7"
fi

# Connect to the device
connect_to_device $device_ip 

# Verify result
if [ $? -ne 0 ]; then
  echo "The device is offline or sshd down..."; exit 1
fi

clear
exit 0
