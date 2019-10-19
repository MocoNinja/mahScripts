#!/bin/bash

user=$(whoami)

if [ $user == "root" ]; then
        echo "No ejecutes este script como root.."
        exit 1
fi

echo "Instalando docker..."
curl https://get.docker.com/ | sh

echo "Dando permisos al usuario..."
sudo usermod -aG docker $user

echo "Configurando servicio..."
sudo systemctl enable --now docker
