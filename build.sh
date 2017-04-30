#!/bin/bash
EXE_NAME="${PWD##*/}"
TYPE="$1"

function debug-build() {
  rm -rf build/debug
  mkdir -p build/debug
  cd build/debug
  cmake ../.. \
  -DAPPLICATION_EXE:STRING=$EXE_NAME \
  -DCMAKE_BUILD_TYPE=Debug
  make -j4
}

function debug-run() {
  chmod +x build/debug/$EXE_NAME
  ./build/debug/$EXE_NAME
}

function release-build() {
  rm -rf build/release
  mkdir -p build/release
  cd build/release
  cmake ../.. \
  -DAPPLICATION_EXE:STRING=$EXE_NAME \
  -DCMAKE_BUILD_TYPE=Release
  make -j4
}

function release-run() {
  chmod +x build/release/$EXE_NAME
  ./build/release/$EXE_NAME
}

function clean-build() {
  echo "Trying to clean the build directory..."
  rm -rvf build/*
  echo "Done!"
}

function process-input() {
  case $TYPE in
    db|--debug-build)
    debug-build
    shift
    ;;
    dr|--debug-run)
    debug-run
    shift
    ;;
    rb|--release-build)
    release-build
    shift
    ;;
    rr|--release-run)
    release-run
    shift
    ;;
    c|--clean)
    clean-build
    shift
    ;;
    *)
    echo "Unknown argument"
    shift
    ;;
  esac
}

process-input
