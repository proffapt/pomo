#!/bin/sh

function notify() {
  header=$1
  body=$2
  notify-send -u critical -t 0 -a pomo "${header:?}" "${body:?}"
}

function minutes_to_seconds() {
  minutes=$1 
  echo $(($minutes * 60))
}

function current_time_plus_minutes() {
  minutes=$1
  date -d "$minutes minutes" +'%H:%M'
}

function pomo() {
    focus_minutes=${1-25} # default = 25
    break_minutes=${2-5} # default = 5
    long_break_minutes=${3-15} # default = 15
    breaks_until_long=${4-4} # default = 4

    focus_seconds=$(minutes_to_seconds $focus_minutes)
    break_seconds=$(minutes_to_seconds $break_minutes)
    long_break_seconds=$(minutes_to_seconds $long_break_minutes)

    echo "╔════════════════╦════════╗"
    echo "║      KEY       ║ VALUE  ║"
    echo "╠════════════════╬════════╣"
    echo "║ FOCUS          ║   $(printf "%03d\n" $focus_minutes)  ║"
    echo "║ BREAK          ║   $(printf "%03d\n" $break_minutes)  ║"
    echo "║ LONG BREAK     ║   $(printf "%03d\n" $long_break_minutes)  ║"
    echo "║ BREAKS TL LONG ║   $(printf "%03d\n" $breaks_until_long)  ║"
    echo "╚════════════════╩════════╝"

    while true; do
      iterations=$breaks_until_long
      current=0
      while [ $current -le $(($iterations - 1)) ]; do 
	echo "FOCUS TIME: $(date '+%H:%M')"
	sleep "${focus_seconds:?}"
	notify "BREAK: $break_minutes MINUTES" "Focus time at $(current_time_plus_minutes $break_minutes)"

	echo "BREAK TIME: $(date '+%H:%M')"
	sleep "${break_seconds:?}"
	notify "FOCUS: $focus_minutes MINUTES" "Break time at $(current_time_plus_minutes $focus_minutes)"

	current=$(($current + 1))
      done
	echo "LONG BREAK TIME: $(date '+%H:%M')"
	sleep "${long_break_seconds:?}"
	notify "LONG BREAK: $long_break_minutes MINUTES" "Focus time at $(current_time_plus_minutes $long_break_minutes)"
    done
}

function display_help() {
  echo "Usage: `basename $0` [focus] [break] [long_break] [breaks_until_long]"
  echo "    focus                 Minutes of focus until break      | Default = 25"
  echo "    break                 Minutes of break until focus      | Default = 5"
  echo "    long_break            Minutes of long break until focus | Default = 15"
  echo "    breaks_until_long     Number of breaks until long break | Default = 4"
}

## Help message
if [ "$1" == "-h" ]; then
  display_help
  exit 0
fi

pomo $1 $2 $3 $4
