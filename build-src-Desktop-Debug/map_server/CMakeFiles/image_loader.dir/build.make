# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/cmake-gui

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/shenyu/distributed_robot_sys/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/shenyu/distributed_robot_sys/build-src-Desktop-Debug

# Include any dependencies generated for this target.
include map_server/CMakeFiles/image_loader.dir/depend.make

# Include the progress variables for this target.
include map_server/CMakeFiles/image_loader.dir/progress.make

# Include the compile flags for this target's objects.
include map_server/CMakeFiles/image_loader.dir/flags.make

map_server/CMakeFiles/image_loader.dir/src/image_loader.cpp.o: map_server/CMakeFiles/image_loader.dir/flags.make
map_server/CMakeFiles/image_loader.dir/src/image_loader.cpp.o: /home/shenyu/distributed_robot_sys/src/map_server/src/image_loader.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/shenyu/distributed_robot_sys/build-src-Desktop-Debug/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object map_server/CMakeFiles/image_loader.dir/src/image_loader.cpp.o"
	cd /home/shenyu/distributed_robot_sys/build-src-Desktop-Debug/map_server && /usr/bin/g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/image_loader.dir/src/image_loader.cpp.o -c /home/shenyu/distributed_robot_sys/src/map_server/src/image_loader.cpp

map_server/CMakeFiles/image_loader.dir/src/image_loader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/image_loader.dir/src/image_loader.cpp.i"
	cd /home/shenyu/distributed_robot_sys/build-src-Desktop-Debug/map_server && /usr/bin/g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/shenyu/distributed_robot_sys/src/map_server/src/image_loader.cpp > CMakeFiles/image_loader.dir/src/image_loader.cpp.i

map_server/CMakeFiles/image_loader.dir/src/image_loader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/image_loader.dir/src/image_loader.cpp.s"
	cd /home/shenyu/distributed_robot_sys/build-src-Desktop-Debug/map_server && /usr/bin/g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/shenyu/distributed_robot_sys/src/map_server/src/image_loader.cpp -o CMakeFiles/image_loader.dir/src/image_loader.cpp.s

map_server/CMakeFiles/image_loader.dir/src/image_loader.cpp.o.requires:
.PHONY : map_server/CMakeFiles/image_loader.dir/src/image_loader.cpp.o.requires

map_server/CMakeFiles/image_loader.dir/src/image_loader.cpp.o.provides: map_server/CMakeFiles/image_loader.dir/src/image_loader.cpp.o.requires
	$(MAKE) -f map_server/CMakeFiles/image_loader.dir/build.make map_server/CMakeFiles/image_loader.dir/src/image_loader.cpp.o.provides.build
.PHONY : map_server/CMakeFiles/image_loader.dir/src/image_loader.cpp.o.provides

map_server/CMakeFiles/image_loader.dir/src/image_loader.cpp.o.provides.build: map_server/CMakeFiles/image_loader.dir/src/image_loader.cpp.o

# Object files for target image_loader
image_loader_OBJECTS = \
"CMakeFiles/image_loader.dir/src/image_loader.cpp.o"

# External object files for target image_loader
image_loader_EXTERNAL_OBJECTS =

devel/lib/libimage_loader.so: map_server/CMakeFiles/image_loader.dir/src/image_loader.cpp.o
devel/lib/libimage_loader.so: map_server/CMakeFiles/image_loader.dir/build.make
devel/lib/libimage_loader.so: /usr/lib/x86_64-linux-gnu/libboost_system.so
devel/lib/libimage_loader.so: map_server/CMakeFiles/image_loader.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library ../devel/lib/libimage_loader.so"
	cd /home/shenyu/distributed_robot_sys/build-src-Desktop-Debug/map_server && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/image_loader.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
map_server/CMakeFiles/image_loader.dir/build: devel/lib/libimage_loader.so
.PHONY : map_server/CMakeFiles/image_loader.dir/build

map_server/CMakeFiles/image_loader.dir/requires: map_server/CMakeFiles/image_loader.dir/src/image_loader.cpp.o.requires
.PHONY : map_server/CMakeFiles/image_loader.dir/requires

map_server/CMakeFiles/image_loader.dir/clean:
	cd /home/shenyu/distributed_robot_sys/build-src-Desktop-Debug/map_server && $(CMAKE_COMMAND) -P CMakeFiles/image_loader.dir/cmake_clean.cmake
.PHONY : map_server/CMakeFiles/image_loader.dir/clean

map_server/CMakeFiles/image_loader.dir/depend:
	cd /home/shenyu/distributed_robot_sys/build-src-Desktop-Debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/shenyu/distributed_robot_sys/src /home/shenyu/distributed_robot_sys/src/map_server /home/shenyu/distributed_robot_sys/build-src-Desktop-Debug /home/shenyu/distributed_robot_sys/build-src-Desktop-Debug/map_server /home/shenyu/distributed_robot_sys/build-src-Desktop-Debug/map_server/CMakeFiles/image_loader.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : map_server/CMakeFiles/image_loader.dir/depend

