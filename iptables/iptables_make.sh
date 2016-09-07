#!/bin/bash
test -x /etc/iptables || mkdir /etc/iptables
#
echo "1" > /proc/sys/net/ipv4/ip_forward
#
IPT="/sbin/iptables"
#
# Flush old rules, old custom tables
#$IPT --flush
#$IPT --delete-chain
cleanOldRules(){
$IPT -F
$IPT -X
$IPT -t nat -F
$IPT -t nat -X
$IPT -t mangle -F
$IPT -t mangle -X
$IPT -P INPUT ACCEPT
$IPT -P OUTPUT ACCEPT
$IPT -P FORWARD ACCEPT
}
cleanOldRules



# Set default policies for all three default chains
$IPT -P INPUT DROP
$IPT -P FORWARD DROP
$IPT -P OUTPUT DROP

# Enable free use of loopback interfaces
$IPT -A INPUT -i lo -j ACCEPT
$IPT -A OUTPUT -o lo -j ACCEPT

# All TCP sessions should begin with SYN
$IPT -A INPUT -p tcp ! --syn -m state --state NEW -s 0.0.0.0/0 -j DROP

# Accept inbound TCP packets
$IPT -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A INPUT -p tcp --dport 22 -m state --state NEW -s 0.0.0.0/0 -j ACCEPT
$IPT -A INPUT -p tcp --dport 443 -m state --state NEW -s 0.0.0.0/0 -j ACCEPT
$IPT -A INPUT -p tcp --dport 80 -m state --state NEW -s 0.0.0.0/0 -j ACCEPT
$IPT -A INPUT -p tcp --dport 49876 -m state --state NEW -s 0.0.0.0/0 -j ACCEPT
#
$IPT -A INPUT -p tcp -m set --match-set china src -j DROP
#$IPT -A INPUT -p tcp -m set --match-set russian-federation src -j DROP
#$IPT -A INPUT -p tcp -m set --match-set united-states src -j DROP
#
$IPT -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
#
# Accept inbound ICMP messages
$IPT -A INPUT -p ICMP --icmp-type 8 -s 0.0.0.0/0 -j ACCEPT
$IPT -A INPUT -p ICMP --icmp-type 11 -s 0.0.0.0/0 -j ACCEPT

# Accept outbound packets
$IPT -t nat -I POSTROUTING -p tcp --dport 80 -j MASQUERADE
$IPT -t nat -I POSTROUTING -p tcp --dport 443 -j MASQUERADE
$IPT -t nat -A OUTPUT -p tcp --dport 80 -m owner --uid-owner root -j ACCEPT
$IPT -t nat -A OUTPUT -p tcp --dport 80 -m owner ! --uid-owner privoxy -j REDIRECT --to-port 49876
$IPT -t nat -A PREROUTING -p tcp -j REDIRECT --to-port 8118 --dport 80
$IPT -I OUTPUT 1 -m state --state RELATED,ESTABLISHED -j ACCEPT
$IPT -A OUTPUT -p udp --dport 53 -m state --state NEW -j ACCEPT

#
#/sbin/iptables-save > /etc/iptables/iptables.firewall.rules
