# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/build

# Include any dependencies generated for this target.
include CMakeFiles/read_sharedmem.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/read_sharedmem.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/read_sharedmem.dir/flags.make

CMakeFiles/read_sharedmem.dir/read_sharedmem.c.o: CMakeFiles/read_sharedmem.dir/flags.make
CMakeFiles/read_sharedmem.dir/read_sharedmem.c.o: ../read_sharedmem.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/read_sharedmem.dir/read_sharedmem.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/read_sharedmem.dir/read_sharedmem.c.o   -c /home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/read_sharedmem.c

CMakeFiles/read_sharedmem.dir/read_sharedmem.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/read_sharedmem.dir/read_sharedmem.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/read_sharedmem.c > CMakeFiles/read_sharedmem.dir/read_sharedmem.c.i

CMakeFiles/read_sharedmem.dir/read_sharedmem.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/read_sharedmem.dir/read_sharedmem.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/read_sharedmem.c -o CMakeFiles/read_sharedmem.dir/read_sharedmem.c.s

CMakeFiles/read_sharedmem.dir/sharedmem.c.o: CMakeFiles/read_sharedmem.dir/flags.make
CMakeFiles/read_sharedmem.dir/sharedmem.c.o: ../sharedmem.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/read_sharedmem.dir/sharedmem.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/read_sharedmem.dir/sharedmem.c.o   -c /home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/sharedmem.c

CMakeFiles/read_sharedmem.dir/sharedmem.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/read_sharedmem.dir/sharedmem.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/sharedmem.c > CMakeFiles/read_sharedmem.dir/sharedmem.c.i

CMakeFiles/read_sharedmem.dir/sharedmem.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/read_sharedmem.dir/sharedmem.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/sharedmem.c -o CMakeFiles/read_sharedmem.dir/sharedmem.c.s

# Object files for target read_sharedmem
read_sharedmem_OBJECTS = \
"CMakeFiles/read_sharedmem.dir/read_sharedmem.c.o" \
"CMakeFiles/read_sharedmem.dir/sharedmem.c.o"

# External object files for target read_sharedmem
read_sharedmem_EXTERNAL_OBJECTS =

read_sharedmem: CMakeFiles/read_sharedmem.dir/read_sharedmem.c.o
read_sharedmem: CMakeFiles/read_sharedmem.dir/sharedmem.c.o
read_sharedmem: CMakeFiles/read_sharedmem.dir/build.make
read_sharedmem: CMakeFiles/read_sharedmem.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable read_sharedmem"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/read_sharedmem.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/read_sharedmem.dir/build: read_sharedmem

.PHONY : CMakeFiles/read_sharedmem.dir/build

CMakeFiles/read_sharedmem.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/read_sharedmem.dir/cmake_clean.cmake
.PHONY : CMakeFiles/read_sharedmem.dir/clean

CMakeFiles/read_sharedmem.dir/depend:
	cd /home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4 /home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4 /home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/build /home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/build /home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/build/CMakeFiles/read_sharedmem.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/read_sharedmem.dir/depend

