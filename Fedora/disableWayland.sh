#!/bin/bash
file="/etc/gdm/custom.conf"
sudo sed -i 's/#WaylandEnable=false/WaylandEnable=false/g' $file
