#!/bin/bash
# I succeeded by building from source (http://xtables-addons.sourceforge.net) 
# against the headers downloaded by rpi-source (https://github.com/notro/rpi-source).
# 
# Note that you need gcc 4.8.3+ (follow the instructions carefully at https://github.com/notro/rpi-source/wiki).
##
# --- Install libncurses5-dev before running rpi-source:
apt-get install libncurses5-dev
# --- Install and run rpi-source:
wget https://raw.githubusercontent.com/notro/rpi-source/master/rpi-source -O /usr/bin/rpi-source
chmod +x /usr/bin/rpi-source && /usr/bin/rpi-source -q --tag-update
rpi-source
# --- Install the xtables-addons build dependencies:
apt-get install git autoconf automake libtool xutils-dev
# ---
cd /opt
git clone git://git.code.sf.net/p/xtables-addons/xtables-addons
cd xtables-addons
libtoolize --force
aclocal
autoheader
autoconf
./configure
make install
depmod
