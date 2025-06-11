#!/bin/sh
# NOAUTOLOGIN=/etc/sysconfig/noautologin
# if [ -f "$NOAUTOLOGIN" ]; then
# 	if [ -s "$NOAUTOLOGIN" ]; then
# 		> "$NOAUTOLOGIN"
# 		exit
# 	fi
# else
# 	if [ ! -f /etc/sysconfig/superuser ]; then 
# 		clear
# 		TCUSER="$(cat /etc/sysconfig/tcuser)"
# 		exec /bin/login -f "$TCUSER"
# 	fi
# fi

sudo -u tc tce-load -i /packages/alsa-config.tcz
sudo -u tc tce-load -i /packages/alsa-modules-4.8.17-tinycore64.tcz
sudo -u tc tce-load -i /packages/alsa-plugins.tcz
sudo -u tc tce-load -i /packages/alsa.tcz
sudo -u tc tce-load -i /packages/libasound.tcz

stty -ixon

clear
echo enter the name of the option you want to use from the list below
echo haxor: matrix -\> progress bars -\> reboot
echo rick : rickroll -\> reboot
/usr/bin/env echo -ne "\n\n> " && read SELECTION

if [ $SELECTION != "haxor" ] && [ $SELECTION != "rick" ]
then
	export SELECTION=""
fi

while [ -z $SELECTION ]
do
	clear
	echo that is not a valid selection
	echo " "
	echo enter the name of the option you want to use from the list below
	echo haxor: matrix -\> progress bars -\> reboot
	echo rick : rickroll -\> reboot
	/usr/bin/env echo -ne "\n\n> " && read SELECTION

	# read SELECTION

	if [ $SELECTION != "haxor" ] && [ $SELECTION != "rick" ]
	then
		export SELECTION=""
	fi
done

if [ $SELECTION == "haxor" ]
then
	/zig-matrix -m "user input required, press any key..."
	clear
	/zig-haxor-screen
	reboot
fi

if [ $SELECTION == "rick" ]
then
	alsactl init
	amixer set Master unmute
	amixer set Master 100%
	/zig-matrix -m "user input required, press any key..."
	clear
	/rickroll
	reboot
fi
