#!/bin/bash

echo "Instalando grupo..."
sudo dnf groupupdate -y Multimedia
echo "Instalando popurrí de paquetes..."
sudo dnf install -y gstreamer1-{ffmpeg,libav,plugins-{good,ugly,bad{,-free,-nonfree}}} --setopt=strict=0
sudo dnf install -y gstreamer1-{plugin-crystalhd,ffmpeg,plugins-{good,ugly,bad{,-free,-nonfree,-freeworld,-extras}{,-extras}}} libmpg123 lame-libs --setopt=strict=0
sudo dnf remove -y gstreamer1-plugins-ugly
sudo dnf install -y gstreamer1-plugin-mpg123 mpg123-libs
sudo dnf install -y vlc vlc-extras
