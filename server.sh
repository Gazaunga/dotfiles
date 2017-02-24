#!/bin/bash
git clone https://github.com/jasonheecs/ubuntu-server-setup.git
cd ubuntu-server-setup
bash setup.sh
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub
reboot
