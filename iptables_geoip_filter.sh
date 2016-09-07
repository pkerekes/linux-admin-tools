#!/bin/bash
#
# Execude Countries (separate with pipe)
EX_CO="DE|HU"
#
XT_VER="xtables-addons-2.11"
XT_FIL="${XT_VER}.tar.xz"
RELEAS='2.11'
XT_DIR="/opt/$XT_VER"
#
#
wget "https://sourceforge.net/projects/xtables-addons/files/Xtables-addons/${RELEAS}/${XT_FIL}" -P /opt
cd /opt && tar xf "${XT_FIL}" && cd "${XT_DIR}"
./configure ;make ;make install ;ldconfig ;
cd geoip/
./xt_geoip_dl
./xt_geoip_build GeoIPCountryWhois.csv
mkdir -p /usr/share/xt_geoip && cp -r {BE,LE} /usr/share/xt_geoip 
for COUNTRY in $(cat ${XT_DIR}/geoip/GeoIPCountryWhois.csv | awk -F'","' '{print $5}' | sort | uniq | egrep -v "$EX_CO");do 
#
iptables -I INPUT -m geoip --src-cc ${COUNTRY} -j DROP;
#
done
#iptables -nvL | awk awk '$2>0{print}'
#iptables -nvL
#netstat -tunp
#
# Print list of Countries
#
cat ${XT_DIR}/geoip/GeoIPCountryWhois.csv | awk -F'","' '{print $5" "$6}' | sed 's/"//g;s/, *//g;s/ of//g' | sort | uniq | pr -4 -l74 -w200
