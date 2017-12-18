#!/bin/bash

# CentOS7:
# yum install -y epel-release
# yum install -y vim git subversion tmux bc docker
# cat <<EOF > /etc/docker/daemon.json
# {
#     "live-restore": true,
#     "group": "dockerroot"
# }
# EOF
# systemctl enable docker.service
# systemctl start docker.service
# usermod -aG dockerroot vagrant

dnf install -y vim git subversion tmux bc docker
groupadd docker
gpasswd -a vagrant docker
usermod -aG docker vagrant
systemctl enable docker.service
systemctl start docker.service
setenforce 0
sed -i 's/^SELINUX=.*$/SELINUX=permissive/' /etc/selinux/config
echo "source /vagrant/.bash_main" >> ~vagrant/.bashrc
