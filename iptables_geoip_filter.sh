XT_VER="xtables-addons-2.11"
XT_FIL="${XT_VER}.tar.xz"
XT_DIR="/opt/$XT_VER"
wget "https://sourceforge.net/projects/xtables-addons/files/Xtables-addons/2.11/${XT_FIL}" -P /opt
cd /opt && tar xf "${XT_FIL}" && cd "${XT_DIR}"
./configure ;make ;make install ;ldconfig ;
cd geoip/
./xt_geoip_dl
./xt_geoip_build GeoIPCountryWhois.csv
mkdir -p /usr/share/xt_geoip && cp -r {BE,LE} /usr/share/xt_geoip 
#iptables -I INPUT -m geoip --src-cc CN,US -j DROP 
#iptables -nvL
#netstat -tunp
for COUNTRY in $(cat  /opt/xtables-addons-2.11/geoip/GeoIPCountryWhois.csv | awk -F'","' '{print $5}' | sort | uniq | grep -v DE);do 
iptables -I INPUT -m geoip --src-cc ${COUNTRY} -j DROP;
done
#iptables -nvL | awk awk '$2>0{print}'


