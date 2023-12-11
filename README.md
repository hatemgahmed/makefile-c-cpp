# makefile-c-cpp
Automatic Dependency Generation: Automatically generate dependencies for .c/.cpp files to ensure that changes in header files trigger recompilation of affected source files.

Separate Directories for Object Files: Store object files in a separate directory structure, which can help in keeping the source directory clean.

Use of Variables for Compiler and Flags: Define variables for compilers and flags at the beginning of the Makefile for easy modification.

Conditional Compilation: Add conditions to handle different environments or compilation modes (like debug and release).

Phony Targets: Clearly define phony targets like all, clean, etc.

Verbose Option: Include an option to turn on/off verbose output for better readability during compilation.

Parallel Compilation: Use the -j flag for parallel compilation to speed up the build process.

Include a Help Command: A help command to list all available commands can be very user-friendly.

Use Wildcards for Source Files: Instead of manually specifying source files, use wildcards. This can be especially useful if you have many source files.

Colorize Output: Adding colors to the output (for errors, warnings, etc.) can improve the readability of the console output.

FFI Compilation: If you are using FFI to call C functions from another language (like Python or Ruby), ensure your C code is compiled as a shared library. This involves adding specific flags to the compiler and linker.

Linking to Libraries: For linking to standard or external libraries, use the LDLIBS variable. For example, to link against the math library (libm), add -lm to LDLIBS.
