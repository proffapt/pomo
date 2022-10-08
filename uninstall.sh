#!/bin/bash

## Colors
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
cyan=$(tput setaf 6)
white=$(tput setaf 7)

DOWNLOAD_DIRECTORY=~/.config/pomodoro-cli

if [ -e $DOWNLOAD_DIRECTORY ]; then
	echo "${green}[+]${white} Removing Configuration(s)"
	rm -rf $DOWNLOAD_DIRECTORY
else
	echo "${yellow}[-]${white} Configuration(s) Directory already deleted"
fi

echo "${green}[+]${white} Removing pomodoro-cli executable to from bin folder"
echo "${cyan}[~]${white} ${blue}To do that this script will be requiring your user password${green}"
sudo rm /usr/local/bin/pd
echo "${cyan}[==] pomodoro-cli uninstalled!"
