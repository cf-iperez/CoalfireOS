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

echo "[*] - Installing autoDeploy for customization of ZSH terminal..."

cd autoDeploy
chmod +x autoDeploy.sh
sudo /bin/bash ./autoDeploy.sh --install terminal
cd ..