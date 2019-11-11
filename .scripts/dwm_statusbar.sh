#!/bin/sh

__time(){
  dte="$(date +" %l:%M%p")"
  echo -e "$dte"
}

__date(){
  dte="$(date +" %d-%m-%Y")"
  echo -e "$dte"
}

__memory(){
  memory=`free | awk '/Mem/ {printf "%d% RAM", (100 * ($3 / 1024.0)) / ($2 / 1024.0)}'`
  echo -e " $memory"
}

__cpu(){
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e " $cpu% CPU"
}

__battery() {
  bat_info="$(acpi --battery)"
  battery="$(acpi --battery | cut -d, -f2)"
  percentage="$(echo $battery | cut -d% -f1)"

  if [[ $bat_info == *"Discharging"* ]]; then
    if [ $percentage -gt 90 ]; then
      icon="" #100
    elif [ $percentage -gt 60 ]
    then
      icon="" #70
    elif [ $percentage -gt 30 ]
    then
      icon="" #40
    elif [ $percentage -gt 10 ]
    then
      icon="" #20
    else
      icon="" #0
    fi
  else
    if [ $percentage -gt 90 ]; then
      icon="" #100
    elif [ $percentage -gt 60 ]
    then
      icon="" #70
    elif [ $percentage -gt 30 ]
    then
      icon="" #40
    elif [ $percentage -gt 10 ]
    then
      icon="" #20
    else
      icon="" #0
    fi
  fi

  echo "$icon $percentage%"
}

while true; do
  xsetroot -name "$(__battery)    $(__cpu)    $(__memory)    $(__date)    $(__time)    "
  sleep 10s    # Update time every ten seconds
done &