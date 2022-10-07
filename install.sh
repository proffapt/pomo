#!/bin/bash

## Colors
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
cyan=$(tput setaf 6)
white=$(tput setaf 7)

DOWNLOAD_DIRECTORY=~/.config/pomo

function install_with_sound() {
  echo "${green}[+]${white} Installing with sound notifications"
  if [ -e $DOWNLOAD_DIRECTORY/sound.wav ]
  then
      echo "${yellow}[-]${white}Sound already present"
  else
	  if [[ ! -d $DOWNLOAD_DIRECTORY ]]; then
		  mkdir -p $DOWNLOAD_DIRECTORY 
	  fi
      mv ./sound.wav $DOWNLOAD_DIRECTORY  
      echo "${green}[+]${white} Added sound"
  fi
  echo "${green}[+]${white} Adding pomo executable to your bin folder"
  echo "${cyan}[~]${white} ${blue}To do that this script will be requiring your user password${green}"
  sudo cp ./pomo-sound.sh /usr/local/bin/pomo
}

function install_without_sound() {
  echo "Installing without sound notifications"
  echo "${green}[+]${white} Adding pomo executable to your bin folder"
  echo "${cyan}[~]${white} ${blue}To do that this script will be requiring your user password${green}"
  sudo cp ./pomo.sh /usr/local/bin/pomo
}

while true; do
  read -rp "${cyan}[~]${white} Install with sound notifications? (y/n): " yn
  case $yn in
    [Yy]* )
      install_with_sound
      break;;
    [Nn]* )
      install_without_sound
      break;;
    * ) echo "Please answer 'yes' or 'no'.";;
    esac
done

