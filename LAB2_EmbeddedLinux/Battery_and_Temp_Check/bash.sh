#!/bin/bash


check_battery(){

    #Get battery Percentage 
    battery_level=$(acpi -b | grep -o '[0-9]\{1,3\}%' | tr -d '%')

    echo "Battery Level : $battery_level"

    if [ $battery_level -lt 10 ]; then
      #  notify-send "battery warning" "Battery is below 10%! current level: ${battery_level}%"
        notify-send -i ./icon/yalhwy.png "Battery warning" "Battery is below 10%! Current level: ${battery_level}%"
        paplay "sound.wav"
    fi 


}

check_temperture(){

    temp=$(cat /sys/class/thermal/thermal_zone0/temp)
    #Convert temperture to celsius (convert by 1000)
    temp=$((temp / 1000))
    echo "Temperture Level : $temp"
    
    if [ "$temp" -gt 50 ]; then
      #  notify-send "Tempertue warning" "CPU tempertue exceeds 50 C! current level: ${temp}C"
        notify-send -i ./icon/yalhwy.png "CPU tempertue warning" "CPU tempertue exceeds 50 C! Current level: ${temp}C"
        paplay "sound.wav"
    fi

}


while true; do
    check_battery
    check_temperture

    sleep 1
done


