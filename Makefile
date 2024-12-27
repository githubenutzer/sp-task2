# Set the C++ compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -g

# Directories
BUILD_DIR = build-2.0
SRC_DIR = .
INCLUDE_DIR = .

# Name of the static library and the executable
LIBRARY = $(BUILD_DIR)/libcalculator.a
EXECUTABLE = $(BUILD_DIR)/calculator_exec

# List of object files
OBJS = $(BUILD_DIR)/calculator.o $(BUILD_DIR)/main.o

# Default rule to build the library and the executable
all: $(BUILD_DIR) $(LIBRARY) $(EXECUTABLE)

# Create the build directory if it doesn't exist
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Rule to create the static library from object files
$(LIBRARY): $(BUILD_DIR)/calculator.o
	ar rcs $@ $^

# Rule to create the executable from object files
$(EXECUTABLE): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJS)

# Rule to compile .cpp files to .o files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean rule to remove object files and executables
clean:
	rm -rf $(BUILD_DIR)
