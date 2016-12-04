#!/bin/bash
HOSTNAME="ubuntu1604-$(echo $0 | awk -F '_' '{print $1}')"
IP="172.3.14.$(echo $0 | awk -F '_' '{print $2}')"
SSH_PORT="$(echo $0 | awk -F '_' '{print $3}')"
#
if test -d "$HOSTNAME";
then cd "$HOSTNAME";vagrant destroy -f;cd ../;rm -rf "$HOSTNAME";mkdir "$HOSTNAME";cd "$HOSTNAME";cp ../$0 ./;
else mkdir "$HOSTNAME";cd "$HOSTNAME";cp ../$0 ./;
fi 
#
cat << EOF >> Vagrantfile
# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "${HOSTNAME}"
  #config.vm.box_check_update = false
  config.vm.network :forwarded_port, guest: 22, host: ${SSH_PORT}, id: 'ssh'
  config.vm.network "private_network", ip: "${IP}"
  # config.vm.network "public_network"
  config.vm.synced_folder "$(pwd)/vm-data", "/vagrant_data"
  config.vm.provider "virtualbox" do |vb| 
    vb.gui = false
    vb.name = "${HOSTNAME}"
    vb.cpus = "1"
    vb.memory = "256" 
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "65"]
  end
  config.vm.provision "shell", path: "vm-init.sh"
end
EOF
#
test -d ./vm-data || mkdir vm-data
#
test -f ./vm-init.sh || cat << 'INITEOF' >> vm-init.sh
fmakebashrc () {
test -e $BASHRC_DIR/.bashrc && rm $BASHRC_DIR/.bashrc
cat << 'EOF' >> $BASHRC_DIR/.bashrc
case $- in
    *i*) ;;
      *) return;;
esac
#
shopt -s histappend
shopt -s checkwinsize
HISTSIZE=2000
HISTFILESIZE=4000
HISTTIMEFORMAT="%d/%m/%y %T "
HISTCONTROL=ignoreboth
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
#
PS1='$(tput sgr0)\$$(tput setaf 2;tput bold) vagrant $(tput sgr0)$(date "+%H:%M:%S") $(tput setaf 4;tput setab 2)$(id -un)@$(hostname -f):$(tput sgr0;tput bold)$PWD$(tput sgr0)
$ '
PS2='# '
#
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
#
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
EOF
}
###
fmakebashaliases () {
test -e $BASHRC_DIR/.bash_aliases  && rm $BASHRC_DIR/.bash_aliases 
cat << 'EOF' >> $BASHRC_DIR/.bash_aliases 
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
EOF
}
###
fmakeprofiles () {
test -e $BASHRC_DIR/.profile && rm $BASHRC_DIR/.profile
cat << 'EOF' >> $BASHRC_DIR/.profile
if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi
EOF
}
###
BASHRC_DIR=/root;fmakebashrc;fmakebashaliases;fmakeprofiles;
BASHRC_DIR=/home/ubuntu;fmakebashrc;fmakebashaliases;fmakeprofiles;
apt update && apt upgrade -y
INITEOF
#
vagrant up 
#
