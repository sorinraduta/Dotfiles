#!/bin/sh

devices=$(lsblk -Jplno NAME,TYPE,RM,SIZE,MOUNTPOINT,VENDOR)
output=""
counter=0

for unmounted_disk_name in $(echo "$devices" | jq -r '.blockdevices[]  | select(.type == "disk") | select(.rm == true) | .name'); do
    unmounted_disk_name=$(echo "$unmounted_disk_name" | tr -d "[:digit:]")
    unmounted_disk_vendor=$(echo "$devices" | jq -r '.blockdevices[]  | select(.name == "'"$unmounted_disk_name"'") | .vendor')
    unmounted_disk_vendor=$(echo "$unmounted_disk_vendor" | tr -d ' ')

    if [ $counter -eq 0 ]; then
        space=""
    else
        space=" "
    fi
    counter=$((counter + 1))

    output="$output$space $unmounted_disk_vendor"
done

echo "$output"

pacmd list-sinks | grep -e 'name:.*analog' | tr "name:" " " | tr -d "[:blank:]"