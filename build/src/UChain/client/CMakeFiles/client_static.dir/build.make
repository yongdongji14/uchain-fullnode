# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.12

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Produce verbose output by default.
VERBOSE = 1

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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.12.1/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.12.1/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/cary/Projects/uchain-fullnode

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/cary/Projects/uchain-fullnode/build

# Include any dependencies generated for this target.
include src/UChain/client/CMakeFiles/client_static.dir/depend.make

# Include the progress variables for this target.
include src/UChain/client/CMakeFiles/client_static.dir/progress.make

# Include the compile flags for this target's objects.
include src/UChain/client/CMakeFiles/client_static.dir/flags.make

src/UChain/client/CMakeFiles/client_static.dir/dealer.cpp.o: src/UChain/client/CMakeFiles/client_static.dir/flags.make
src/UChain/client/CMakeFiles/client_static.dir/dealer.cpp.o: ../src/UChain/client/dealer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/cary/Projects/uchain-fullnode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/UChain/client/CMakeFiles/client_static.dir/dealer.cpp.o"
	cd /Users/cary/Projects/uchain-fullnode/build/src/UChain/client && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/client_static.dir/dealer.cpp.o -c /Users/cary/Projects/uchain-fullnode/src/UChain/client/dealer.cpp

src/UChain/client/CMakeFiles/client_static.dir/dealer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/client_static.dir/dealer.cpp.i"
	cd /Users/cary/Projects/uchain-fullnode/build/src/UChain/client && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/cary/Projects/uchain-fullnode/src/UChain/client/dealer.cpp > CMakeFiles/client_static.dir/dealer.cpp.i

src/UChain/client/CMakeFiles/client_static.dir/dealer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/client_static.dir/dealer.cpp.s"
	cd /Users/cary/Projects/uchain-fullnode/build/src/UChain/client && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/cary/Projects/uchain-fullnode/src/UChain/client/dealer.cpp -o CMakeFiles/client_static.dir/dealer.cpp.s

src/UChain/client/CMakeFiles/client_static.dir/obelisk_client.cpp.o: src/UChain/client/CMakeFiles/client_static.dir/flags.make
src/UChain/client/CMakeFiles/client_static.dir/obelisk_client.cpp.o: ../src/UChain/client/obelisk_client.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/cary/Projects/uchain-fullnode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/UChain/client/CMakeFiles/client_static.dir/obelisk_client.cpp.o"
	cd /Users/cary/Projects/uchain-fullnode/build/src/UChain/client && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/client_static.dir/obelisk_client.cpp.o -c /Users/cary/Projects/uchain-fullnode/src/UChain/client/obelisk_client.cpp

src/UChain/client/CMakeFiles/client_static.dir/obelisk_client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/client_static.dir/obelisk_client.cpp.i"
	cd /Users/cary/Projects/uchain-fullnode/build/src/UChain/client && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/cary/Projects/uchain-fullnode/src/UChain/client/obelisk_client.cpp > CMakeFiles/client_static.dir/obelisk_client.cpp.i

src/UChain/client/CMakeFiles/client_static.dir/obelisk_client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/client_static.dir/obelisk_client.cpp.s"
	cd /Users/cary/Projects/uchain-fullnode/build/src/UChain/client && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/cary/Projects/uchain-fullnode/src/UChain/client/obelisk_client.cpp -o CMakeFiles/client_static.dir/obelisk_client.cpp.s

src/UChain/client/CMakeFiles/client_static.dir/proxy.cpp.o: src/UChain/client/CMakeFiles/client_static.dir/flags.make
src/UChain/client/CMakeFiles/client_static.dir/proxy.cpp.o: ../src/UChain/client/proxy.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/cary/Projects/uchain-fullnode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/UChain/client/CMakeFiles/client_static.dir/proxy.cpp.o"
	cd /Users/cary/Projects/uchain-fullnode/build/src/UChain/client && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/client_static.dir/proxy.cpp.o -c /Users/cary/Projects/uchain-fullnode/src/UChain/client/proxy.cpp

src/UChain/client/CMakeFiles/client_static.dir/proxy.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/client_static.dir/proxy.cpp.i"
	cd /Users/cary/Projects/uchain-fullnode/build/src/UChain/client && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/cary/Projects/uchain-fullnode/src/UChain/client/proxy.cpp > CMakeFiles/client_static.dir/proxy.cpp.i

src/UChain/client/CMakeFiles/client_static.dir/proxy.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/client_static.dir/proxy.cpp.s"
	cd /Users/cary/Projects/uchain-fullnode/build/src/UChain/client && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/cary/Projects/uchain-fullnode/src/UChain/client/proxy.cpp -o CMakeFiles/client_static.dir/proxy.cpp.s

src/UChain/client/CMakeFiles/client_static.dir/socket_stream.cpp.o: src/UChain/client/CMakeFiles/client_static.dir/flags.make
src/UChain/client/CMakeFiles/client_static.dir/socket_stream.cpp.o: ../src/UChain/client/socket_stream.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/cary/Projects/uchain-fullnode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/UChain/client/CMakeFiles/client_static.dir/socket_stream.cpp.o"
	cd /Users/cary/Projects/uchain-fullnode/build/src/UChain/client && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/client_static.dir/socket_stream.cpp.o -c /Users/cary/Projects/uchain-fullnode/src/UChain/client/socket_stream.cpp

src/UChain/client/CMakeFiles/client_static.dir/socket_stream.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/client_static.dir/socket_stream.cpp.i"
	cd /Users/cary/Projects/uchain-fullnode/build/src/UChain/client && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/cary/Projects/uchain-fullnode/src/UChain/client/socket_stream.cpp > CMakeFiles/client_static.dir/socket_stream.cpp.i

src/UChain/client/CMakeFiles/client_static.dir/socket_stream.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/client_static.dir/socket_stream.cpp.s"
	cd /Users/cary/Projects/uchain-fullnode/build/src/UChain/client && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/cary/Projects/uchain-fullnode/src/UChain/client/socket_stream.cpp -o CMakeFiles/client_static.dir/socket_stream.cpp.s

# Object files for target client_static
client_static_OBJECTS = \
"CMakeFiles/client_static.dir/dealer.cpp.o" \
"CMakeFiles/client_static.dir/obelisk_client.cpp.o" \
"CMakeFiles/client_static.dir/proxy.cpp.o" \
"CMakeFiles/client_static.dir/socket_stream.cpp.o"

# External object files for target client_static
client_static_EXTERNAL_OBJECTS =

lib/libuc_client.a: src/UChain/client/CMakeFiles/client_static.dir/dealer.cpp.o
lib/libuc_client.a: src/UChain/client/CMakeFiles/client_static.dir/obelisk_client.cpp.o
lib/libuc_client.a: src/UChain/client/CMakeFiles/client_static.dir/proxy.cpp.o
lib/libuc_client.a: src/UChain/client/CMakeFiles/client_static.dir/socket_stream.cpp.o
lib/libuc_client.a: src/UChain/client/CMakeFiles/client_static.dir/build.make
lib/libuc_client.a: src/UChain/client/CMakeFiles/client_static.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/cary/Projects/uchain-fullnode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX static library ../../../lib/libuc_client.a"
	cd /Users/cary/Projects/uchain-fullnode/build/src/UChain/client && $(CMAKE_COMMAND) -P CMakeFiles/client_static.dir/cmake_clean_target.cmake
	cd /Users/cary/Projects/uchain-fullnode/build/src/UChain/client && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/client_static.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/UChain/client/CMakeFiles/client_static.dir/build: lib/libuc_client.a

.PHONY : src/UChain/client/CMakeFiles/client_static.dir/build

src/UChain/client/CMakeFiles/client_static.dir/clean:
	cd /Users/cary/Projects/uchain-fullnode/build/src/UChain/client && $(CMAKE_COMMAND) -P CMakeFiles/client_static.dir/cmake_clean.cmake
.PHONY : src/UChain/client/CMakeFiles/client_static.dir/clean

src/UChain/client/CMakeFiles/client_static.dir/depend:
	cd /Users/cary/Projects/uchain-fullnode/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/cary/Projects/uchain-fullnode /Users/cary/Projects/uchain-fullnode/src/UChain/client /Users/cary/Projects/uchain-fullnode/build /Users/cary/Projects/uchain-fullnode/build/src/UChain/client /Users/cary/Projects/uchain-fullnode/build/src/UChain/client/CMakeFiles/client_static.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/UChain/client/CMakeFiles/client_static.dir/depend
