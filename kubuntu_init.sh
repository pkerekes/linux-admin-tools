<<<<<<< HEAD
apt-get remove --purge \
kmail \
korganizer \
kwalletmanager \
kontact \
knotes \
ktnef \
konversation \
krdc \
klipper \
kde-telepathy-contact-list \
ktorrent \
libkf5ksieve5 \
libkf5ksieveui5 \
dragonplayer \
akregator \
kaddressbook \
kate
cp /etc/apt/sources.list /etc/apt/sources-list-initial.back
=======
apt-get remove --purge kmail korganizer kwalletmanager kontact knotes ktnef konversation krdc klipper kde-telepathy-contact-list ktorrent libkf5ksieve5 libkf5ksieveui5 dragonplayer akregator kaddressbook kate
>>>>>>> 6abeb8377753b192a943711174770ba190a91830


cp /etc/apt/sources.list /etc/apt/sources-list-initial.back
rm /etc/apt/sources.list/*
cat << 'EOF' >> /etc/apt/sources.list
#------------------------------------------------------------------------------#
#                            OFFICIAL UBUNTU REPOS                             #
#------------------------------------------------------------------------------#
#
###### Ubuntu Main Repos
deb http://de.archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse
deb-src http://de.archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse
#
###### Ubuntu Update Repos
deb http://de.archive.ubuntu.com/ubuntu/ xenial-security main restricted universe multiverse
deb http://de.archive.ubuntu.com/ubuntu/ xenial-updates main restricted universe multiverse
deb http://de.archive.ubuntu.com/ubuntu/ xenial-proposed main restricted universe multiverse
deb http://de.archive.ubuntu.com/ubuntu/ xenial-backports main restricted universe multiverse
deb-src http://de.archive.ubuntu.com/ubuntu/ xenial-security main restricted universe multiverse
deb-src http://de.archive.ubuntu.com/ubuntu/ xenial-updates main restricted universe multiverse
deb-src http://de.archive.ubuntu.com/ubuntu/ xenial-proposed main restricted universe multiverse
deb-src http://de.archive.ubuntu.com/ubuntu/ xenial-backports main restricted universe multiverse
#

###### Ubuntu Partner Repo
deb http://archive.canonical.com/ubuntu xenial partner
deb-src http://archive.canonical.com/ubuntu xenial partner
#
#------------------------------------------------------------------------------#
#                           UNOFFICIAL UBUNTU REPOS                            #
#------------------------------------------------------------------------------#
#
###### 3rd Party Binary Repos
#### Gimp PPA - https://launchpad.net/~otto-kesselgulasch/+archive/gimp
## Run this command: sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 614C4B38
deb http://ppa.launchpad.net/otto-kesselgulasch/gimp/ubuntu xenial main
#
#### Google Chrome Browser - http://www.google.com/linuxrepositories/
## Run this command: wget -q https://dl.google.com/linux/linux_signing_key.pub -O- | sudo apt-key add -
deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
#
#### JDownloader PPA - https://launchpad.net/~jd-team
## Run this command: sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6A68F637
deb http://ppa.launchpad.net/jd-team/jdownloader/ubuntu xenial main
#
EOF
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 614C4B38
wget -q https://dl.google.com/linux/linux_signing_key.pub -O- | apt-key add -
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6A68F637
add-apt-repository ppa:kubuntu-ppa/backports -y
#
apt-get clean && apt update && apt dist-upgrade -y




wget https://releases.hashicorp.com/vagrant/1.9.0/vagrant_1.9.0_x86_64.deb
apt install vagrant
apt install virtualbox -y
#install vagrant 1.8.4 and virtualbox 5.1.4 (https://www.virtualbox.org/wiki/Downloads)
#run vagrant init
#run vagrant up --provider=virltualbox
apt-get install -y \
yakuake \
vim \
mc \
htop \
kwrite \
google-chrome-stable \
nmap \
keepassx \
git \
myspell-de-de \
myspell-hu \
jdownloader-installer \
ufw \
gufw \
gimp \
gimp-plugin-registry \
gimp-ufraw
ubuntu-restricted-extras
jdownloader-installer
bash-completion \
gparted \

apt-get install gksu

sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt update
sudo apt install winusb

dpkg -i zoom_amd64.deb;apt install -f


apt-get install git gcc make libx11-dev libxtst-dev pkg-config
git clone https://github.com/hanschen/ksuperkey.git && cd ksuperkey
make && sudo make install



GENERATE BASHRC



#http://wiki.ubuntuusers.de/Rechtschreibkorrektur
#!/bin/bash
#lsb_release -ir
# COLORS
F_BD=$(tput bold);F_IV=$(tput rev);F_UL=$(tput smul);
# Background Collor
BC_B=$(tput setb 0);BC_B=$(tput setb 1);BC_G=$(tput setb 2);BC_Y=$(tput setb 3);BC_R=$(tput setb 4);BC_P=$(tput setb 5);BC_C=$(tput setb 6);BC_GR=$(tput setb 7);
# Font Collor
FC_B=$(tput setf 0);FC_B=$(tput setf 1);FC_G=$(tput setf 2);FC_Y=$(tput setf 3);FC_R=$(tput setf 4);FC_P=$(tput setf 5);FC_C=$(tput setf 6);FC_GR=$(tput setf 7);
# Color Reseter
C_ESC=`tput sgr0`
echo "
# ============================================================
# =       Update the repository end upgrade System !!!       =
# ============================================================
"
#apt-get update 1> /dev/null && apt-get upgrade -y 1> /dev/null
apt-get update && apt-get upgrade -y
#
#
#
INSTALL_APPS () {
for i in $APPS; do
    if [ $(dpkg -l | grep ^ii[[:space:]][[:space:]]${i} | wc -l | bc) = 0 ];
    then apt-get install $i -y 1> /dev/null && echo "# --------------- Installed : [ $i ]";
    else echo "# ---- All Readdy installed : [ ${FC_G}${i}${C_ESC} ] Info: $(man ${i} 2>/dev/null | grep NAME -A1 | tail -n1 | column -t)";
    fi
done
}
#
#
#
#homebank
echo -e "
# ============================================================
# =                  Install Office                          =
# ============================================================
"
APPS="
anki
basket
calibre
ekiga
libreoffice
libreoffice-l10n-hu
myspell-hu
libreoffice-l10n-de
myspell-de-de
libreoffice-l10n-en-gb
myspell-en-gb
libreoffice-kde
libreoffice-style-oxygen
libreoffice-presentation-minimizer
thunderbird
thunderbird-locale-hu
thunderbird-locale-de
blogilo
"
INSTALL_APPS
##
##
##
echo -e "
# ============================================================
# =                  Install Multimedia                      =
# ============================================================
"
APPS="
winff
winff-qt
gimp
gimp-plugin-registry
gimp-ufraw
gimp-dcraw
phatch
darktable
rawtherapee
radiotray
smplayer
xsane
shutter
digikam
showfoto
patch
vlc
flashplugin-installer
"
INSTALL_APPS
##
##
##
echo -e "
# ============================================================
# =                  Install Utilitis                        =
# ============================================================
"
APPS="
locales
bleachbit
k4dirstat
nmap
gparted
lynis
rkhunter
geoip-bin
curl
krusader
arj
zip
ark
bzip2
cpio
kdiff3
kompare
kmail
konsole
krename
md5deep
cfv
okteta
p7zip
rpm
unace
unrar
unrar-free
rar
unzip
gtkterm
mc
htop
vim
yakuake
keepassx
pv
openvpn
"
#
INSTALL_APPS
#
##
##
##
#   https://github.com/hanschen/ksuperkey
#   http://blog.hanschen.org/2012/10/17/open-application-launcher-with-super-key/
#
#
# ======================================================================================================
# --- winusb
#
#INST_APP='winusb'
#if [ $( grep "^deb.*launchpad.*sau.*in" /etc/apt/sources.list | wc -l | bc) = 0 ];
#  then
#    echo "# ----- $INST_APP ------------------------------------------------------" >> /etc/apt/sources.list
#    echo 'deb http://ppa.launchpad.net/colingille/freshlight/ubuntu saucy main' >> /etc/apt/sources.list
#    apt-get update 1> /dev/null && apt-get install $INST_APP -y 1> /dev/null && echo "# --------------- Installed : [ $INST_APP ]";
#  else echo "# ---- All Readdy installed : [ ${FC_G}${INST_APP}${C_ESC} ] Info: $(man ${INST_APP} 2>/dev/null | grep NAME -A1 | tail -n1 | column -t)";
#fi
# ======================================================================================================
# --- multisystem
#
#INST_APP='multisystem'
#if [ $( grep "^deb.*liveusb" /etc/apt/sources.list | wc -l | bc) = 0 ];
#  then
#    echo "# ----- $INST_APP ------------------------------------------------------" >> /etc/apt/sources.list
#    echo 'deb http://liveusb.info/multisystem/depot all main' >> /etc/apt/sources.list
#    wget -q -O - http://liveusb.info/multisystem/depot/multisystem.asc | apt-key add -
#    apt-get update 1> /dev/null && apt-get install $INST_APP -y 1> /dev/null && echo "# --------------- Installed : [ $INST_APP ]";
#    sudo usermod -a -G adm nemo
#  else echo "# ---- All Readdy installed : [ ${FC_G}${INST_APP}${C_ESC} ] Info: $(man ${INST_APP} 2>/dev/null | grep NAME -A1 | tail -n1 | column -t)";
#fi
# ======================================================================================================
# --- google-chrome-stable
#
#INST_APP='google-chrome-stable'
#if [ $( grep "^deb.*dl.google.com" /etc/apt/sources.list | wc -l | bc) = 0 ];
#  then
#    echo "# ----- $INST_APP ------------------------------------------------------" >> /etc/apt/sources.list
#    echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list
#    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
#    apt-get update 1> /dev/null && apt-get install $INST_APP -y 1> /dev/null && echo "# --------------- Installed : [ $INST_APP ]";
#  else echo "# ---- All Readdy installed : [ ${FC_G}${INST_APP}${C_ESC} ] Info: $(man ${INST_APP} 2>/dev/null | grep NAME -A1 | tail -n1 | column -t)";
#fi
# ======================================================================================================
# --- jdownloader
#
###### 3rd Party Binary Repos

#### JDownloader PPA - https://launchpad.net/~jd-team
##
#
#   apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6A68F637
#   deb-src http://ppa.launchpad.net/jd-team/jdownloader/ubuntu vivid main
#   deb http://ppa.launchpad.net/jd-team/jdownloader/ubuntu vivid main

INST_APP='jdownloader'
if [ $( grep "^deb.*ppa.launchpad.net/jd-team/jdownloader/ubuntu trusty main" /etc/apt/sources.list | wc -l | bc) = 0 ];
  then
    echo "# ----- $INST_APP ------------------------------------------------------" >> /etc/apt/sources.list
    echo 'deb http://ppa.launchpad.net/jd-team/jdownloader/ubuntu trusty main' >> /etc/apt/sources.list
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6A68F637
    apt-get update 1> /dev/null && apt-get install $INST_APP -y 1> /dev/null && echo "# --------------- Installed : [ $INST_APP ]";
  else echo "# ---- All Readdy installed : [ ${FC_G}${INST_APP}${C_ESC} ] Info: $(man ${INST_APP} 2>/dev/null | grep NAME -A1 | tail -n1 | column -t)";
fi
# ======================================================================================================
# --- spotify-client
#
INST_APP='spotify-client'
if [ $( grep '^deb.*r.*y.s.*y.*m.*stab.*ee' /etc/apt/sources.list | wc -l | bc) = 0 ];
  then
    echo "# ----- $INST_APP ------------------------------------------------------" >> /etc/apt/sources.list
    echo 'deb http://repository.spotify.com stable non-free' >> /etc/apt/sources.list
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
    apt-get update 1> /dev/null && apt-get install $INST_APP -y 1> /dev/null && echo "# --------------- Installed : [ $INST_APP ]";
  else echo "# ---- All Readdy installed : [ ${FC_G}${INST_APP}${C_ESC} ] Info: $(man ${INST_APP} 2>/dev/null | grep NAME -A1 | tail -n1 | column -t)";
fi
# ======================================================================================================
# --- DVD libdvdread4 regionset
#
INST_APP='libdvdread4'
if [ $(dpkg -l | grep ^ii[[:space:]][[:space:]]${INST_APP} | wc -l | bc) = 0 ];
  then apt-get install ${INST_APP} -y 1> /dev/null && echo "# --------------- Installed : [ ${INST_APP} ]";
  /usr/share/doc/libdvdread4/install-css.sh;
  else echo "# ---- All Readdy installed : [ ${FC_G}${INST_APP}${C_ESC} ] Info: $(man ${INST_APP} 2>/dev/null | grep NAME -A1 | tail -n1 | column -t)";
fi
#
INST_APP='regionset'
if [ $(dpkg -l | grep ^ii[[:space:]][[:space:]]${INST_APP} | wc -l | bc) = 0 ];
  then apt-get install ${INST_APP} -y 1> /dev/null && echo "# --------------- Installed : [ ${INST_APP} ]";
  regionset 1>/dev/null
  else echo "# ---- All Readdy installed : [ ${FC_G}${INST_APP}${C_ESC} ] Info: $(man ${INST_APP} 2>/dev/null | grep NAME -A1 | tail -n1 | column -t)";
fi
# ======================================================================================================
# --- Google | Drive-tools
#
#INST_APP='grive-tools'
#if [ $( grep '^deb.*gr.*ls.*main' /etc/apt/sources.list | wc -l | bc) = 0 ];
#  then
#    echo "# ----- $INST_APP ------------------------------------------------------" >> /etc/apt/sources.list
#    echo 'deb http://ppa.launchpad.net/thefanclub/grive-tools/ubuntu trusty main' >> /etc/apt/sources.list
#    apt-get update 1> /dev/null && apt-get install $INST_APP -y 1> /dev/null && echo "# --------------- Installed : [ $INST_APP ]";
#  else echo "# ---- All Readdy installed : [ ${FC_G}${INST_APP}${C_ESC} ] Info: $(man ${INST_APP} 2>/dev/null | grep NAME -A1 | tail -n1 | column -t)";
#fi
#
#######
#######
dpkg-reconfigure locales
###
###
##
########
# V2
########
#http://wiki.ubuntuusers.de/Rechtschreibkorrektur
#!/bin/bash
#lsb_release -ir
# COLORS
F_BD=$(tput bold);F_IV=$(tput rev);F_UL=$(tput smul);
# Background Collor
BC_B=$(tput setb 0);BC_B=$(tput setb 1);BC_G=$(tput setb 2);BC_Y=$(tput setb 3);BC_R=$(tput setb 4);BC_P=$(tput setb 5);BC_C=$(tput setb 6);BC_GR=$(tput setb 7);
# Font Collor
FC_B=$(tput setf 0);FC_B=$(tput setf 1);FC_G=$(tput setf 2);FC_Y=$(tput setf 3);FC_R=$(tput setf 4);FC_P=$(tput setf 5);FC_C=$(tput setf 6);FC_GR=$(tput setf 7);
# Color Reseter
C_ESC=`tput sgr0`
echo "
# ============================================================
# =       Update the repository end upgrade System !!!       =
# ============================================================
"
#apt-get update 1> /dev/null && apt-get upgrade -y 1> /dev/null
apt-get update && apt-get upgrade -y
#
#
#
INSTALL_APPS () {
for i in $APPS; do
    if [ $(dpkg -l | grep ^ii[[:space:]][[:space:]]${i} | wc -l | bc) = 0 ];
    then apt-get install $i -y 1> /dev/null && echo "# --------------- Installed : [ $i ]";
    else echo "# ---- All Readdy installed : [ ${FC_G}${i}${C_ESC} ] Info: $(man ${i} 2>/dev/null | grep NAME -A1 | tail -n1 | column -t)";
    fi
done
}
#
#
#
#homebank
echo -e "
# ============================================================
# =                  Install Office                          =
# ============================================================
"
APPS="
anki
basket
calibre
ekiga
libreoffice
libreoffice-l10n-hu
myspell-hu
libreoffice-l10n-de
myspell-de-de
libreoffice-l10n-en-gb
myspell-en-gb
libreoffice-kde
libreoffice-style-oxygen
libreoffice-presentation-minimizer
thunderbird
thunderbird-locale-hu
thunderbird-locale-de
blogilo
"
INSTALL_APPS
##
##
##
echo -e "
# ============================================================
# =                  Install Multimedia                      =
# ============================================================
"
APPS="
winff
winff-qt
gimp
gimp-plugin-registry
gimp-ufraw
gimp-dcraw
phatch
darktable
rawtherapee
radiotray
smplayer
xsane
shutter
digikam
showfoto
patch
vlc
flashplugin-installer
"
INSTALL_APPS
##
##
##
echo -e "
# ============================================================
# =                  Install Utilitis                        =
# ============================================================
"
APPS="
locales
bleachbit
k4dirstat
nmap
gparted
lynis
rkhunter
geoip-bin
curl
krusader
arj
zip
ark
bzip2
cpio
kdiff3
kompare
kmail
konsole
krename
md5deep
cfv
okteta
p7zip
rpm
unace
unrar
unrar-free
rar
unzip
gtkterm
mc
htop
vim
yakuake
keepassx
pv
openvpn
"
#
INSTALL_APPS
#
##
##
##
#   https://github.com/hanschen/ksuperkey
#   http://blog.hanschen.org/2012/10/17/open-application-launcher-with-super-key/
#
#
# ======================================================================================================
# --- winusb
#
#INST_APP='winusb'
#if [ $( grep "^deb.*launchpad.*sau.*in" /etc/apt/sources.list | wc -l | bc) = 0 ];
#  then
#    echo "# ----- $INST_APP ------------------------------------------------------" >> /etc/apt/sources.list
#    echo 'deb http://ppa.launchpad.net/colingille/freshlight/ubuntu saucy main' >> /etc/apt/sources.list
#    apt-get update 1> /dev/null && apt-get install $INST_APP -y 1> /dev/null && echo "# --------------- Installed : [ $INST_APP ]";
#  else echo "# ---- All Readdy installed : [ ${FC_G}${INST_APP}${C_ESC} ] Info: $(man ${INST_APP} 2>/dev/null | grep NAME -A1 | tail -n1 | column -t)";
#fi
# ======================================================================================================
# --- multisystem
#
#INST_APP='multisystem'
#if [ $( grep "^deb.*liveusb" /etc/apt/sources.list | wc -l | bc) = 0 ];
#  then
#    echo "# ----- $INST_APP ------------------------------------------------------" >> /etc/apt/sources.list
#    echo 'deb http://liveusb.info/multisystem/depot all main' >> /etc/apt/sources.list
#    wget -q -O - http://liveusb.info/multisystem/depot/multisystem.asc | apt-key add -
#    apt-get update 1> /dev/null && apt-get install $INST_APP -y 1> /dev/null && echo "# --------------- Installed : [ $INST_APP ]";
#    sudo usermod -a -G adm nemo
#  else echo "# ---- All Readdy installed : [ ${FC_G}${INST_APP}${C_ESC} ] Info: $(man ${INST_APP} 2>/dev/null | grep NAME -A1 | tail -n1 | column -t)";
#fi
# ======================================================================================================
# --- google-chrome-stable
#
#INST_APP='google-chrome-stable'
#if [ $( grep "^deb.*dl.google.com" /etc/apt/sources.list | wc -l | bc) = 0 ];
#  then
#    echo "# ----- $INST_APP ------------------------------------------------------" >> /etc/apt/sources.list
#    echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list
#    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
#    apt-get update 1> /dev/null && apt-get install $INST_APP -y 1> /dev/null && echo "# --------------- Installed : [ $INST_APP ]";
#  else echo "# ---- All Readdy installed : [ ${FC_G}${INST_APP}${C_ESC} ] Info: $(man ${INST_APP} 2>/dev/null | grep NAME -A1 | tail -n1 | column -t)";
#fi
# ======================================================================================================
# --- jdownloader
#
###### 3rd Party Binary Repos

#### JDownloader PPA - https://launchpad.net/~jd-team
##
#
#   apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6A68F637
#   deb-src http://ppa.launchpad.net/jd-team/jdownloader/ubuntu vivid main
#   deb http://ppa.launchpad.net/jd-team/jdownloader/ubuntu vivid main

INST_APP='jdownloader'
if [ $( grep "^deb.*ppa.launchpad.net/jd-team/jdownloader/ubuntu trusty main" /etc/apt/sources.list | wc -l | bc) = 0 ];
  then
    echo "# ----- $INST_APP ------------------------------------------------------" >> /etc/apt/sources.list
    echo 'deb http://ppa.launchpad.net/jd-team/jdownloader/ubuntu trusty main' >> /etc/apt/sources.list
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6A68F637
    apt-get update 1> /dev/null && apt-get install $INST_APP -y 1> /dev/null && echo "# --------------- Installed : [ $INST_APP ]";
  else echo "# ---- All Readdy installed : [ ${FC_G}${INST_APP}${C_ESC} ] Info: $(man ${INST_APP} 2>/dev/null | grep NAME -A1 | tail -n1 | column -t)";
fi
# ======================================================================================================
# --- spotify-client
#
INST_APP='spotify-client'
if [ $( grep '^deb.*r.*y.s.*y.*m.*stab.*ee' /etc/apt/sources.list | wc -l | bc) = 0 ];
  then
    echo "# ----- $INST_APP ------------------------------------------------------" >> /etc/apt/sources.list
    echo 'deb http://repository.spotify.com stable non-free' >> /etc/apt/sources.list
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
    apt-get update 1> /dev/null && apt-get install $INST_APP -y 1> /dev/null && echo "# --------------- Installed : [ $INST_APP ]";
  else echo "# ---- All Readdy installed : [ ${FC_G}${INST_APP}${C_ESC} ] Info: $(man ${INST_APP} 2>/dev/null | grep NAME -A1 | tail -n1 | column -t)";
fi
# ======================================================================================================
# --- DVD libdvdread4 regionset
#
INST_APP='libdvdread4'
if [ $(dpkg -l | grep ^ii[[:space:]][[:space:]]${INST_APP} | wc -l | bc) = 0 ];
  then apt-get install ${INST_APP} -y 1> /dev/null && echo "# --------------- Installed : [ ${INST_APP} ]";
  /usr/share/doc/libdvdread4/install-css.sh;
  else echo "# ---- All Readdy installed : [ ${FC_G}${INST_APP}${C_ESC} ] Info: $(man ${INST_APP} 2>/dev/null | grep NAME -A1 | tail -n1 | column -t)";
fi
#
INST_APP='regionset'
if [ $(dpkg -l | grep ^ii[[:space:]][[:space:]]${INST_APP} | wc -l | bc) = 0 ];
  then apt-get install ${INST_APP} -y 1> /dev/null && echo "# --------------- Installed : [ ${INST_APP} ]";
  regionset 1>/dev/null
  else echo "# ---- All Readdy installed : [ ${FC_G}${INST_APP}${C_ESC} ] Info: $(man ${INST_APP} 2>/dev/null | grep NAME -A1 | tail -n1 | column -t)";
fi
# ======================================================================================================
# --- Google | Drive-tools
#
#INST_APP='grive-tools'
#if [ $( grep '^deb.*gr.*ls.*main' /etc/apt/sources.list | wc -l | bc) = 0 ];
#  then
#    echo "# ----- $INST_APP ------------------------------------------------------" >> /etc/apt/sources.list
#    echo 'deb http://ppa.launchpad.net/thefanclub/grive-tools/ubuntu trusty main' >> /etc/apt/sources.list
#    apt-get update 1> /dev/null && apt-get install $INST_APP -y 1> /dev/null && echo "# --------------- Installed : [ $INST_APP ]";
#  else echo "# ---- All Readdy installed : [ ${FC_G}${INST_APP}${C_ESC} ] Info: $(man ${INST_APP} 2>/dev/null | grep NAME -A1 | tail -n1 | column -t)";
#fi
#
#######
#######
dpkg-reconfigure locales
###
###
##
