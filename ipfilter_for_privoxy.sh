#!/bin/bash
for i in $(netstat -n | egrep '(8118.*ESTABLISHED)'| egrep -o '([0-9]{1,3}\.){3}[0-9]{1,3}' | sort | uniq);do
IPCOUNTRY=$(geoiplookup $i)
if [ "$(echo $IPCOUNTRY | awk '{print $5}')" = "Germany" ];then :;else
echo "$(date) $i $IPCOUNTRY" | tee -a /etc/iptables/hosts-ip.log
IP_RAM="$IP_RAM
ALL: $i";fi;done;
echo "$IP_RAM" | awk -F"." '{print $1"."$2"."}' | sort | uniq >> /etc/iptables/hosts.deny.log
cat /etc/iptables/hosts.deny.log | grep ALL | sort | uniq >> /etc/iptables/hosts.deny.cfg
rm /etc/hosts.deny && cp /etc/iptables/hosts.deny.cfg /etc/hosts.deny
systemctl stop privoxy
sleep 5
systemctl start privoxy
~                       
