EXE_NAME="test2"
TYPE="$1"

function debug-build() {
  rm -rf build/debug
  mkdir -p build/debug
  cd build/debug
  cmake ../.. -DEXE_NAME:STRING=$EXE_NAME -DCMAKE_BUILD_TYPE=Debug
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
  cmake ../.. -DEXE_NAME:STRING=$EXE_NAME -DCMAKE_BUILD_TYPE=Release
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
