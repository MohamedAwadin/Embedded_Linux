# Minimum version of CMake required
cmake_minimum_required(VERSION 3.10)

# Project name
project(SharedMemoryExample)

# Set the C standard
set(CMAKE_C_STANDARD 99)

# Add executable for the write program
add_executable(write_sharedmem write_sharedmem.c sharedmem.c)

# Add executable for the read program
add_executable(read_sharedmem read_sharedmem.c sharedmem.c)

# Add executable for the destroy program
add_executable(destroy_sharedmem destroy_sharedmem.c sharedmem.c)
