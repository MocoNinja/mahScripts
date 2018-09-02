echo "Instalando renderizado de fuentes..."
sudo dnf install -y freetype-freeworld
if [ -f /etc/fonts/local.conf ]; then
echo "Borrando archivo existente de configuración..."
sudo rm /etc/fonts/local.conf
fi
echo "Instalando archivo optimizado de configuración..."
sudo cp local.conf /etc/fonts
echo "Instalación exitosa!"
