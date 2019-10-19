#!/bin/bash

user=$(whoami)

if [ $user == "root" ]; then
        echo "No ejecutes este script como root.."
        exit 1
fi


cat <<EOF | sudo tee /etc/yum.repos.d/virtualbox.repo
[virtualbox]
name=Fedora $releasever - $basearch - VirtualBox
baseurl=http://download.virtualbox.org/virtualbox/rpm/fedora/29/\$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://www.virtualbox.org/download/oracle_vbox.asc
EOF
sudo dnf install -y VirtualBox-6.0

sudo usermod -a -G vboxusers $user
