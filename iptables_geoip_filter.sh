
wget https://sourceforge.net/projects/xtables-addons/files/Xtables-addons/2.11/xtables-addons-2.11.tar.xz -P /opt
cd /opt
tar xf xtables-addons-2.11.tar.xz 
tar xf xtables-addons-2.11.tar.xz
cd xtables-addons-2.11
./configure 
make
make install
ldconfig
cd geoip/
./xt_geoip_dl
./xt_geoip_build GeoIPCountryWhois.csv
mkdir -p /usr/share/xt_geoip
cp -r {BE,LE} /usr/share/xt_geoip 
#iptables -I INPUT -m geoip --src-cc CN,US -j DROP 
#iptables -nvL
#netstat -tunp
for COUNTRY in $(cat  /opt/xtables-addons-2.11/geoip/GeoIPCountryWhois.csv | awk -F'","' '{print $5}' | sort | uniq | grep -v DE);do iptables -I INPUT -m geoip --src-cc ${COUNTRY} -j DROP;done
#iptables -nvL | awk awk '$2>0{print}'


