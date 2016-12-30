#Add user
# test commit
USERNAME='nemo'
USERPASS='toor123'
adduser $USERNAME --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password  && echo "$USERNAME:$USERPASS" | chpasswd
echo "$USERNAME  ALL=(ALL:ALL) ALL" >> /etc/sudoers
cp -rv /home/ubuntu/.ssh/ /home/${USERNAME}/ && chown -R nemo: /home/${USERNAME}/
