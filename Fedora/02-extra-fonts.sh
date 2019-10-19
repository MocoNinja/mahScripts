#!/bin/bash
echo "Instalando cabextract para poder extraer las fuentes de Microsoft..."
sudo dnf install -y cabextract
echo "Instalando fuentes de microsoft..."
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
echo "Instalando fuentes mejores..."
sudo dnf copr enable -y dawid/better_fonts
sudo dnf install -y fontconfig-enhanced-defaults fontconfig-font-replacements
echo "Configurando freetype..."
echo "export FREETYPE_PROPERTIES=truetype:interpreter-version=40" | sudo tee "/etc/profile.d/freetype.sh"
