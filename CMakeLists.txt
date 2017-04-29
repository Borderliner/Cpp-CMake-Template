cmake_minimum_required(VERSION 3.0)
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug)
endif()

set(CMAKE_CXX_FLAGS "-Wall -Wextra")
set(CMAKE_CXX_FLAGS_DEBUG "-g")
set(CMAKE_CXX_FLAGS_RELEASE "-O2")
set(CMAKE_CXX_STANDARD "14")
set(EXE_NAME "app" CACHE STRING "Executable Name, passed by argument to cmake")

aux_source_directory("src/" SRC_LIST)

project(${EXE_NAME})
add_executable(${EXE_NAME} ${SRC_LIST})

## Link your libraries here.

## CPack Packager
# set(CPACK_GENERATOR "DEB")
# set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Borderliner")
# include(CPack)
