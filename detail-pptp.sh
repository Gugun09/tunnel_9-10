#!/bin/bash
# Created by http://www.vps-murah.net
# Modified by gugun09

chmod +x /var/lib/queenssh/data-user-pptp

read -p "Insert Username : " username
grep -E "^$username" /var/lib/queenssh/data-user-pptp >/dev/null
if [ $? -eq 0 ]; then
userpass=`cat /var/lib/queenssh/data-user-pptp | grep "^$username" | awk '{print $3}'`
saat_expired=`cat /var/lib/queenssh/data-user-pptp | grep "^$username" | awk '{print $5}'`
tanggal_expired=$(date -u --date="1970-01-01 $saat_expired sec GMT" +%Y/%m/%d)
tanggal_expired_display=$(date -u --date="1970-01-01 $saat_expired sec GMT" '+%d %B %Y')
clear
  echo " "
  echo " "
  echo "-----------------------------------------"
  echo " Account Details For Username $Username  "
  echo "-----------------------------------------"
  echo "   Username        : $username"
  echo "   Password        : $userpass"
  echo "   Date Expired    : $tanggal_expired_display"
  echo "-----------------------------------------"
else
echo "Username not found on your server"
    exit 1
fi