#!/bin/bash

## DATA
declare -A packages=(["GNOME"]="tilix seahorse gnome-tweaks" ["GNOME_EXTENSIONS"]="gnome-shell-extension-topicons-plus" ["GNOME_THEMES"]="*yaru*" ["PYTHON"]="python3-pip python3-black python3-pylint" ["JS"]="npm nodejs" ["JAVA"]="maven gradle ant java-1.8* java-11* tomcat tomcat*webapps* tomcat-javadoc tomcat-taglibs* tomcat-jsp*" ["NET"]="curl qbittorrent" ["SHELL"]="neofetch caca-utils ranger figlet" ["LIBS_Y_GENERALES"]="@development-tools kernel-headers kernel-devel dkms elfutils-libelf-devel qt5-qtx11extras" ["DEVOPS_TOOLS"]="ansible ansible-doc python3-ansible-lint vim-syntastic-ansible vagrant vagrant-doc" ["DOCS"]="calibre pandoc texlive")

services="tomcat"

## TMP
CMD=""

## Prepare packages
for group in "${!packages[@]}"; do
	for package in ${packages[$group]}; do
		CMD="$CMD $package"
	done
done

## Setup install cmd
CMD_INSTALL="sudo dnf install -y$CMD"

## Clean tmp
CMD=""

## Prepare services
for service in $services; do
	CMD="$CMD $service"	
done

## Setup services cmd
CMD_SERVICES="sudo systemctl enable --now$CMD"


echo "El comando de instalación es: $CMD_INSTALL"
echo "El comando de servicos es: $CMD_SERVICES"

echo "instalando paquetes..."
$CMD_INSTALL
echo "configurando servicios..."
$CMD_SERVICES
echo "Se acabó! 👋"
