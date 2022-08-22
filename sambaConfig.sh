#!/bin/bash

sudo apt-get install samba samba-common-bin
printf "\nInstalling samba from apt packages\n"

mkdir ~/samba-drive
printf "\nCreating directory for shared drive\n"

printf "\nConfiguring samba configuration file\n"
cd ../../
sudo sed "[local-drive]
path = /home/dev/samba-drive
writeable=Yes
create mask=0777
directory mask=0777
public=no" /etc/samba/smb.conf

printf "\nCreating user & password for samba drive\n"
sudo smbpasswd -a dev

printf "\nRestarting samba service\n"
sudo systemctl restart smbd