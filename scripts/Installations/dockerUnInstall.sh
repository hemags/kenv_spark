#!/bin/bash

sudo yum -y remove docker-engine
sudo rm -rf /var/lib/docker
sudo yum -y remove docker docker-common container-selinux
sudo yum -y remove docker-selinux
