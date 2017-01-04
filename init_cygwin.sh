#!/bin/bash
lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > apt-cyg
install apt-cyg /bin
INSTALL_APPS='
_autorebase
_update-info-dir
alternatives
aspell
attr
base-cygwin
base-files
bash
bash-completion
binutils
bzip2
ca-certificates
coreutils
cron
curl
cvs
cygutils
cygwin
cygwin-doc
dash
diffutils
dos2unix
editrights
exif
file
findutils
gawk
gcc-core
gcc-g++
gdbm
getent
gettext
gettext-devel
git
git-svn
gmp
gnupg
grep
groff
gzip
hostname
ipc-utils
less
libargp
libbz2_1
libffi-devel
libfreetype-devel
libgmp-devel
libiconv
libiconv2
libzmq5
libzmq-devel
login
lynx
make
man-db
mc
mintty
mpfr
nano
ncurses
ocaml
openssh
openssl
openssl-devel
optipng
p11-kit
patchutils
pcre
perl
popt
python
python3
python3-yaml
python3-zmq
python-crypto
python-jinja2
python-openssl
python-paramiko
python-setuptools
python-yaml
rebase
rsync
ruby
run
rxvt-unicode-X
screen
sed
ssmtp
subversion
sqlite3-compress
sqlite3-extensions
sqlite3-icu
sqlite3-rbu
sqlite3-vfslog
sqlite3-zlib
sqlite3
sqliteman
tar
texinfo
tzcode
unzip
util-linux
vim
wget
which
xmlstarlet
xz
zip
zlib
inetutils
bind-utils
libffi6
libpipeline1
libtasn1_6
libintl8
nc
makepasswd
findutils
libpcre1
ping
httping
gdb
'
for i in $INSTALL_APPS;  do apt-cyg install $i;done
###
###
#base-cygwin
#cygcheck-dep
#cygport
#cygrunsrv
#cygutils-extra
#cygutils-x11
#cygutils
#cygwin-devel
#cygwin-doc
#cygwin-x-doc
#cygwin
#xorg-x11-base
#xorg-x11-devel
#libtool-devel
#
# Install Ansible
#wget https://bootstrap.pypa.io/get-pip.py
#python get-pip.py
###
easy_install-2.7 pip
easy_install-3.4 pip
#easy_install requests
#easy_install psutil
###
pip install ansible
#
#pip install cython
#pip install jupyter
#pip install numpy
#pip install pandas
#pip install matplotlib
#
#####
# cygcheck -s -v -r
#####

# FIX apt-cyg remove python-pyasn1
