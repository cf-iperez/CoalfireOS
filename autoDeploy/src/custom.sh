#!/bin/bash


### Terminal customization
function customTerminal(){
	section "STARTING TO CUSTOMIZE THE SYSTEM"
	checkInternet
	info "Updating repos"
	apt update > /dev/null 2>&1

	info "Downloading font (Hack Nerd Font)"
	cd /usr/local/share/fonts/ 2>/dev/null
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip > /dev/null 2>&1
	check "To download font - https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip"
	unzip Hack.zip > /dev/null 2>&1
	rm Hack.zip 2>/dev/null

	info "Downloading font (Fira Code Nerd)"
	cd /usr/local/share/fonts/ 2>/dev/null
	wget https://github.com/daniruiz/nerd-fonts/raw/fira%2Bkali/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf > /dev/null 2>&1
	check "To download font FiraCode Nerd"

	info "Configuring default shell"
	usermod --shell /usr/bin/zsh root > /dev/null 2>&1
	usermod --shell /usr/bin/zsh $USERNAME > /dev/null 2>&1
	check "Aplying default shell"

	info "Installing powerlevel10k"
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME_PATH/powerlevel10k > /dev/null 2>&1
	check "In the powerlevel10k repo cloning"
	cp -r $HOME_PATH/powerlevel10k /root/ 2>/dev/null
	cp $FILES_PATH/.p10k.zsh $HOME_PATH/.p10k.zsh 2>/dev/null
	check "To find and replace $FILES_PATH/.p10k.zsh"
	ln -sf $HOME_PATH/.p10k.zsh /root/.p10k.zsh 2>/dev/null
	check "Adding p10k.zsh on root"

	info "Installing lsd"
	wget "https://github.com$(curl --silent https://github.com/Peltoche/lsd/releases | grep 'lsd_.*_amd64.deb' | awk -F '\"' '{print $2}' | head -n 1)" -O /tmp/lsd.deb > /dev/null 2>&1
	check "Downloading lsd release"
	dpkg -i /tmp/lsd.deb > /dev/null 2>&1
	check "Installing lsd"

	info "Installingo bat"
	wget "https://github.com$(curl --silent https://github.com/sharkdp/bat/releases | grep 'bat_.*_amd64.deb' | awk -F '\"' '{print $2}' | head -n 1)" -O /tmp/bat.deb > /dev/null 2>&1
	check "Downloading bat release"
	dpkg -i /tmp/bat.deb > /dev/null 2>&1
	check "Installing bat"

	info "Configuring zshrc file"
	cp $FILES_PATH/.zshrc $HOME_PATH/.zshrc 2>/dev/null
	check "To find and put $FILES_PATH/.zshrc file"
	ln -sf $HOME_PATH/.zshrc /root/.zshrc 2>/dev/null
	check "Adding .zshrc on root"
	chown -R $USERNAME:$USERNAME $HOME_PATH/powerlevel10k $HOME_PATH/.p10k.zsh $HOME_PATH/.zshrc 2>/dev/null

	info "Configuring zsh plugin"
	cd /usr/share && mkdir zsh-sudo 2>&1
	cd zsh-sudo && wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh > /dev/null 2>&1
	check "Adding plugin sudo zsh"
	cd /usr/share && mkdir zsh-command-not-found 2>&1
	cd zsh-command-not-found && wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/command-not-found/command-not-found.plugin.zsh > /dev/null 2>&1
	cd /usr/share && chown -R $USERNAME:$USERNAME zsh-* 2>/dev/null
	check "Adding plugin command-not-found zsh"
	cd

	info "Customizing of nano"
	cp $FILES_PATH/.nanorc $HOME_PATH/.nanorc 2>/dev/null
	check "To find $HOME_PATH/.nanorc"
	ln -sf $HOME_PATH/.nanorc /root/.nanorc 2>/dev/null
	check "Configuration of nano"
	chown -R $USERNAME:$USERNAME $HOME_PATH/.nanorc 2>/dev/null

	info "Downloading Nano Syntax aditionl files"
	wget https://raw.githubusercontent.com/scopatz/nanorc/master/powershell.nanorc -O /usr/share/nano/powershell.nanorc > /dev/null 2>&1
	check "Downloading powershell.nanorc on /usr/share/nano/"
	wget https://raw.githubusercontent.com/scopatz/nanorc/master/js.nanorc -O /usr/share/nano/js.nanorc > /dev/null 2>&1
	check "Downloading js.nanorc on /usr/share/nano/"
	wget https://raw.githubusercontent.com/scopatz/nanorc/master/markdown.nanorc -O /usr/share/nano/markdown.nanorc > /dev/null 2>&1
	check "Downloading markdown.nanorc on /usr/share/nano/"
	wget https://raw.githubusercontent.com/scopatz/nanorc/master/arduino.nanorc -O /usr/share/nano/arduino.nanorc > /dev/null 2>&1
	check "Downloading arduino.nanorc on /usr/share/nano/"
	wget https://raw.githubusercontent.com/scopatz/nanorc/master/sql.nanorc -O /usr/share/nano/sql.nanorc > /dev/null 2>&1
	check "Downloading sql.nanorc on /usr/share/nano/"
	wget https://raw.githubusercontent.com/scopatz/nanorc/master/Dockerfile.nanorc -O /usr/share/nano/Dockerfile.nanorc > /dev/null 2>&1
	check "Downloading Dockerfile.nanorc on /usr/share/nano/"
	wget https://raw.githubusercontent.com/mitchell486/nanorc/master/bat.nanorc -O /usr/share/nano/bat.nanorc > /dev/null 2>&1
	check "Downloading bat.nanorc on /usr/share/nano/"

	info "Configure Oh my Tmux! ($USERNAME)"
	cd "$HOME_PATH"
	git clone https://github.com/gpakosz/.tmux.git > /dev/null 2>&1
	check "Al clonar Oh my Tmux!"
	chown -R $USERNAME:$USERNAME .tmux/ 2>/dev/null
	ln -s -f .tmux/.tmux.conf 2>/dev/null
	cp $FILES_PATH/.tmux.conf.local $HOME_PATH/.tmux.conf.local 2>/dev/null
	check "To find and put $FILES_PATH/.tmux.conf.local"
	chown -R $USERNAME:$USERNAME .tmux.conf.local 2>/dev/null

	info "Configure Oh my Tmux! (root)"
	cd
	git clone https://github.com/gpakosz/.tmux.git > /dev/null 2>&1
	check "To clone Oh my Tmux!"
	ln -s -f .tmux/.tmux.conf 2>/dev/null
	ln -sf $HOME_PATH/.tmux.conf.local /root/.tmux.conf.local
	check "Adding .tmux.conf.local en root"

	info "Installing FZF"
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf > /dev/null 2>&1
	check "Cloning FZF repo (root)"
	echo -e "y\ny\nn" | ~/.fzf/install > /dev/null 2>&1
	check "To install FZF (root)"
	git clone --depth 1 https://github.com/junegunn/fzf.git $HOME_PATH/.fzf > /dev/null 2>&1
	check "Cloning FZF repo ($USERNAME)"
	chown -R $USERNAME:$USERNAME $HOME_PATH/.fzf 2>/dev/null
	sudo -u $USERNAME $HOME_PATH/.fzf/install < <(echo -e "y\ny\nn") > /dev/null 2>&1
	check "To install FZF ($USERNAME)"

	info "Configure rofi"
	mkdir $HOME_PATH/.config/rofi && cd $HOME_PATH/.config/rofi
	echo "rofi.theme: /usr/share/rofi/themes/Indego.rasi" > config 2>/dev/null
	chmod 644 config > /dev/null 2>&1
	chown -R $USERNAME:$USERNAME $HOME_PATH/.config/rofi 2>/dev/null
	check "Configuration of rofi ($USERNAME)"
	cd && mkdir .config && ln -sf $HOME_PATH/.config/rofi /root/.config/rofi 2>/dev/null
	check "Configuration of rofi (root)"

	info "Configure mate terminal"
	if [ ! -d /org/mate/terminal/profiles/default ]; then
		mkdir /org/mate/terminal/profiles/default
	fi
	sudo -u $USERNAME dconf write /org/mate/terminal/profiles/default/copy-selection 'true' > /dev/null 2>&1
	sudo -u $USERNAME dconf write /org/mate/terminal/profiles/default/background-darkness '0.87130434782608701' > /dev/null 2>&1
	sudo -u $USERNAME dconf write /org/mate/terminal/profiles/default/background-color '#FFFFFFFFDDDD' > /dev/null 2>&1
	sudo -u $USERNAME dconf write /org/mate/terminal/profiles/default/bold-color '#000000000000' > /dev/null 2>&1
	sudo -u $USERNAME dconf write /org/mate/terminal/profiles/default/foreground-color '#000000000000' > /dev/null 2>&1
	sudo -u $USERNAME dconf write /org/mate/terminal/profiles/default/use-system-font 'false' > /dev/null 2>&1
	sudo -u $USERNAME dconf write /org/mate/terminal/profiles/default/font "'Hack Nerd Font Regular 11'" > /dev/null 2>&1
	sudo -u $USERNAME dconf write /org/mate/terminal/profiles/default/background-type "'transparent'" > /dev/null 2>&1
	sudo -u $USERNAME dconf write /org/mate/terminal/profiles/default/silent-bell 'true' > /dev/null 2>&1
	sudo -u $USERNAME dconf write /org/mate/terminal/profiles/default/default-show-menubar 'false' > /dev/null 2>&1
	sudo -u $USERNAME dconf write /org/mate/terminal/profiles/default/cursor-shape "'ibeam'" > /dev/null 2>&1
	
	check  "To configure mate terminal"

	info "Configure Desktop"
	cp images/Pictures/* $HOME/Pictures/
	wget https://github.com/cf-iperez/CoalfireOS/blob/main/src/profile/Pictures/Coalfire.png -O /usr/share/backgrounds/kali/kali-geometric-16x9.png > /dev/null 2>&1
	wget https://github.com/cf-iperez/CoalfireOS/blob/main/src/profile/Pictures/Coalfire.png -O /usr/share/backgrounds/kali/kali-geometric-16x10.png > /dev/null 2>&1
	wget https://github.com/cf-iperez/CoalfireOS/blob/main/src/profile/Pictures/Coalfire.png -O /usr/share/backgrounds/kali/kali-light-strips-16x10.png > /dev/null 2>&1
	wget https://github.com/cf-iperez/CoalfireOS/blob/main/src/profile/Pictures/Coalfire.png -O /usr/share/backgrounds/kali/kali-light-strips-16x9.png > /dev/null 2>&1
	ln -s $HOME_PATH/Pictures/Coalfire.png /usr/share/backgrounds/kali-16x9/kali-geometric-16x9.png > /dev/null 2>&1
	ln -s $HOME_PATH/Pictures/Coalfire.png /usr/share/backgrounds/kali-16x9/kali-light-strips-16x9.png > /dev/null 2>&1
	check "To download wallpapers"
	unlink /usr/share/desktop-base/kali-theme/login/background > /dev/null 2>&1
	ln -s /usr/share/backgrounds/kali/kali-light-strips-16x9.png /usr/share/desktop-base/kali-theme/login/background > /dev/null 2>&1
	check "To configure start session"
	cp $FILES_PATH/xfce4/xfce4-desktop.xml $HOME_PATH/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml > /dev/null 2>&1
	chown -R $USERNAME:$USERNAME $HOME_PATH/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml 2>/dev/null
	check "To configure wallpaper"
	cp $FILES_PATH/xfce4/xfce4-keyboard-shortcuts.xml $HOME_PATH/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml > /dev/null 2>&1
	chown -R $USERNAME:$USERNAME $HOME_PATH/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml 2>/dev/null
	check "To configure keyboard shortcuts"
	cp $FILES_PATH/xfce4/thunar.xml $HOME_PATH/.config/xfce4/xfconf/xfce-perchannel-xml/thunar.xml > /dev/null 2>&1
	chown -R $USERNAME:$USERNAME $HOME_PATH/.config/xfce4/xfconf/xfce-perchannel-xml/thunar.xml 2>/dev/null
	check "To cofnigure windows"
	cp $FILES_PATH/xfce4/xfce4-panel.xml $HOME_PATH/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml > /dev/null 2>&1
	chown -R $USERNAME:$USERNAME $HOME_PATH/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml 2>/dev/null
	check "To configure task bar"
	cp $FILES_PATH/xfce4/xfwm4.xml $HOME_PATH/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml > /dev/null 2>&1
	chown -R $USERNAME:$USERNAME $HOME_PATH/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml 2>/dev/null
	check "To configure work panel"
	cd $FILES_PATH/xfce4 2>/dev/null
	tar -xJf Arc-Ubuntu.tar.xz > /dev/null 2>&1
	mkdir $HOME_PATH/.local/share/icons && mv $FILES_PATH/xfce4/Arc-Ubuntu $FILES_PATH/xfce4/Arc-Ubuntu $HOME_PATH/.local/share/icons > /dev/null 2>&1
	chown -R $USERNAME:$USERNAME $HOME_PATH/.local/share/icons 2>/dev/null
	check  "To download icons ($USERNAME)"
	mkdir -p /root/.local/share && ln -s $HOME_PATH/.local/share/icons /root/.local/share/icons 2>/dev/null
	check "To download icons (root)"
	cp $FILES_PATH/xfce4/xsettings.xml $HOME_PATH/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml > /dev/null 2>&1
	chown -R $USERNAME:$USERNAME $HOME_PATH/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml 2>/dev/null
	check "To configure icons on the system"
	gtk-update-icon-cache $HOME_PATH/.local/share/icons/Arc-Ubuntu > /dev/null 2>&1 && gtk-update-icon-cache $HOME_PATH/.local/share/icons/Arc-Ubuntu > /dev/null 2>&1
	check "To update icons"
	cp $FILES_PATH/xfce4/xfwm4.xml $HOME_PATH/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml > /dev/null 2>&1
	chown -R $USERNAME:$USERNAME $HOME_PATH/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml 2>/dev/null
	check "To configure work panel"
	cp $FILES_PATH/scripts/ethstatus.sh $HOME_PATH/.config/ethstatus.sh > /dev/null 2>&1
	chmod 774 $HOME_PATH/.config/ethstatus.sh 2>/dev/null
	chown -R $USERNAME:$USERNAME $HOME_PATH/.config/ethstatus.sh 2>/dev/null
	check "To copy script eth"
	cp $FILES_PATH/panel/genmon-4.rc $HOME_PATH/.config/xfce4/panel/genmon-4.rc > /dev/null 2>&1
	chown -R $USERNAME:$USERNAME $HOME_PATH/.config/xfce4/panel/genmon-4.rc 2>/dev/null
	check "To configure info net in the task bar"
	cp $FILES_PATH/scripts/vpnstatus.sh $HOME_PATH/.config/vpnstatus.sh > /dev/null 2>&1
	chmod 774 $HOME_PATH/.config/vpnstatus.sh 2>/dev/null
	chown -R $USERNAME:$USERNAME $HOME_PATH/.config/vpnstatus.sh 2>/dev/null
	check "To copy VPN script"
	cp $FILES_PATH/panel/genmon-5.rc $HOME_PATH/.config/xfce4/panel/genmon-5.rc > /dev/null 2>&1
	chown -R $USERNAME:$USERNAME $HOME_PATH/.config/xfce4/panel/genmon-5.rc 2>/dev/null
	check "To configure info VPN in the task bar"
	cp $FILES_PATH/scripts/wifistatus.sh $HOME_PATH/.config/wifistatus.sh > /dev/null 2>&1
	chmod 774 $HOME_PATH/.config/wifistatus.sh 2>/dev/null
	chown -R $USERNAME:$USERNAME $HOME_PATH/.config/wifistatus.sh 2>/dev/null
	check "To copy WiFi script"
	cp $FILES_PATH/panel/genmon-24.rc $HOME_PATH/.config/xfce4/panel/genmon-24.rc > /dev/null 2>&1
	chown -R $USERNAME:$USERNAME $HOME_PATH/.config/xfce4/panel/genmon-24.rc 2>/dev/null
	check "To configure info WiFi in the task bar"
	cd $HOME_PATH/.config 2>/dev/null
	echo "#!/bin/bash" > user.sh 2>/dev/null
	echo "VAR=$USERNAME" >> user.sh 2>/dev/null
	echo "ICON=(??? ??? ??? ???)" >> user.sh 2>/dev/null
	echo 'ELEC=$(( $RANDOM % 4 ))' >> user.sh 2>/dev/null
	echo 'echo -n ${ICON[$ELEC]} ${VAR:0:1} | tr "[:lower:]" "[:upper:]"; echo ${VAR:1} | tr "[:upper:]" "[:lower:]"' >> user.sh 2>/dev/null
	chown $USERNAME:$USERNAME user.sh && chmod 774 user.sh 2>/dev/null
	check "To configure user script in the task bar"
	cp $FILES_PATH/panel/genmon-29.rc $HOME_PATH/.config/xfce4/panel/genmon-29.rc > /dev/null 2>&1
	chown -R $USERNAME:$USERNAME $HOME_PATH/.config/xfce4/panel/genmon-29.rc 2>/dev/null
	check "To configure user in the task bar"
	cp $FILES_PATH/panel/battery-19.rc $HOME_PATH/.config/xfce4/panel/battery-19.rc > /dev/null 2>&1
	chown -R $USERNAME:$USERNAME $HOME_PATH/.config/xfce4/panel/battery-19.rc 2>/dev/null
	check "To configure battery icon in the task bar"
	cp $FILES_PATH/panel/whiskermenu-1.rc $HOME_PATH/.config/xfce4/panel/whiskermenu-1.rc > /dev/null 2>&1
	chown -R $USERNAME:$USERNAME $HOME_PATH/.config/xfce4/panel/whiskermenu-1.rc 2>/dev/null
	check "To configure start menu"
	cp $FILES_PATH/xfce4/helpers.rc $HOME_PATH/.config/xfce4/helpers.rc > /dev/null 2>&1
	chown $USERNAME:$USERNAME $HOME_PATH/.config/xfce4/helpers.rc 2>/dev/null
	check "To configure apps by default"

	info "Notifications configuration"
	sudo apt remove xfce4-notifyd -y > /dev/null 2>&1
	cd /tmp/ && wget https://raw.githubusercontent.com/dunst-project/dunst/master/dunstrc > /dev/null 2>&1
	mkdir -p $HOME_PATH/.config/dunst  2>/dev/null
	mv /tmp/dunstrc  $HOME_PATH/.config/dunst/ && chown -R $USERNAME:$USERNAME $HOME_PATH/.config/dunst > /dev/null 2>&1
	check "Custom Notifications"

	# info "Seleccionando Java 8 como predeterminado"
	# option=$(echo | update-alternatives --config java | grep "java-8" | tr -d '*' | awk '{print $1}')
	# if [ $option ]; then
	# 	echo "$option" | update-alternatives --config java > /dev/null 2>&1
	# 	check "Eligiendo Java 8 como predeterminado"
	# fi
}
