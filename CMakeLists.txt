cmake_minimum_required(VERSION 3.10)
project(MyProject)

set(CMAKE_C_STANDARD 99)

include_directories(include)

add_library(mylib STATIC src/mylib.c)
add_executable(main src/main.c)

target_link_libraries(main mylib)
