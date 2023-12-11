# Enhanced Makefile

# Compiler settings
CC = gcc
CXX = g++
CFLAGS = -Wall -g -fPIC # -fPIC for position-independent code, needed for shared libraries
CXXFLAGS = -Wall -g -fPIC
LDFLAGS = 
LDLIBS = -lm # Example for linking against the math library. Add other libraries as needed.

# For FFI, compile as a shared library (e.g., .so file on Linux)
FFI_TARGET = $(BINDIR)/libmyffi.so

# Directories
SRCDIR = src
OBJDIR = obj
BINDIR = bin
LIBDIR = 

# Find all C and C++ source files
SOURCES = $(shell find $(SRCDIR) -name '*.c' -o -name '*.cpp')
# Create corresponding object files in the obj directory
OBJS = $(SOURCES:%=$(OBJDIR)/%.o)
DEPS = $(OBJS:.o=.d)

# Target executable name
TARGET = $(BINDIR)/myprogram

# Default target
all: $(BINDIR) $(TARGET) $(FFI_TARGET)

# Create bin and obj directories
$(BINDIR) $(OBJDIR):
	mkdir -p $@

# Include dependencies
-include $(DEPS)

# Rule for linking the final executable
$(TARGET): $(OBJS)
	$(CXX) $(LDFLAGS) -o $@ $^ $(LDLIBS)

# Rule for FFI shared library
$(FFI_TARGET): $(OBJS)
	$(CXX) -shared $(LDFLAGS) -o $@ $^ $(LDLIBS)

# Rule for compiling C and C++ source files
$(OBJDIR)/%.c.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -MMD -c $< -o $@

$(OBJDIR)/%.cpp.o: %.cpp
	mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -MMD -c $< -o $@

# Clean up build files
clean:
	rm -rf $(BINDIR) $(OBJDIR)

# Help command
help:
	@echo "Available commands:"
	@echo "  all: Build the project"
	@echo "  clean: Remove build files"
	@echo "  help: Display this help message"

.PHONY: all clean help
