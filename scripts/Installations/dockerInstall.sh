#!/bin/bash

# UnInstall unofficial Packages

sudo yum -y remove docker docker-common container-selinux
sudo yum -y remove docker-selinux

# Install using the repository

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://docs.docker.com/engine/installation/linux/repo_files/centos/docker.repo

# Install Docker

sudo yum makecache fast
sudo yum -y install docker-engine
sudo systemctl start docker
