#!/bin/bash

yum install -y epel-release
yum install -y vim git subversion tmux bc
echo "source /vagrant/.bash_main" >> ~vagrant/.bashrc
