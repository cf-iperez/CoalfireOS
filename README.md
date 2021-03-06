# CoalfireOS
```
|----------------------------------------------------|
|                                 .::..              |
|                              .:::::::::.           |
|                          ..::::::...::::::..       |
|                      .:==-:::..       .:::::::.    |
|                   :-=++++===:            ..::::.   |
|               .:==+++==-==+++==:.          ::::.   |
|            :-=++++=-.:::::.-=++++=-:       ::::.   |
|           -+====:.   .:::.   .:-===+:      ::::.   |
|           -+=+-      .:::.      -+=+:      ::::.   |
|           -+=+-      .:::.      -+=+:      ::::.   |
|           -+=+-      .::::..    -+=+:    ..::::.   |
|           -+=+-       .:::::::. -+=+: .:::::::.    |
|           -+=+:          ..:::::-===-:::::..       |
|           -+===:.            .--===+=::.           |
|           .-=++++=-.       .-==+++=-.              |
|              .:==+++=-:.:-=+++==-.                 |
|                 .:-=+++++++=-:.                    |
|                     .-===-.                        |
|----------------------------------------------------|
|        Coalfire linux customization tool           |
|----------------------------------------------------|
|                 by Ignacio Pérez                   |
|----------------------------------------------------|
```
Scripts to make a CoalfireOS customization on your VM

To prevent some bugs or issues to download some packages, put the network interface on "Bridge" mode.

The first step is:
```
sudo apt update
sudo apt upgrade
git clone https://github.com/cf-iperez/CoalfireOS.git
```

The second step:
```
cd CoalfireOS/
chmod +x Script1.sh
chmod +x Script2.sh
```

Step 3:
```
./Script1.sh - (without sudo command)
```
In this step you need to put the Hostname of your Kali Linux and your username for making the customization.
After install the "autoDeploy" customization for Desktop and Terminal options, you need press "Y" and reboot the system to see the changes.

After reboot, log in your system and go to the CoalfireOS folder again.

The last step is:
```
./Script2.sh - (without sudo command)
```

This second script must apply the Coalfire customization (Icons, background, grub loader, etc).

Finally reboot the system again

Enjoy the Kali Linux with CoalfireOS customization!!!

## Build with 🛠️
* [I used the @m4l4l0 autoDeploy](https://github.com/m4lal0/autoDeploy) - Script for the first customization in Desktop and Terminal layer.
