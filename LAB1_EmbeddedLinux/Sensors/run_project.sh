#!/bin/bash


SRC_DIR="sensor/src"
INC_DIR="sensor/inc"
LOG_DIR="logs"
OUTPUT_DIR="bin"


mkdir -p "$OUTPUT_DIR"


echo "Compiling temp.c..."
gcc -c "$SRC_DIR/temp.c" -o "$OUTPUT_DIR/temp.o" -I"$INC_DIR"

echo "Compiling pressure.c..."
gcc -c "$SRC_DIR/pressure.c" -o "$OUTPUT_DIR/pressure.o" -I"$INC_DIR"

echo "Compiling main.c..."
gcc -c main.c -o "$OUTPUT_DIR/main.o" -I"$INC_DIR"

# Link the object files and create the executable
echo "Linking object files..."
gcc "$OUTPUT_DIR/temp.o" "$OUTPUT_DIR/pressure.o" "$OUTPUT_DIR/main.o" -o "$OUTPUT_DIR/sensor_app"

# Run the executable
echo "Running the program..."
"$OUTPUT_DIR/sensor_app"