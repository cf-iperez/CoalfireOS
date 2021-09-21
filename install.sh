#!/bin/bash    
clear                
echo "|                                 .::..              |"        
echo "|                              .:::::::::.           |"        
echo "|                          ..::::::...::::::..       |"        
echo "|                      .:==-:::..       .:::::::.    |"        
echo "|                   :-=++++===:            ..::::.   |"        
echo "|               .:==+++==-==+++==:.          ::::.   |"        
echo "|            :-=++++=-.:::::.-=++++=-:       ::::.   |"        
echo "|           -+====:.   .:::.   .:-===+:      ::::.   |"        
echo "|           -+=+-      .:::.      -+=+:      ::::.   |"        
echo "|           -+=+-      .:::.      -+=+:      ::::.   |"        
echo "|           -+=+-      .::::..    -+=+:    ..::::.   |"        
echo "|           -+=+-       .:::::::. -+=+: .:::::::.    |"        
echo "|           -+=+:          ..:::::-===-:::::..       |"        
echo "|           -+===:.            .--===+=::.           |"        
echo "|           .-=++++=-.       .-==+++=-.              |"        
echo "|              .:==+++=-:.:-=+++==-.                 |"        
echo "|                 .:-=+++++++=-:.                    |"        
echo "|                     .-===-.                        |"
echo "|----------------------------------------------------|"
echo "|        Coalfire linux customization tool           |"
echo "|----------------------------------------------------|"
echo "|                 by Ignacio Pérez                   |"
echo "|----------------------------------------------------|"

echo "[*] - Updating repositories..."
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y git

echo "[*] - Download and install autoDeploy for custom ZSH terminal..."
git clone https://github.com/m4lal0/autoDeploy.git
cd autoDeploy
chmod +x autoDeploy.sh
./autoDeploy.sh --install terminal


echo "[*] - Changing the profile configuration files..."
cp profile/.zshrc ~/.zshrc
cp profile/.face ~/.face
cp -r profile/.config/neofetch ~/.config/neofetch
cp -r profile/.config/xfce4 ~/.config/xfce4

echo "[*] - Changing boot images..."
cp -r src/usr/share/images /usr/share/images
cp -r src/usr/share/plymouth /usr/share/plymouth
sudo apt install -y grub-customizer
sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/kali 100
sudo update-alternatives --config default.plymouth
sudo update-initramfs -u