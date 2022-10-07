#!/bin/bash

### Support for MacOS and Linux
kernel=$(uname -s)
### Send desktop notifications
## Params: header {String} - Notification highlighted text
## Params: body {String} - Notification complementary text
## Returns: {Void}
function notify() {
  header=$1
  body=$2
  if [[ $kernel == "Darwin" ]]; then
	osascript -e "display notification \"${body:?}\" with title \"${header:?}\""
  else
    notify-send -u critical -t 0 -a pomo "${header:?}" "${body:?}"
  fi
}

### Show a countdown timer and a message and updates without
### cleaning the whole screen
## Params: seconds {Number} - Countdown time in seconds 
## Params: message {String} - Timer description
## Returns: {String} - "hh:mm:ss - $message"
function countdown(){
  secs=$1
  shift
  message=$*
  while [ "$secs" -gt -1 ]
  do
    sleep 1 &
    printf "\r%s - %02d:%02d:%02d" "$message" $((secs/3600)) $(((secs/60)%60)) $((secs%60))
    secs=$(( secs - 1 ))
    wait
  done
  echo
}

### Transforms minutes into seconds
## Params: minutes {Number} - Ammount of minutes to be transformed to seconds
## Returns: {Number} - Seconds
function minutes_to_seconds() {
  minutes=$1 
  echo $((minutes * 60))
}

### Add minutes to current time
## Params: minutes {Number} - Ammounts of minutes to be added
## Returns: {Date} - Current date plus minutes
function current_time_plus_minutes() {
  minutes=$1
  if [[ $kernel == "Darwin" ]]; then
	date -v +"${minutes}"M +%R
  else
    date -d "$minutes minutes" +'%H:%M'
  fi
}

### Display a summary of the settings defined by the user
## Params: focus_minutes {Number} - Ammount of minutes to last a focus period
## Params: break_minutes {Number} - Ammount of minutes to last a break period
## Params: long_break_minutes {Number} - Ammount of minutes to last a long break period
## Params: breaks_until_long {Number} - Ammount of breaks until a long break period starts
## Returns: {String} - Formatted summary of the settings
function display_summary() {
    focus_minutes=$1
    break_minutes=$2
    long_break_minutes=$3
    breaks_until_long=$4

    echo "╔════════════════╦════════╗"
    echo "║ FOCUS          ║   $(printf "%03d\n" "$focus_minutes")  ║"
    echo "║ BREAK          ║   $(printf "%03d\n" "$break_minutes")  ║"
    echo "║ LONG BREAK     ║   $(printf "%03d\n" "$long_break_minutes")  ║"
    echo "║ BREAKS TL LONG ║   $(printf "%03d\n" "$breaks_until_long")  ║"
    echo "╚════════════════╩════════╝"
}

### Display a help message
## Returns: {String} - Formatted help message with all available settings and options
function display_help() {
  echo "Usage: $(basename "$0") [options] [focus] [break] [long_break] [breaks_until_long]"
  echo "    options            -h: display help message"
  echo "    focus              Minutes of focus until break      | Default = 25"
  echo "    break              Minutes of break until focus      | Default = 5"
  echo "    long_break         Minutes of long break until focus | Default = 15"
  echo "    breaks_until_long  Number of breaks until long break | Default = 4"
}

### Controls the application flow, parse arguments, show the countdown and notifications
## Params: focus_minutes {Number} - Ammount of minutes to last a focus period
## Params: break_minutes {Number} - Ammount of minutes to last a break period
## Params: long_break_minutes {Number} - Ammount of minutes to last a long break period
## Params: breaks_until_long {Number} - Ammount of breaks until a long break period starts
## Returns: {Void}
function main() {
    focus_minutes=$1
    break_minutes=$2
    long_break_minutes=$3
    breaks_until_long=$4

    focus_seconds=$(minutes_to_seconds "$focus_minutes")
    break_seconds=$(minutes_to_seconds "$break_minutes")
    long_break_seconds=$(minutes_to_seconds "$long_break_minutes")


    display_summary "$focus_minutes" "$break_minutes" "$long_break_minutes" "$breaks_until_long"

    while true; do
      for (( i=1; i<=breaks_until_long; i++ )); do
	countdown "$focus_seconds" "FOCUS TIME" 
	notify "BREAK: $break_minutes MINUTES" "Focus time at $(current_time_plus_minutes "$break_minutes")"

	if [ $((i)) -ne "$breaks_until_long" ]; then
	  countdown "$break_seconds" "BREAK TIME"
	  notify "FOCUS: $focus_minutes MINUTES" "Break time at $(current_time_plus_minutes "$focus_minutes")"
	else
	  notify "LONG BREAK: $long_break_minutes MINUTES" "Focus time at $(current_time_plus_minutes "$long_break_minutes")"
	fi
      done
	countdown "$long_break_seconds" "LONG BREAK TIME"
	notify "FOCUS: $focus_minutes MINUTES" "Break time at $(current_time_plus_minutes "$focus_minutes")"
    done
}

## Help message
if [ "$1" == "-h" ]; then
  display_help
  exit 0
fi

main "${1:-25}" "${2:-5}" "${3:-15}" "${4:-4}"
