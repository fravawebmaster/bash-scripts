#! /bin/sh

# PHP-WEBS
# Version: 1.0
# Author: Francisco Valenzuela
# Url: https://fravawebmaster.com
# Date: 2020-02-22
# Description: Launch server php with local ip and port to directory projects

mysqld_check () {
  local search1=$(ps -e | grep mysqld | cut -b 1-8)
  local search2=$(ps -e | grep mariadb | cut -b 1-8)

  # Search for mysql or mariadb daemon
  if [ -z $serach1 ]; then
    if [ -z $search2 ]; then
      # Message error
      echo "Error: Mysqld or Mariadb is off."
      exit 1
    fi
  fi
}

ip_address () {
  local ip=$(ip -4 -c address | grep 'inet ' | cut -d'/' -f1  | tr -d 'inet ')
  local num=1

  # List ip
  for dev in $ip;
  do
    echo "$num. $dev"
    num=$(($num+1))
  done
  # Ask for ip
  read -p "What ip to turn on php server: " ip_num
  # Check ip number
  if [ ! $ip_num -lt $num ] || [ -z $ip_num ]; then
    # Message error
    echo "Error: Bad ip number."
    exit 1
  fi
  # Get url and port
  local url=$(echo $ip | cut -d' ' -f$ip_num)
  local port=$((9000+$ip_num))
  ip_address="$url:$port"
}

web_doc () {
  local list=$(ls -1 ~/www --color)
  local num=1

  # List directories
  for dir in $list;
  do
    echo "$num. $dir"
    num=$(($num+1))
  done
  # Ask for directory
  read -p "What web do you want turn on: " directory_number
  # Check directory number
  if [ ! $directory_number -lt $num ] || [ -z $directory_number ]; then
    echo "Error: Bad web number."
    exit 1
  fi
  web_doc=$(ls -1 ~/www --color | sed $directory_number"q;d")
}

echo "== PHP-WEB v0.1 =="
mysqld_check
ip_address
web_doc
a=$(php -s -S $ip_address) !!! Aqui hay un puto error
exit 0
