#!/bin/bash
source bin/parse_yaml
eval $(parse_yaml config.yml "config_")
EXE_NAME=$config_project_exe
TYPE="$1"

function debug-build() {
  rm -rf build/debug
  mkdir -p build/debug
  cd build/debug
  cmake ../.. \
  -DAPPLICATION_NAME:STRING=$config_project_name \
  -DAPPLICATION_EXE:STRING=$config_project_exe \
  -DAPPLICATION_VERSION_MAJOR:STRING=$config_project_version_major \
  -DAPPLICATION_VERSION_MINOR:STRING=$config_project_version_minor \
  -DAPPLICATION_VERSION_PATCH:STRING=$config_project_version_patch \
  -DAPPLICATION_VERSION_TYPE:STRING=$config_project_version_type \
  -DAPPLICATION_VENDOR_ID:STRING=$config_project_vendor_id \
  -DAPPLICATION_VENDOR_NAME:STRING=$config_project_vendor_name \
  -DAPPLICATION_VENDOR_URL:STRING=$config_project_vendor_url \
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
  -DAPPLICATION_NAME:STRING=$config_project_name \
  -DAPPLICATION_EXE:STRING=$config_project_exe \
  -DAPPLICATION_VERSION_MAJOR:STRING=$config_project_version_major \
  -DAPPLICATION_VERSION_MINOR:STRING=$config_project_version_minor \
  -DAPPLICATION_VERSION_PATCH:STRING=$config_project_version_patch \
  -DAPPLICATION_VERSION_TYPE:STRING=$config_project_version_type \
  -DAPPLICATION_VENDOR_ID:STRING=$config_project_vendor_id \
  -DAPPLICATION_VENDOR_NAME:STRING=$config_project_vendor_name \
  -DAPPLICATION_VENDOR_URL:STRING=$config_project_vendor_url \
  -DCMAKE_BUILD_TYPE=Release
  make -j4
}

function release-run() {
  chmod +x build/release/$EXE_NAME
  ./build/release/$EXE_NAME
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
    *)
    echo "Unknown argument"
    shift
    ;;
  esac
}

process-input
