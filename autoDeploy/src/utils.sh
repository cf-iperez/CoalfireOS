#!/bin/bash
#by @m4lal0

### Installing third party apps
function installPackages(){
	section "Updating repos..."
	checkInternet
	info "Downloading extra packages"
	apt install -y neofetch > /dev/null 2>&1
	cp -r files/neofetch $HOME_PATH/.config/
	apt install -y $PACKAGES_LIST > /dev/null 2>&1
	if [ $? -ne 0 ]; then
		apt update > /dev/null 2>&1
		apt install -y $PACKAGES_LIST > /dev/null 2>&1
	fi
	apt --fix-broken install -y > /dev/null 2>&1
	check "Installing aditiona packages"
	## Actualizar paquetes
	info "Updating Packages"
	apt update > /dev/null 2>&1
	check "To update packages"
	## Descartar paquetes obsoletos
	info "Deleting unused packages (apt autoremove)"
	apt autoremove -y > /dev/null 2>&1
	check "To delete unused packages"
}
EVASION_PATH
### Installing other Applications
function installApps(){
	section "STARTING INSTALLATION OF UTILITIES"
	checkInternet
	info "Installing Google Chrome"
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/chrome.deb > /dev/null 2>&1
	check "To download Google Chrome"
	dpkg -i /tmp/chrome.deb > /dev/null 2>&1
	check "To install Google Chrome"
	## Installing NordVPN
	info "Installing NordVPN"
	NordVPN_url=$(curl -sSL "https://repo.nordvpn.com/deb/nordvpn/debian/pool/main" | grep 'nordvpn-release*' | awk '{print $2}' | tr '><' ' ' | awk '{print $2}')
	cd /tmp/ 2>/dev/null
	wget "https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/$NordVPN_url" > /dev/null 2>&1
	dpkg -i $NordVPN_url > /dev/null 2>&1
	apt-get update -y > /dev/null 2>&1
	apt-get install nordvpn -y > /dev/null 2>&1
	if [ $? -ne 0 ]; then
		apt --fix-broken install -y > /dev/null 2>&1
		apt-get install nordvpn -y > /dev/null 2>&1
	fi
	check "To install NordVPN"
	## Installing Brave
	info "Instalando Brave"
	curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add - > /dev/null 2>&1
	echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list > /dev/null 2>&1
	apt-get update -y > /dev/null 2>&1
	apt-get install brave-browser -y > /dev/null 2>&1
	if [ $? -ne 0 ]; then
		apt --fix-broken install -y > /dev/null 2>&1
		apt-get install brave-browser -y > /dev/null 2>&1
	fi
	check "To install Brave"
	## Instalacion Pyrit
	info "Installing Pyrit"
	cd /tmp/ ; wget http://ftp.mx.debian.org/debian/pool/main/p/pyrit/pyrit_0.5.1+git20180801-1_amd64.deb > /dev/null 2>&1
	dpkg -i /tmp/pyrit_0.5.1+git20180801-1_amd64.deb > /dev/null 2>&1
	check "To install Pyrit"
	## Instalacion Scapy-2.4.2
	info "Installing Scapy 2.4.2"
	cd /tmp/ ; wget https://github.com/secdev/scapy/archive/v2.4.2.zip > /dev/null 2>&1
	unzip v2.4.2.zip > /dev/null 2>&1
	cd scapy-2.4.2 && ./setup.py install > /dev/null 2>&1
	check "To install Scapy 2.4.2"

	info "Installing Gotop"
	cd $SCRIPT_PATH ; git clone --depth 1 https://github.com/cjbassi/gotop /tmp/gotop > /dev/null 2>&1
	check "Cloning Gotop repo"
	/tmp/gotop/scripts/download.sh > /dev/null 2>&1
	check "In the Gotop installation"
	mv gotop /usr/local/bin 2>/dev/null
	check "To move binary gotop to /usr/local/bin"

	## Installing packages with pip & pip3
	for ap in $(cat $PIP_TOOLS_LIST); do
		info "Installing $(echo $ap | cut -d ':' -f 2)"
		$(echo $ap | cut -d ':' -f 1) install $(echo $ap | cut -d ':' -f 2) > /dev/null 2>&1
		check "Installing $(echo $ap | cut -d ':' -f 2) (root)"
		sudo -u $USERNAME $(echo $ap | cut -d ':' -f 1) install $(echo $ap | cut -d ':' -f 2) > /dev/null 2>&1
		check "Installing $(echo $ap | cut -d ':' -f 2) ($USERNAME)"
	done
}

### Installing third party apps in /opt/
function gitTools(){
	section "INSTALLING THIRD PARTY APPS"
	checkInternet
	info "Downloading netcat 64bits"
	wget https://eternallybored.org/misc/netcat/netcat-win32-1.11.zip -O /tmp/netcat.zip > /dev/null 2>&1
	check "To download netcat"
	cd /tmp/ ; unzip /tmp/netcat.zip > /dev/null 2>&1
	check "To uncompress netcat"
	sudo cp /tmp/netcat-1.11/nc64.exe /usr/share/windows-resources/binaries/nc64.exe > /dev/null 2>&1
	check "To copy netcat in /usr/share/windows-resources/binaries"
	chmod 755 /usr/share/windows-resources/binaries/nc64.exe 2>/dev/null
	check "Permissions asigned to nc64.exe"
	## Extract wordlist rockyou
    info "Extract wordlist rockyou"
    cd /usr/share/wordlists 2>/dev/null
    gunzip rockyou.txt.gz > /dev/null 2>&1
    check "Descomprimir archivo rockyou en /usr/share/wordlist/"
    cd 2>/dev/null
	## Hakrawler
	info "Installing Hakrawler"
	cd /tmp/ 2>/dev/null
	go get github.com/hakluke/hakrawler > /dev/null 2>&1
	mv ~/go/bin/hakrawler /usr/local/bin > /dev/null 2>&1
	check "Adding Hakrawler app"
	## hakrevdns
	info "Installing hakrevdns"
	go get github.com/hakluke/hakrevdns > /dev/null 2>&1
	mv ~/go/bin/hakrevdns /usr/local/bin > /dev/null 2>&1
	check "Adding hakrevdns app"
	## WordPress Exploit Framework
	info "Adding WordPress Exploit Framework"
	gem install wpxf > /dev/null 2>&1
	check "Adding WordPress Exploit Framework"

## Git clone and installation divided
	info "Creating app folder"
	mkdir {$PRIVESCLIN_PATH,$PRIVESCWIN_PATH,$OSINT_PATH,$UTILITIES_PATH,$WEB_PATH,$WIFI_PATH,$WORDPRESS_PATH} 2>/dev/null
	check "Al crear directorios"
	## Wpseku
	info "Downloading wpseku"
	cd $WORDPRESS_PATH 2>/dev/null
	git clone --depth 1 https://github.com/m4ll0k/WPSeku.git wpseku > /dev/null 2>&1
	cd wpseku 2>/dev/null
	pip3 install -r requirements.txt > /dev/null 2>&1
	check "Adding wpseku"
	## Sherlock-Project
	info "Downloading sherlock-project"
	cd $OSINT_PATH 2>/dev/null
	git clone --depth 1 https://github.com/sherlock-project/sherlock.git > /dev/null 2>&1
	cd sherlock 2>/dev/null
	python3 -m pip install -r requirements.txt  > /dev/null 2>&1
	check "Adding sherlock-project"
	## Impacket Python
	info "Downloading Impacket Python"
	cd $UTILITIES_PATH 2>/dev/null
	git clone https://github.com/SecureAuthCorp/impacket > /dev/null 2>&1
	cd impacket 2>/dev/null
	python3 setup.py install > /dev/null 2>&1
	check "Adding Impacket Python"
	## GTFOBLookup
	info "Downloading GTFOBLookup"
	cd $UTILITIES_PATH 2>/dev/null
	git clone --depth 1 https://github.com/nccgroup/GTFOBLookup > /dev/null 2>&1
	cd GTFOBLookup 2>/dev/null
	pip3 install -r requirements.txt > /dev/null 2>&1
	python3 gtfoblookup.py update > /dev/null 2>&1
	check "Adding GTFOBLookup"
	## SocialFish
	info "Downloading SocialFish"
	cd $UTILITIES_PATH 2>/dev/null
	git clone --depth 1 https://github.com/UndeadSec/SocialFish > /dev/null 2>&1
	cd SocialFish 2>/dev/null
	python3 -m pip install -r requirements.txt > /dev/null 2>&1
	check "Adding SocialFish"
	## CRLFuzz
	info "Downloading CRLFuzz"
	cd /tmp/ 2>/dev/null
	git clone --depth 1 https://github.com/dwisiswant0/crlfuzz > /dev/null 2>&1
	cd /tmp/crlfuzz/cmd/crlfuzz 2>/dev/null
	go build . > /dev/null 2>&1
	mv crlfuzz /usr/local/bin > /dev/null 2>&1
	check "Adding CRLFuzz"
	## brutemap
	info "Downloading brutemap"
	cd $WEB_PATH 2>/dev/null
	git clone --depth 1 https://github.com/brutemap-dev/brutemap > /dev/null 2>&1
	cd brutemap 2>/dev/null
	pip install -r requirements.txt > /dev/null 2>&1
	check "Adding brutemap"
	## CWFF
	info "Downloading CWFF"
	cd $UTILITIES_PATH 2>/dev/null
	git clone --depth 1 https://github.com/D4Vinci/CWFF > /dev/null 2>&1
	cd CWFF 2>/dev/null
	python3 -m pip install -r requirements.txt > /dev/null 2>&1
	check "Adding CWFF"
	## fuzzdb
	info "Downloading wordlists fuzzdb"
	cd /usr/share 2>/dev/null
	git clone --depth 1 https://github.com/fuzzdb-project/fuzzdb > /dev/null 2>&1
	ln -s /usr/share/fuzzdb /usr/share/wordlists > /dev/null 2>&1
	check "Adding wordlist in /usr/share/wordlist/"
	## Xerosploit
	info "Downloading Xerosploit"
	cd $WIFI_PATH 2>/dev/null
	git clone --depth 1 https://github.com/LionSec/xerosploit > /dev/null 2>&1
	cd xerosploit && echo -e "1" | sudo python install.py > /dev/null 2>&1
	check "Adding Xerosploit"
	## Vulnx
	info "Downloading Vulnx"
	cd $WORDPRESS_PATH 2>/dev/null
	git clone --depth 1 https://github.com/anouarbensaad/vulnx > /dev/null 2>&1
	cd vulnx && ./install.sh > /dev/null 2>&1
	check "Adding Vulnx"
	## bashtop
	info "Downloading BashTOP"
	cd $UTILITIES_PATH 2>/dev/null
	git clone https://github.com/aristocratos/bashtop.git > /dev/null 2>&1
	cd bashtop && sudo make install > /dev/null 2>&1
	check "Adding BashTOP"´
	## Drupwn
	info "Downloading Drupwn"
	cd $WEB_PATH 2>/dev/null
	git clone --depth 1 https://github.com/immunIT/drupwn > /dev/null 2>&1
	cd drupwn && pip3 install -r requirements.txt > /dev/null 2>&1
	check "Adding Drupwn"
	## Typo3Scan
	info "Downloading Typo3Scan"
	cd $WEB_PATH 2>/dev/null
	git clone --depth 1 https://github.com/whoot/Typo3Scan.git > /dev/null 2>&1
	cd Typo3Scan && pip3 install -r requirements.txt > /dev/null 2>&1
	check "Adding Typo3Scan"
	## Billcipher
	info "Downloading Billcipher"
	cd $UTILITIES_PATH 2>/dev/null
	git clone --depth 1 https://github.com/GitHackTools/BillCipher > /dev/null 2>&1
	cd BillCipher && pip install -r requirements.txt > /dev/null 2>&1
	pip3 install -r requirements.txt > /dev/null 2>&1
	check "Adding Billcipher"

## Download using wget
	## psPY
	info "Downloading pspy"
	cd $PRIVESCLIN_PATH 2>/dev/null
	mkdir pspy > /dev/null 2>&1
	cd pspy 2>/dev/null
	wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32 > /dev/null 2>&1
	check "Adding pspy32"
	wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64 > /dev/null 2>&1
	check "Adding pspy64"
	## Unix-Privesc-Check-PentestMonkey
	info "Downloading unix-privesc-check"
	cd $PRIVESCLIN_PATH 2>/dev/null
	wget http://pentestmonkey.net/tools/unix-privesc-check/unix-privesc-check-1.4.tar.gz > /dev/null 2>&1
	tar -xzf unix-privesc-check-1.4.tar.gz && rm unix-privesc-check-1.4.tar.gz > /dev/null 2>&1
	check "Adding unix-privesc-check"
	## SubFinder
	info "Installing subFinder"
	cd /tmp/ 2>/dev/null
	subfinder_url=$(curl --silent 'https://github.com/projectdiscovery/subfinder/releases' | grep -E 'subfinder_?[0-9].*_linux_amd64.tar.gz' | head -n 1 | awk -F '\"' '{print $2}')
	subfinder_file=$(curl --silent 'https://github.com/projectdiscovery/subfinder/releases' | grep -E 'subfinder_?[0-9].*_linux_amd64.tar.gz' | head -n 1 | awk -F '\"' '{print $2}' | tr '/' ' ' | awk 'NF{print $NF}')
	wget "https://github.com$subfinder_url" > /dev/null 2>&1
	tar -xzf /tmp/$subfinder_file > /dev/null 2>&1
	mv /tmp/subfinder /usr/local/bin/ > /dev/null 2>&1
	check "Adding subFinder"
	## httpx
	info "Installing httpx"
	cd /tmp/ 2>/dev/null
	httpx_url=$(curl --silent 'https://github.com/projectdiscovery/httpx/releases' | grep -E 'httpx_?[0-9].*_linux_amd64.tar.gz' | head -n 1 | awk -F '\"' '{print $2}')
	httpx_file=$(curl --silent 'https://github.com/projectdiscovery/httpx/releases' | grep -E 'httpx_?[0-9].*_linux_amd64.tar.gz' | head -n 1 | awk -F '\"' '{print $2}' | tr '/' ' ' | awk 'NF{print $NF}')
	wget "https://github.com$httpx_url" > /dev/null 2>&1
	tar -xzf /tmp/$httpx_file > /dev/null 2>&1
	mv /tmp/httpx /usr/local/bin > /dev/null 2>&1
	check "Adding httpx"
	## go-dork
	info "Downloading go-Dork"
	cd /tmp/ 2>/dev/null
	godork_url=$(curl --silent 'https://github.com/dwisiswant0/go-dork/releases' | grep -E 'go-dork_?[0-9].*_linux_amd64.tar.gz' | head -n 1 | awk -F '\"' '{print $2}')
	godork_file=$(curl --silent 'https://github.com/dwisiswant0/go-dork/releases' | grep -E 'go-dork_?[0-9].*_linux_amd64.tar.gz' | head -n 1 | awk -F '\"' '{print $2}' | tr '/' ' ' | awk 'NF{print $NF}')
	wget "https://github.com$godork_url" -O /tmp/$godork_file > /dev/null 2>&1
	tar -xzf /tmp/$godork_file > /dev/null 2>&1
	mv /tmp/go-dork /usr/local/bin > /dev/null 2>&1
	check "Adding go-Dork"
	## BruteShark
	info "Downloading BruteShark"
	cd $UTILITIES_PATH && mkdir BruteShark 2>/dev/null
	cd BruteShark 2>/dev/null
	wget https://github.com/odedshimon/BruteShark/releases/latest/download/BruteSharkCli > /dev/null 2>&1
	chmod +x BruteSharkCli > /dev/null 2>&1
	check "Adding BruteShark"
	## naabu
	info "Downloading naabu"
	cd /tmp/ 2>/dev/null
	naabu_url=$(curl --silent 'https://github.com/projectdiscovery/naabu/releases' | grep -E 'naabu_?[0-9].*_linux_amd64.tar.gz' | head -n 1 | awk -F '\"' '{print $2}')
	naabu_file=$(curl --silent 'https://github.com/projectdiscovery/naabu/releases' | grep -E 'naabu_?[0-9].*_linux_amd64.tar.gz' | head -n 1 | awk -F '\"' '{print $2}' | tr '/' ' ' | awk 'NF{print $NF}')
	wget "https://github.com$naabu_url" -O /tmp/$naabu_file > /dev/null 2>&1
	tar -xzf /tmp/$naabu_file > /dev/null 2>&1
	mv /tmp/naabu /usr/local/bin > /dev/null 2>&1
	check "Adding naabu"
	## evine
	info "Downloading evine"
	evine_url=$(curl --silent 'https://github.com/saeeddhqan/evine/releases' | grep -E 'evine_linux_amd64.tar.xz' | head -n 1 | awk -F '\"' '{print $2}')
	evine_file=$(curl --silent 'https://github.com/saeeddhqan/evine/releases' | grep -E 'evine_linux_amd64.tar.xz' | head -n 1 | awk -F '\"' '{print $2}' | tr '/' ' ' | awk 'NF{print $NF}')
	wget "https://github.com$evine_url" -O /tmp/$evine_file > /dev/null 2>&1
	tar -xJf /tmp/$evine_file > /dev/null 2>&1
	mv /tmp/evine /usr/local/bin > /dev/null 2>&1
	check "Adding evine"
	## tempomail
	info "Downloading tempomail"
	cd /tmp/ 2>/dev/null
	tempomail_url=$(curl --silent 'https://github.com/kavishgr/tempomail/releases' | grep -E 'linux-amd64-tempomail.tgz' | head -n 1 | awk -F '\"' '{print $2}')
	wget "https://github.com$tempomail_url" > /dev/null 2>&1
	tar -xzf linux-amd64-tempomail.tgz && mv tempomail /usr/local/bin/ > /dev/null 2>&1
	check "Adding tempomail"
	## dnsx
	info "Downloading dnsx"
	dnsx_url=$(curl --silent 'https://github.com/projectdiscovery/dnsx/releases/' | grep -E 'dnsx_1.0.1_linux_amd64.tar.gz' | head -n 1 | awk -F '\"' '{print $2}')
	dnsx_file=$(curl --silent 'https://github.com/projectdiscovery/dnsx/releases/' | grep -E 'dnsx_1.0.1_linux_amd64.tar.gz' | head -n 1 | awk -F '\"' '{print $2}' | tr '/' ' ' | awk 'NF{print $NF}')
	wget "https://github.com$dnsx_url" -O /tmp/$dnsx_file > /dev/null 2>&1
	tar -xzf /tmp/$dnsx_file > /dev/null 2>&1
	mv /tmp/dnsx /usr/local/bin > /dev/null 2>&1
	check "Adding dnsx"
	## Pandoc
	info "Downloading pandoc"
	pandoc_url=$(curl --silent 'https://github.com/jgm/pandoc/releases/' | grep -E 'pandoc-?[1-9].*-amd64.deb' | head -n 1 | awk -F '\"' '{print $2}')
	pandoc_file=$(curl --silent 'https://github.com/jgm/pandoc/releases/' | grep -E 'pandoc-?[1-9].*-amd64.deb' | head -n 1 | awk -F '\"' '{print $2}' | tr '/' ' ' | awk 'NF{print $NF}')
	wget "https://github.com$pandoc_url" -O /tmp/$pandoc_file > /dev/null 2>&1
	dpkg -i /tmp/$pandoc_file > /dev/null 2>&1
	check "Adding pandoc"
	## Eisvogel
	info "Downloading Eisvogel"
	cd /tmp && wget "https://github.com$(curl --silent 'https://github.com/Wandmalfarbe/pandoc-latex-template/releases/' | grep -E 'Eisvogel-?[1-9]*.zip' | head -n 1 | awk -F '\"' '{print $2}')" > /dev/null 2>&1
	echo -e "A" | unzip $(curl --silent 'https://github.com/Wandmalfarbe/pandoc-latex-template/releases/' | grep -E 'Eisvogel-?[1-9]*.zip' | head -n 1 | awk -F '\"' '{print $2}' | tr '/' ' ' | awk 'NF{print $NF}') > /dev/null 2>&1
	mkdir -p /root/.local/share/pandoc/templates > /dev/null 2>&1
	check "Creating Eisvogel folder"
	mv /tmp/eisvogel.latex /root/.local/share/pandoc/templates > /dev/null 2>&1
	check "Adding Eisvogel"
	## duf
	info "Downloading duf"
	duf_url=$(curl --silent 'https://github.com/muesli/duf/releases' | grep -E 'duf_*.*_linux_amd64.deb' | head -n 1 | awk -F '\"' '{print $2}')
	duf_file=$(curl --silent 'https://github.com/muesli/duf/releases' | grep -E 'duf_*.*_linux_amd64.deb' | head -n 1 | awk -F '\"' '{print $2}' | tr '/' ' ' | awk 'NF{print $NF}')
	wget "https://github.com$duf_url" -O /tmp/$duf_file > /dev/null 2>&1
	dpkg -i /tmp/$duf_file > /dev/null 2>&1
	check "Adding pandoc"

## Download other tools from GitHub without installation 
	for gitap in $(cat $GIT_TOOLS_LIST); do
		url=$(echo $gitap | cut -d '|' -f2)
		dir=$(echo $gitap | cut -d '|' -f1)
		name=$(echo $url | tr '/' ' ' | cut -d ' ' -f5)
		cd $GIT_TOOLS_PATH/$dir 2>/dev/null
		info "Downloading $name"
		git clone --depth 1 $url > /dev/null 2>&1
		check "Adding the application $name"
	done
	ln -s $WEB_PATH/dirsearch/dirsearch.py /bin/dirsearch > /dev/null 2>&1
	check "Redirecting the dirsearch file to /bin"
}