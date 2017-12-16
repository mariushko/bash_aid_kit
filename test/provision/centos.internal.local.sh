#!/bin/bash

yum install -y epel-release
yum install -y vim git subversion tmux bc docker
cat <<EOF > /etc/docker/daemon.json
{
    "live-restore": true,
    "group": "dockerroot"
}
EOF
systemctl enable docker.service
systemctl start docker.service
usermod -aG dockerroot vagrant

echo "source /vagrant/.bash_main" >> ~vagrant/.bashrc
