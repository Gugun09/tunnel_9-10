#!/bin/bash
# Created by http://www.vps-murah.net
# Modified by gugun09

echo "echo "Queenssh"" > /usr/local/bin/infouser-pptp
echo "echo "Queenssh"" > /usr/local/bin/expireduser-pptp
chmod +x /usr/local/bin/infouser-pptp
chmod +x /usr/local/bin/expireduser
chmod +x /etc/ppp/chap-secrets
chmod +x /var/lib/queenssh/data-user-pptp

totalaccounts=`cat /var/lib/queenssh/data-user-pptp | wc -l`
for((i=1; i<=$totalaccounts; i++ ))
       do       
       username=`cat /var/lib/queenssh/data-user-pptp | awk '{print $1}' | head -n $i | tail -n 1`
       userexpireinseconds=`cat /var/lib/queenssh/data-user-pptp | awk '{print $5}' | head -n $i | tail -n 1`
       tglexp=`date -d @$userexpireinseconds`             
       tgl=`echo $tglexp|awk -F" " '{print $3}'`
       bulantahun=`echo $tglexp |awk -F" " '{print $2,$6}'`
       todaystime=`date +%s`
	   seeder=s/^$username/#$username/g
       if [ $userexpireinseconds -ge $todaystime ] ;
           then
           timeto7days=$(( $todaystime + 604800 ))
                if [ $userexpireinseconds -le $timeto7days ];
                then                     
                     echo "echo "User : $username will expired on : $tgl $bulantahun"" >> /usr/local/bin/infouser-pptp
                fi
       else
       echo "echo "User : $username expired on date : $tgl $bulantahun"" >> /usr/local/bin/expireduser-pptp
	   sed -i $seeder /var/lib/queenssh/data-user-pptp
	   sed -i $seeder /etc/ppp/chap-secrets
	   sed -i "s|##|#|g" /etc/ppp/chap-secrets
	   sed -i "s|###|#|g" /etc/ppp/chap-secrets
	   sed -i "s|####|#|g" /etc/ppp/chap-secrets
	   sed -i "s|#####|#|g" /etc/ppp/chap-secrets
	   sed -i "s|######|#|g" /etc/ppp/chap-secrets
	   sed -i "s|#######|#|g" /etc/ppp/chap-secrets
	   sed -i "s|########|#|g" /etc/ppp/chap-secrets
	   sed -i "s|#########|#|g" /etc/ppp/chap-secrets
	   sed -i "s|##########|#|g" /etc/ppp/chap-secrets
	   sed -i "s|###########|#|g" /etc/ppp/chap-secrets
	   sed -i "s|############|#|g" /etc/ppp/chap-secrets
	   sed -i "s|#############|#|g" /etc/ppp/chap-secrets
	   sed -i "s|##############|#|g" /etc/ppp/chap-secrets
	   sed -i "s|###############|#|g" /etc/ppp/chap-secrets
	   sed -i "s|################|#|g" /etc/ppp/chap-secrets
	   sed -i "s|#################|#|g" /etc/ppp/chap-secrets
	   sed -i "s|##|#|g" /var/lib/queenssh/data-user-pptp
	   sed -i "s|###|#|g" /var/lib/queenssh/data-user-pptp
	   sed -i "s|####|#|g" /var/lib/queenssh/data-user-pptp
	   sed -i "s|#####|#|g" /var/lib/queenssh/data-user-pptp
	   sed -i "s|######|#|g" /var/lib/queenssh/data-user-pptp
	   sed -i "s|#######|#|g" /var/lib/queenssh/data-user-pptp
	   sed -i "s|########|#|g" /var/lib/queenssh/data-user-pptp
	   sed -i "s|#########|#|g" /var/lib/queenssh/data-user-pptp
	   sed -i "s|##########|#|g" /var/lib/queenssh/data-user-pptp
	   sed -i "s|###########|#|g" /var/lib/queenssh/data-user-pptp
	   sed -i "s|############|#|g" /var/lib/queenssh/data-user-pptp
	   sed -i "s|#############|#|g" /var/lib/queenssh/data-user-pptp
	   sed -i "s|##############|#|g" /var/lib/queenssh/data-user-pptp
	   sed -i "s|###############|#|g" /var/lib/queenssh/data-user-pptp
	   sed -i "s|################|#|g" /var/lib/queenssh/data-user-pptp
	   sed -i "s|#################|#|g" /var/lib/queenssh/data-user-pptp
       fi
done
  echo " "
  echo " "
  echo " "
    echo "---------------------------------------------"
  echo -e "The expired PPTP VPN user has been locked"
  echo -e "Login access for username has beenlocked"
  echo "-----------------------------------------------"