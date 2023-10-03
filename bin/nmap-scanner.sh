#! /data/data/com.termux/files/usr/bin/bash
# NMAP-SCANNER V0.1
# nmap-scanner.sh is a script for scan networks or machines in the wire.
# Dependecy: getIp.sh
# fravawebmaster.com

line=----------------------

# Set the Nmap command options
options="-Pn -sC -sV -r -p- -PE -PP -PS80,443 -PA3389 -PU40125 -A -T"
verbose="-vv"

# Libraries
. ../lib/getip # Get machine local $ip

# Prompt menu
clear
echo "$line"
echo "󰌗 NMAP-SCANNER V0.1"
echo "$line"
echo "Script usage: nmap [$verbose] [$options][level] [network]"
echo "Aggresive mode is very slow, best in only 1 target. Your local ip is $ip"
getip
echo "Your ip is $getip"
read -p "Insert the ip scan rank(-): " network # Prompt the user for the IP address and level to scan
read -p "Level of scan 0-5: " aggresive # Prompt level scan
# Core
if [ -z $network ] || [ -z $aggresive ];then # Validate the input is not blank
  echo "Error: Bad operation you need insert correct Ip and Level to scan."
  exit 1
else
  if [ $aggresive = 0 ];then
    nmap $network
  elif [ $aggresive = 1 ] || [ $aggresive = 2 ] || [ $aggresive = 3 ] || [ $aggresive = 4 ] || [ $aggresive = 5 ];then
    nmap $verbose $options$aggresive $network
  else
    echo "Error: Bad level scan selected"
    exit 1
  fi
fi
# Exit script execute ok
exit 0
