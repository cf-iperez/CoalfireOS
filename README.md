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

The first step is:
```
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
./Script1.sh
```
In this step you need to put the Hostname of your Kali Linux and your username make the customization.
After install the "autoDeploy" customization for Desktop and Terminal options, you need press "Y" and reboot the system to see the changes.

After reboot, log in your system and go to the CoalfireOS folder again.

The last step is:
```
./Script2.sh
```

This second script must apply the Coalfire customization (Icons, background, grub loader, etc).

Finally reboot the system again

Enjoy the Kali Linux with CoalfireOS customization!!!

## Build with 🛠️
* [I used the @m4l4l0 autoDeploy](https://github.com/m4lal0/autoDeploy) - Script for the first customization in Desktop and Terminal layer.
