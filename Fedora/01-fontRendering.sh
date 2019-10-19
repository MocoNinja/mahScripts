echo "Instalando renderizado de fuentes..."
sudo dnf install -y freetype-freeworld

if [ -f /etc/fonts/local.conf ]; then
echo "Respaldando archivo existente de configuración..."
sudo cp /etc/fonts/local.conf /etc/fonts/local.conf.OLD
fi

echo "Instalando archivo optimizado de configuración..."
sudo cp local.conf /etc/fonts
echo "Instalación exitosa!"

echo "Instalando configuración en xResources..."
cat << until_it_ends | sudo tee /home/$USER/.Xresources > /dev/null
Xft.dpi: 96
Xft.antialias: true
Xft.hinting: true
Xft.rgba: rgb
Xft.autohint: false
Xft.hintstyle: hintslight
Xft.lcdfilter: lcddefault
until_it_ends

xrdb -merge /home/$USER/.Xresources
fc-cache -f
echo "Instalación exitosa!"
