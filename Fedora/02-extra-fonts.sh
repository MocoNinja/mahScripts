#!/bin/bash
echo "Instalando cabextract para poder extraer las fuentes de Microsoft..."
sudo dnf install -y cabextract
echo "Instalando fuentes de microsoft..."
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
echo "Copiando configuraciones..."
mkdir -p "$HOME/.config/fontconfig/"
cp "./fonts/fonts.conf" "$HOME/.config/fontconfig/fonts.conf"
cp "./fonts/.Xresources" "$HOME/.Xresources"
xrdb -merge $HOME/.Xresources
## Esto está bug. Arreglar
if grep "xrdb -merge $HOME/.Xresources" $HOME/.bashrc ; then
	echo "Bashrc ya tiene la conf!"
else
	echo "Metiendo configuración al bashrc..."
	echo "xrdb -merge $HOME/.Xresources" >> $HOME/.bashrc
fi

echo "Instalando fuentes mejores..."
sudo dnf copr enable -y dawid/better_fonts
sudo dnf install -y fontconfig-enhanced-defaults fontconfig-font-replacements
echo "Instalando algunas fuentes adicionales..."
sudo dnf install -y google-roboto-* google-noto* *inconsolata*
echo "Configurando freetype..."
echo "export FREETYPE_PROPERTIES=\"truetype:interpreter-version=40\"" | sudo tee "/etc/profile.d/freetype.sh"
echo "export FREETYPE_PROPERTIES=\"truetype:interpreter-version=40\"" | sudo tee "/etc/profile.d/freetype2.sh"
