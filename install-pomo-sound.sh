#!/bin/bash

DOWNLOAD_DIRECTORY=~/.config/pomo

curl https://raw.githubusercontent.com/Tashima42/pomo/main/pomo-sound.sh > ~/.local/bin/pomo 
sudo chmod +x ~/.local/bin/pomo

mkdir -p $DOWNLOAD_DIRECTORY 
wget -P $DOWNLOAD_DIRECTORY https://raw.githubusercontent.com/Tashima42/pomo/main/sound.wav 
