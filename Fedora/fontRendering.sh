sudo dnf install freetype-freeworld
if [ -f /etc/fonts/local.conf ]; then
sudo rm /etc/fonts/local.conf
fi
sudo cp local.conf /etc/fonts
