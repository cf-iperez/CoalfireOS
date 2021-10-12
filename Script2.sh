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
chmod +x *.*
sudo apt update -y  > /dev/null 2>&1
echo "[*] - Please wait... "
sudo apt install -y git  > /dev/null 2>&1
sudo apt install -y neofetch  > /dev/null 2>&1
neofetch > /dev/null 2>&1
sudo apt install -y grub-customizer  > /dev/null 2>&1


echo "[*] - Changing the profile configuration files..."
cp src/profile/.face ~/.face
cp src/profile/Pictures/* ~/Pictures

sudo chmod +x ~/.config/neofetch
cp -r src/profile/.config/neofetch/ ~/.config/
sudo cp -r ~/.config/neofetch/ /root/.config/

sudo cp src/profile/Pictures/Coalfire.png /usr/share/backgrounds/kali-16x9/default
tar -xJf src/Arc-Ubuntu.tar.xz > /dev/null 2>&1
cp -r Arc-Ubuntu/ ~/.config/xfce4/Arc-Ubuntu ~/.local/share/icons > /dev/null 2>&1
gtk-update-icon-cache ~/.local/share/icons/Arc-Ubuntu > /dev/null 2>&1

cp src/profile/.zshrc ~/.zshrc
cp src/profile/.p10k.zsh ~/.p10k.zsh
sudo cp src/profile/.zshrc /root/.zshrc

sudo cp src/profile/.zshrc ~/.zshrc
sudo cp src/profile/.p10k.zsh /root/.p10k.zsh
sudo cp src/profile/.config/neofetch/config.conf ~/.config/neofetch/
sudo cp src/profile/.config/neofetch/CF1.txt ~/.config/neofetch/

sudo unlink /usr/share/desktop-base/kali-theme/login/background > /dev/null 2>&1
sudo ln -s ~/Pictures/CF-logo.jpg /usr/share/desktop-base/kali-theme/login/background
sudo cp src/profile/Pictures/CoalfireLogo.png /usr/share/desktop-base/kali-theme/login/
sudo cp src/usr/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
sudo chmod +x ~/.config/xfce4
cp -r src/profile/.config/xfce4 ~/.config

echo "[*] - Changing boot images..."
sudo cp -r src/usr/share/images/* /usr/share/images/
sudo cp -r src/usr/share/plymouth/ /usr/share/
sudo cp /usr/share/desktop-base/kali-theme/grub/grub-4x3.png /usr/share/desktop-base/kali-theme/grub/grub-16x9.png
sudo rm -rf /usr/share/plymouth/themes/details/kali
sudo cp /usr/share/grub/themes/kali/grub-4x3.png /usr/share/grub/themes/kali/background.png
sudo cp /usr/share/grub/themes/kali/grub-4x3.png /boot/grub/themes/kali/grub-4x3
sudo cp /usr/share/grub/themes/kali/grub-4x3.png /boot/grub/themes/kali/grub-16x9
sudo cp /usr/share/grub/themes/kali/grub-4x3.png /boot/grub/themes/kali/background.png
sudo rm -rf /usr/share/plymouth/themes/debian-theme/*
sudo cd /usr/share/plymouth/themes/empire-start
sudo cp * ../debian-theme
sudo cp -r /usr/share/plymouth/themes/empire-start/ /usr/share/plymouth/themes/debian-theme
sudo cp -r /usr/share/plymouth/themes/empire-start/ sudo cp -r /usr/share/plymouth/themes/debian-theme
sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/empire-start 100
sudo update-alternatives --config default.plymouth
sudo update-initramfs -u
