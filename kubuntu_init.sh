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




apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 614C4B38
wget -q https://dl.google.com/linux/linux_signing_key.pub -O- | apt-key add -
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6A68F637

add-apt-repository ppa:kubuntu-ppa/backports -y



apt update && apt dist-upgrade -y



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
