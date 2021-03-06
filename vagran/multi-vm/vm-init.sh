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
test -e $BASHRC_DIR/.bash_aliases && rm $BASHRC_DIR/.bash_aliases
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
#
USERNAME='nemo'
USERPASS='toor123'
adduser $USERNAME --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password  && echo "$USERNAME:$USERPASS" | chpasswd
#echo "$USERNAME  ALL=(ALL:ALL) ALL" >> /etc/sudoers
# fix echo sudoers
#sed -i 's/nemo.*//g;/^$/d' /etc/sudoers
usermod $USERNAME -G sudo,admin
echo 'nemo ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/80-ansible-init-users
#
cp -rv /home/ubuntu/.ssh/ /home/${USERNAME}/ && chown -R nemo: /home/${USERNAME}/
echo '# 2048 SHA256:yj3/5dThSgLm+QAatmBDOWqEcp3hhlwrL69pmAgJiTA /home/nemo/.ssh/vagrant/id_rsa (RSA)
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC6TdSXaLccgENxqgYT0TsMTQ7n5m7QOc70JbA1Khk//JebcSeNA1GUkIoz906p+DNxvnRhq4Hl/AUvgA0meGojF0kGxrgxo7LayPa9Ussz+z3QbRmZKJ2RRMEEvjl2TI+STkZ70K3n6AYgPE5u2HbjmgX/pU6ELKKMkd/HpQ/NYhOLzbI3M5IvpdE8p6jCCzPp5igz1FlQivBq9OqJUDYF2zL1ejDucXO3hyum3/ay3phtWd5JSsxUt/9RvcdIkB5eEUX6qg5GhAURxhJ2S4kEnXZ+IdgZfAhBsfIidstNVXsoW1tG1tkM/Kz59JHna4/QAp51zMsRobkfGNK01f+F nemo@nautilus-t410
' > /home/${USERNAME}/.ssh/authorized_keys
#
echo "ubuntu:toor123" | chpasswd
echo "root:toor123" | chpasswd
#
BASHRC_DIR=/root;fmakebashrc;fmakebashaliases;
BASHRC_DIR=/home/ubuntu;fmakebashrc;fmakebashaliases;
BASHRC_DIR=/home/nemo;fmakebashrc;fmakebashaliases;
#
apt-get update && apt-get install -y python-minimal && apt-get upgrade -y
