#!/bin/bash

ancho_linea=81

function line {
	((contador++))
	while [ $contador -lt $ancho_linea ]; do
		# msg=$msg"+="
		# msg=$msg"="
		msg=$msg+"="
		((contador++))
	done
	echo $msg
}

line
echo "WELCOME TO MY SCRIPT..."
line
line
echo "KILLING SELINUX..."
sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
line
echo "UPDATING THE SYSTEM..."
sudo yum update -y
line
echo "INSTALLING PACKAGES..."
sudo yum install -y vim docker htop git git-all golang java-1.8.0-openjdk groovy maven https curl mariadb-server mariadb php php-mysql
line
echo "CONFIGURING GIT"
git config --global user.name MocoNinja
git config --global user.email javiergonzaleztello@gmail.com
line
echo "ENABLING DOCKER SERVICE..."
sudo systemctl enable docker
line
echo "INSTALLING DOCKER COMPOSE..."
sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo cp /usr/local/bin/docker-compose /bin/docker-compose
line
echo "DO NOT FORGET TO REBOOT!!!"
line
