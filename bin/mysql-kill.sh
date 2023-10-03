#! /bin/sh

# MYSQL-KILL
# Version: 0.1
# Author: Francisco Valenzuela
# Url: https://fravawebmaster.com
# Date: 2023-09-02
# Description: This script search mariadbd or mysqld process and kill it.

mysqld_kill () { 
  local search1=$(ps -e | grep mysqld | cut -b 1-8)
  local search2=$(ps -e | grep mariadbd | cut -b 1-8)
  local found="Daemon found with PID: $1"
  local error1="Error: Can't stop daemon."
  local error2="Error: Service mysqld or mariadbd not active..."
  local ok="Service killed."

  echo "== MYSQL-KILL v0.1 =="
  # Check if mysqld is active
  if [ ! -z $search1 ]; then
    # Message found mysqld
    echo $found $search1
    # Kill with sudo
    run=$(sudo kill $search1)
    if [ ! $? -eq 0 ]; then
      run2=$(kill $search1)
      # Error
      if [ ! $? -eq 0 ]; then
        echo $error1
        exit 1
      fi
    fi
  # Check if mariadbd is active
  elif [ ! -z $search2 ]; then
    # Message found mariadbd
    echo $found $search2
    # Kill with sudo
    run=$(sudo kill $search2)
    if [ ! $? -eq 0 ]; then
      run2=$(kill $search2)
      # Error
      if [ ! $? -eq 0 ]; then
        echo $error1
        exit 1
      fi
    fi
  # Message service not found
  else
    echo $error2
    exit 1
  fi
  echo $ok
  exit 0
}
mysqld_kill
