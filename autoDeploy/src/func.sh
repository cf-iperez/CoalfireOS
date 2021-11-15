#!/bin/bash
#by @m4lal0

# Regular Colors
Black='\033[0;30m'      # Black
Red='\033[0;31m'        # Red
Green='\033[0;32m'      # Green
Yellow='\033[0;33m'     # Yellow
Blue='\033[0;34m'       # Blue
Purple='\033[0;35m'     # Purple
Cyan='\033[0;36m'       # Cyan
White='\033[0;97m'      # White
Blink='\033[5m'         # Blink
Color_Off='\033[0m'     # Text Reset

# Additional colors
LGray='\033[0;37m'      # Ligth Gray
DGray='\033[0;90m'      # Dark Gray
LRed='\033[0;91m'       # Ligth Red
LGreen='\033[0;92m'     # Ligth Green
LYellow='\033[0;93m'    # Ligth Yellow
LBlue='\033[0;94m'      # Ligth Blue
LPurple='\033[0;95m'    # Light Purple
LCyan='\033[0;96m'      # Ligth Cyan

# Bold
BBlack='\033[1;30m'     # Black
BGray='\033[1;37m'		# Gray
BRed='\033[1;31m'       # Red
BGreen='\033[1;32m'     # Green
BYellow='\033[1;33m'    # Yellow
BBlue='\033[1;34m'      # Blue
BPurple='\033[1;35m'    # Purple
BCyan='\033[1;36m'      # Cyan
BWhite='\033[1;37m'     # White

# Italics
IBlack='\033[3;30m'     # Black
IGray='\033[3;90m'      # Gray
IRed='\033[3;31m'       # Red
IGreen='\033[3;32m'     # Green
IYellow='\033[3;33m'    # Yellow
IBlue='\033[3;34m'      # Blue
IPurple='\033[3;35m'    # Purple
ICyan='\033[3;36m'      # Cyan
IWhite='\033[3;37m'     # White

# Underline
UBlack='\033[4;30m'     # Black
UGray='\033[4;37m'		# Gray
URed='\033[4;31m'       # Red
UGreen='\033[4;32m'     # Green
UYellow='\033[4;33m'    # Yellow
UBlue='\033[4;34m'      # Blue
UPurple='\033[4;35m'    # Purple
UCyan='\033[4;36m'      # Cyan
UWhite='\033[4;37m'     # White

# Background
On_Black='\033[40m'     # Black
On_Red='\033[41m'       # Red
On_Green='\033[42m'     # Green
On_Yellow='\033[43m'    # Yellow
On_Blue='\033[44m'      # Blue
On_Purple='\033[45m'    # Purple
On_Cyan='\033[46m'      # Cyan
On_White='\033[47m'     # White

trap ctrl_c INT

function ctrl_c(){
    echo -e "\n\n${Cyan}[${BYellow}!${Cyan}] ${BRed}Exiting of the application...${Color_Off}"
    tput cnorm
    exit 1
}

### Panel de Ayuda
function helpPanel(){
    echo -e "\n${Cyan}[${BYellow}!${Cyan}]${BGray} Use:${Color_Off}"
    echo -e "\n\t${LGreen}./autoDeploy.sh ${LRed}[OPCION]${Color_Off}"
    echo -e "\n${BGray}OPCIONES:${Color_Off}"
    echo -e "\t${Cyan}[${Red}-i, --install${Cyan}]${Purple} \tComplete customization installation.${Color_Off}"
    echo -e "\t\t${Yellow}terminal: ${Purple}\tOnly install Desktop and Terminal layer customization.${Color_Off}"
    echo -e "\t\t${Yellow}apps: ${Purple}\t\tOnly install third party apps.${Color_Off}"
    echo -e "\t${Cyan}[${Red}-d, --delete${Cyan}]${Purple} \t\tDelete configuration by autoDeploy.${Color_Off}"
    echo -e "\t${Cyan}[${Red}-h, --help${Cyan}]${Purple} \t\tShow help panel.${Color_Off}"
    echo -e "\n${BGray}EXAMPLES:${Color_Off}"
    echo -e "\t${LGray}Complete installation (root)${Color_Off}${Green}\n\t# ./autoDeploy.sh ${Red}--install\n${Color_Off}"
    echo -e "\t${LGray}Installation with Desktop and Terminal layer customization (root)${Color_Off}${Green}\n\t# ./autoDeploy.sh ${Red}--install ${Yellow}terminal\n${Color_Off}"
    echo -e "\t${LGray}Installing with third party apps (root)${Color_Off}${Green}\n\t# ./autoDeploy.sh ${Red}--install ${Yellow}apps\n${Color_Off}"
    echo -e "\t${LGray}Delete customization on Desktop, Terminal and third party apps${Color_Off}${Green}\n\t# ./autoDeploy.sh ${Red}-d\n${Color_Off}"
    tput cnorm; exit 1
}

### Banner
function banner(){
    echo -e "${BYellow}"
    sleep 0.15 && echo -e "\t|----------------------------------------------------|"
	sleep 0.15 && echo -e "\t|                                 .::..              |"
	sleep 0.15 && echo -e "\t|                              .:::::::::.           |"
	sleep 0.15 && echo -e "\t|                          ..::::::...::::::..       |"
	sleep 0.15 && echo -e "\t|                      .:==-:::..       .:::::::.    |"
	sleep 0.15 && echo -e "\t|                   :-=++++===:            ..::::.   |"
	sleep 0.15 && echo -e "\t|               .:==+++==-==+++==:.          ::::.   |"
	sleep 0.15 && echo -e "\t|            :-=++++=-.:::::.-=++++=-:       ::::.   |"
	sleep 0.15 && echo -e "\t|           -+====:.   .:::.   .:-===+:      ::::.   |"
	sleep 0.15 && echo -e "\t|           -+=+-      .:::.      -+=+:      ::::.   |"
	sleep 0.15 && echo -e "\t|           -+=+-      .:::.      -+=+:      ::::.   |"
	sleep 0.15 && echo -e "\t|           -+=+-      .::::..    -+=+:    ..::::.   |"
	sleep 0.15 && echo -e "\t|           -+=+-       .:::::::. -+=+: .:::::::.    |"
	sleep 0.15 && echo -e "\t|           -+=+:          ..:::::-===-:::::..       |"
	sleep 0.15 && echo -e "\t|           -+===:.            .--===+=::.           |"
	sleep 0.15 && echo -e "\t|           .-=++++=-.       .-==+++=-.              |"
	sleep 0.15 && echo -e "\t|              .:==+++=-:.:-=+++==-.                 |"
	sleep 0.15 && echo -e "\t|                 .:-=+++++++=-:.                    |"
	sleep 0.15 && echo -e "\t|                     .-===-.                        |"
	sleep 0.15 && echo -e "\t|----------------------------------------------------|"
    sleep 0.15 && echo -e "\t"
    echo -e "${Color_Off}"
	sleep 0.15 && echo -e "\t${On_Blue}${BWhite} CoalfireOS customization script for Kali Linux 
	.:.:. By ${On_Blue}${BYellow}Ignacio Pérez (customization from @m4lal0)${On_Blue}${BWhite} .:.:. ${Color_Off}\n"
	tput civis
}

### Info Functions
function info(){
	echo -e "${Cyan}[${BYellow}!${Cyan}] ${BGray}$1${Color_Off}"
}

function question(){
	input=""
	while [ "$input" == "" ]; do
		echo -ne "${Cyan}[${BPurple}?${Cyan}] ${BGray}$1: ${Color_Off}" && read input
	done
}

function yes_or_no(){
	echo -ne "${Cyan}[${BPurple}?${Cyan}] ${BGray}$1 ${Cyan}(${BGreen}Y${BGray}/${BRed}n${Cyan})${BGray}: ${Color_Off}" && read input
	case "$input" in
		n|N) input=0;;
		*) input=1;;
	esac
}

function error(){
	echo -e "${Cyan}[${BRed}✘${Cyan}] ${BRed}Error - $1${Color_Off}"
	echo -e "[$(date +%T)] $1" 2>/dev/null >> $SCRIPT_PATH/error.log
}

function good(){
	echo -e "${Cyan}[${BGreen}✔${Cyan}] ${BGreen}Sucsess - $1${Color_Off}"
}

function check(){
	if [ $? -ne 0 ]; then 
		error "$1"
	else
		good "$1"
	fi
}

function section(){
	echo -e "\n${Cyan}[${BBlue}+${Cyan}] ${BBlue}$1${Color_Off}"
}

### Deleting Github folders downloaded
function deleteApp(){
	validations
	info "Deleting folder apps ."
	if [[ -d $EVASION_PATH || -d $PRIVESCLIN_PATH || -d $PRIVESCWIN_PATH || -d $OSINT_PATH || -d $UTILITIES_PATH || -d $WEB_PATH || -d $WIFI_PATH ]]; then
		rm -rf {$EVASION_PATH,$PRIVESCLIN_PATH,$PRIVESCWIN_PATH,$OSINT_PATH,$UTILITIES_PATH,$WEB_PATH,$WIFI_PATH} 2>&1
		check "Deleting folders."
	else
		error "No app folder installed."
	fi
	info "Deleting desktop configuration."
	rm -rf $HOME_PATH/.config/xfce4 2>/dev/null
	check "Deleting desktop configuration."
	sleep 2
	tput cnorm && reboot
}

### Checking Internet connection
function checkInternet(){
	info "Checking DNS resolution"
	host www.google.com > /dev/null 2>&1
	if [ $? -ne 0 ]; then
		error "Error on DNS resolution - Host unrecheable www.google.com"
		exit 1
	fi
}

function validations(){
### Root validation
	if [[ ! -d tools || ! -d files ]]; then
		echo -e "\n${Cyan}[${BYellow}!${Cyan}] ${BRed}Execute this script from the autoDeploy folder to prevent errors${Color_Off}\n"
		exit 1
	fi
	rm -f $SCRIPT_PATH/error.log 2>/dev/null
	if [ "$EUID" -ne 0 ]; then
		error "This script must be executed by r00t!\n"
		exit 1
	fi

### Device Info
    question "Hostname ($(awk -F: '{ print $1}' /etc/hostname))"
	HOSTNAME=$input
	question "Username ($(ls /home | xargs | tr ' ' ','))"
	USERNAME=$input
	HOME_PATH="/home/$USERNAME"

	if [ ! -d "$HOME_PATH" ]; then
		error "Folder unavailable (/home/$USERNAME)"
		exit 1
	fi
}

### Main instalation
function install(){
	echo -e "\n${Cyan}[${BYellow}*${Cyan}] ${BYellow}Instalation complete.${Color_Off}\n"
	validations
	installPackages
	installApps
	customTerminal
	gitTools
	endInstall
}

function installTerminal(){
	echo -e "\n${Cyan}[${BYellow}*${Cyan}] ${BYellow}Installing Terminal and Desktop Layer.${Color_Off}\n"
	validations
	installPackages
	customTerminal
	endInstall
}

function installTerceros(){
	echo -e "\n${Cyan}[${BYellow}*${Cyan}] ${BYellow}Installing third party apps.${Color_Off}\n"
	validations
	installPackages
	installApps
	gitTools
	endInstall
}

### Finishing script
function endInstall(){
	info "Updating updatedb"
	sudo updatedb > /dev/null 2>&1
	check "Executing updatedb"
	section "INSTALLATION SCCESSFUL"
	tput cnorm
	info "Your computer must be rebooted to finish the installation"
	yes_or_no "¿Do you want reboot it now?"

	section "Happy Hacking! =)" && sleep 2
	if [ $input -eq 1 ]; then
		reboot
	fi
}