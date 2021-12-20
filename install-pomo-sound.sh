#!/bin/bash

DOWNLOAD_DIRECTORY=~/.config/pomo

function install_with_sound() {
  echo "Installing with sound notifications"
  echo "Downloading pomo..."
  curl https://raw.githubusercontent.com/Tashima42/pomo/main/pomo-sound.sh > ~/.local/bin/pomo && sudo chmod +x ~/.local/bin/pomo

  echo "Downloading sound to $DOWNLOAD_DIRECTORY" 
  mkdir -p $DOWNLOAD_DIRECTORY 
  if [ -e $DOWNLOAD_DIRECTORY/sound.wav ]
  then
      echo "Sound already downloaded"
  else
      wget -P $DOWNLOAD_DIRECTORY https://raw.githubusercontent.com/Tashima42/pomo/main/sound.wav 
      echo "Downloaded sound"
  fi
}

function install_without_sound() {
  echo "Installing without sound notifications"
  echo "Downloading pomo..."
  curl https://raw.githubusercontent.com/Tashima42/pomo/main/pomo.sh > ~/.local/bin/pomo && sudo chmod +x ~/.local/bin/pomo
}

while true; do
  read -p "Install with sound notifications? (y/n)" yn
  case $yn in
    [Yy]* )
      install_with_sound
      break;;
    [Nn]* )
      install_without_sound
      break;;
    * ) echo "Please answer yes or no.";;
    esac
done
