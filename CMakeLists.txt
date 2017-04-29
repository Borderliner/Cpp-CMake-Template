cmake_minimum_required(VERSION 3.0)
set(CMAKE_CXX_STANDARD "14")
set(EXE_NAME "app" CACHE STRING "Executable Name, passed by argument to cmake")

aux_source_directory("src/" SRC_LIST)

project(${EXE_NAME})
add_executable(${EXE_NAME} ${SRC_LIST})
