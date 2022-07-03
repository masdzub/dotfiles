#!/usr/bin/env bash

source ./function/main.sh

## Run script and instalations
echo "This instalation just for Ubuntu / Debian Family (desktop)"
echo "Make sure u're connected with internet"
echo "Update your OS and input your password"
echo ""

update 

echo ""
echo "OS has been updated"
echo ""
echo "Installing apps"
echo ""

sudo apt install make gcc golang ansible vim nano mc ncdu git fish wireguard fonts-hack-ttf whois dnsutils vlc apt-transport-https -y

echo ""

install_assh

echo ""

install_chrome

echo ""
echo "Applying fish to default shell"

chsh -s /usr/bin/fish

echo ""
echo "Now, default shell is fish not bash again..."
echo ""

while true; do
read -p "Do You want to change fish prompt ? " yn
	case $yn in
		[Yy]* )
			fish_prompt
			break;;
		[Nn]* ) exit;;
		* ) echo "Please answer Yes or No."
	esac
done


## generate default config terminator
terminator
killall terminator
## generate default terminator


while true; do
read -p "Do You want to install vim theme ? " yn
	case $yn in
		[Yy]* )
			vim_theme
			break;;
		[Nn]* ) exit;;
		* ) echo "Please answer Yes or No."
	esac
done

echo ""

while true; do
read -p "Do You want to install terminator theme ? " yn
	case $yn in
		[Yy]* )
			terminator_theme
			break;;
		[Nn]* ) exit;;
		* ) echo "Please answer Yes or No."
	esac
done

echo ""

while true; do
read -p "Do You want to open terminator ? " yn
	case $yn in
		[Yy]* )
			terminator
			break;;
		[Nn]* ) exit;;
		* ) echo "Please answer Yes or No."
	esac
done