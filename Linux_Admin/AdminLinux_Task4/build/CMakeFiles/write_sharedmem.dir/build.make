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
include CMakeFiles/write_sharedmem.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/write_sharedmem.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/write_sharedmem.dir/flags.make

CMakeFiles/write_sharedmem.dir/write_sharedmem.c.o: CMakeFiles/write_sharedmem.dir/flags.make
CMakeFiles/write_sharedmem.dir/write_sharedmem.c.o: ../write_sharedmem.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/write_sharedmem.dir/write_sharedmem.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/write_sharedmem.dir/write_sharedmem.c.o   -c /home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/write_sharedmem.c

CMakeFiles/write_sharedmem.dir/write_sharedmem.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/write_sharedmem.dir/write_sharedmem.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/write_sharedmem.c > CMakeFiles/write_sharedmem.dir/write_sharedmem.c.i

CMakeFiles/write_sharedmem.dir/write_sharedmem.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/write_sharedmem.dir/write_sharedmem.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/write_sharedmem.c -o CMakeFiles/write_sharedmem.dir/write_sharedmem.c.s

CMakeFiles/write_sharedmem.dir/sharedmem.c.o: CMakeFiles/write_sharedmem.dir/flags.make
CMakeFiles/write_sharedmem.dir/sharedmem.c.o: ../sharedmem.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/write_sharedmem.dir/sharedmem.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/write_sharedmem.dir/sharedmem.c.o   -c /home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/sharedmem.c

CMakeFiles/write_sharedmem.dir/sharedmem.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/write_sharedmem.dir/sharedmem.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/sharedmem.c > CMakeFiles/write_sharedmem.dir/sharedmem.c.i

CMakeFiles/write_sharedmem.dir/sharedmem.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/write_sharedmem.dir/sharedmem.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/sharedmem.c -o CMakeFiles/write_sharedmem.dir/sharedmem.c.s

# Object files for target write_sharedmem
write_sharedmem_OBJECTS = \
"CMakeFiles/write_sharedmem.dir/write_sharedmem.c.o" \
"CMakeFiles/write_sharedmem.dir/sharedmem.c.o"

# External object files for target write_sharedmem
write_sharedmem_EXTERNAL_OBJECTS =

write_sharedmem: CMakeFiles/write_sharedmem.dir/write_sharedmem.c.o
write_sharedmem: CMakeFiles/write_sharedmem.dir/sharedmem.c.o
write_sharedmem: CMakeFiles/write_sharedmem.dir/build.make
write_sharedmem: CMakeFiles/write_sharedmem.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable write_sharedmem"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/write_sharedmem.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/write_sharedmem.dir/build: write_sharedmem

.PHONY : CMakeFiles/write_sharedmem.dir/build

CMakeFiles/write_sharedmem.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/write_sharedmem.dir/cmake_clean.cmake
.PHONY : CMakeFiles/write_sharedmem.dir/clean

CMakeFiles/write_sharedmem.dir/depend:
	cd /home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4 /home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4 /home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/build /home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/build /home/awadin/ITI_9Monthes/Embedded_Linux_Course/Embedded_Linux/AdminLinux_Task4/build/CMakeFiles/write_sharedmem.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/write_sharedmem.dir/depend

