cmake_minimum_required(VERSION 3.0)

## Application Info
set(APPLICATION_EXE "app" CACHE STRING "Automatically set as parent folder's name")
set(APPLICATION_NAME "Project Name")
set(APPLICATION_CODENAME "${APPLICATION_EXE}")
set(APPLICATION_AUTHOR_NAME "Borderliner")
set(APPLICATION_AUTHOR_EMAIL "hajianpour.mr@gmail.com")
set(APPLICATION_COPYRIGHT_YEARS "2017")
set(APPLICATION_VERSION_MAJOR 1)
set(APPLICATION_VERSION_MINOR 0)
set(APPLICATION_VERSION_PATCH 0)
set(APPLICATION_VERSION_TYPE SNAPSHOT)
set(APPLICATION_VERSION_STRING "${APPLICATION_VERSION_MAJOR}.${APPLICATION_VERSION_MINOR}.${APPLICATION_VERSION_PATCH}-${APPLICATION_VERSION_TYPE}")
set(APPLICATION_VENDOR_ID "com.yourcompany")
set(APPLICATION_VENDOR_NAME "Your Company")
set(APPLICATION_VENDOR_URL "yourcompany.com")
set(APPLICATION_ID "${APPLICATION_VENDOR_ID}.${PROJECT_NAME}")
project(${APPLICATION_EXE})

## C++ Flags
set(CMAKE_CXX_FLAGS "-Wall -Wextra")
set(CMAKE_CXX_FLAGS_DEBUG "-g")
set(CMAKE_CXX_FLAGS_RELEASE "-O2")
set(CMAKE_CXX_STANDARD "14")

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug)
endif()

if(CMAKE_BUILD_TYPE MATCHES Debug)
  set(CMAKE_VERBOSE_MAKEFILE 1) # Use 1 for debugging, 0 for release
  message("CMake Build Type: Debug")
else()
  set(CMAKE_VERBOSE_MAKEFILE 0)
  message("CMake Build Type: Release")
endif()

## Source Files Management
file(GLOB_RECURSE SOURCE_FILES  "src/*.cpp" "src/*.h" "src/*.hpp")
file(GLOB_RECURSE TEST_FILES    "test/*.cpp")

include_directories("include/")
add_executable(${APPLICATION_EXE} ${SOURCE_FILES})
# add_executable(${APPLICATION_EXE-test ${TEST_FILES})

## Link your libraries here.
# target_link_libraries()

## CPack Packager
# set(CPACK_GENERATOR "DEB")
# set(CPACK_DEBIAN_PACKAGE_MAINTAINER ${APPLICATION_AUTHOR_NAME})
# set(CPACK_PACKAGE_VERSION ${APPLICATION_VERSION_STRING})
# set(CPACK_MONOLITHIC_INSTALL 1) # Single file output
# include(CPack)
