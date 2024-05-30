CXX := g++        # Specify your C++ compiler
CXXFLAGS := -g    # Compiler flags

SRCS := $(wildcard *.cpp)  # Find all C++ source files
OBJS := $(SRCS:.cpp=.o)   # Replace .cpp with .o for object files

main: $(OBJS)
	$(CXX) $(CXXFLAGS) -o main $(OBJS) 