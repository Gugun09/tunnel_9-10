#!/bin/bash
# Created by http://www.vps-murah.net
# Modified by gugun09

read -p "Input Username you want to delete: " username
grep -E "^$username" /etc/ppp/chap-secrets >/dev/null
if [ $? -eq 0 ]; then
# changing the password
username2="/$username/d";
sed -i $username2 /etc/ppp/chap-secrets
sed -i $username2 /var/lib/queenssh/data-user-pptp
sed -i '/^$/d' /etc/ppp/chap-secrets
sed -i '/^$/d' /var/lib/queenssh/data-user-pptp
clear
  echo " "
  echo " "
  echo " "
  echo "-----------------------------------------------"
  echo -e "Username ${blue}$username successfully ${red}REMOVED."
  echo -e "Login access for Username ${blue}$username has been deleted"
  echo "-----------------------------------------------"
else
echo "Username not found on your server"
    exit 1
fi