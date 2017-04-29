EXE_NAME="test2"
TYPE="$1"

function debug-build() {
  rm -rf build/debug
  mkdir -p build/debug
  cd build/debug
  cmake ../.. -DEXE_NAME:STRING=$EXE_NAME
  make -j4
}

function debug-run() {
  ./build/debug/$EXE_NAME
}

function process-input() {
  echo $TYPE
  case $TYPE in
    bd|--debug-build)
    debug-build
    shift
    ;;
    rd|--debug-run)
    debug-run
    shift
    ;;
    *)
    echo "Unknown argument"
    shift
    ;;
  esac
}

process-input
