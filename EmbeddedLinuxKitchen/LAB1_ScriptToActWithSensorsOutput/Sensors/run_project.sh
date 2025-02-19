#!/bin/bash


SRC_DIR="sensor/src"
INC_DIR="sensor/inc"
LOG_DIR="logs"
OUTPUT_DIR="bin"
LIB_DIR="lib"


mkdir  "$OUTPUT_DIR"
mkdir  "$LIB_DIR"

gcc -c "$SRC_DIR/temp.c" -o "$OUTPUT_DIR/temp.o" -I"$INC_DIR"
gcc -c "$SRC_DIR/pressure.c" -o "$OUTPUT_DIR/pressure.o" -I"$INC_DIR"
gcc -c main.c -o "$OUTPUT_DIR/main.o" -I"$INC_DIR"

ar rcs "$LIB_DIR/libtemp.a" "$OUTPUT_DIR/temp.o" 
ar rcs "$LIB_DIR/libpressure.a" "$OUTPUT_DIR/pressure.o" 

gcc -static "$OUTPUT_DIR/main.o" -L"$LIB_DIR" -ltemp -lpressure -o "$OUTPUT_DIR/sensor_app"


echo "Running the program..."
"$OUTPUT_DIR/sensor_app"