#!/bin/bash
file="/etc/gdm/custom.conf"
user=$(whoami)

if [ $user == "root" ]; then
	echo "No ejecutes este script como root.."
	exit 1
fi

line1="AutomaticLoginEnable=True"
line2="AutomaticLogin=$user"

sudo cp $file $file.BAK

sudo sed -i "/\[daemon\]/a $line2" $file
sudo sed -i "/\[daemon\]/a $line1" $file

#https://unix.stackexchange.com/questions/121161/how-to-insert-text-after-a-certain-string-in-a-file
