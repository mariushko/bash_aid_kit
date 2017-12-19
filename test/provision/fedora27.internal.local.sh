#!/bin/bash

dnf install -y vim git subversion tmux bc docker
groupadd docker
gpasswd -a vagrant docker
usermod -aG docker vagrant
systemctl enable docker.service
systemctl start docker.service
# setenforce 0
# sed -i 's/^SELINUX=.*$/SELINUX=permissive/' /etc/selinux/config
echo "source /vagrant/.bash_main" >> ~vagrant/.bashrc
