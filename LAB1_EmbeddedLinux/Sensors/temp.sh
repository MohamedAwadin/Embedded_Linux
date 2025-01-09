#!/bin/bash


generate_random_float() {
    local min=$1
    local max=$2
    echo "scale=2; $min + $RANDOM * ($max - $min) / 32767" | bc
}


read -p "Enter the number of temperature values to generate: " num_temp
read -p "Enter the number of pressure values to generate: " num_pressure


temp_log="temperature.log"
pressure_log="pressure.log"


> "$temp_log"
> "$pressure_log"



for ((i=1; i<=num_temp; i++))
do
    temperature=$(generate_random_float 32 212)
    echo "$(date), $temperature K" >> "$temp_log"
done


for ((i=1; i<=num_pressure; i++))
do
    
    pressure=$(generate_random_float 900 1100)
    echo "$(date), $pressure hPa" >> "$pressure_log"
done

echo "Generated $num_temp temperature values in $temp_log"
echo "Generated $num_pressure pressure values in $pressure_log"