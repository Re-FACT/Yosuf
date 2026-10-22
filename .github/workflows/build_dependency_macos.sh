#!/usr/bin/env bash

set -euo pipefail

echo "=================================================="
echo "Installing macOS dependencies..."
echo "=================================================="

# 1. Pre-flight checks & Environment Detection
if ! command -v brew &> /dev/null; then
    echo "Error: Homebrew is not installed. Please install it from https://brew.sh first." >&2
    exit 1
fi

MACOS_VERSION="$(sw_vers -productVersion)"
ARCH="$(uname -m)"
BREW_PREFIX="$(brew --prefix)"

echo "Detected macOS Version : ${MACOS_VERSION}"
echo "Detected Architecture  : ${ARCH}"
echo "Homebrew Prefix        : ${BREW_PREFIX}"
echo "--------------------------------------------------"

# 2. Update Homebrew
echo "Updating Homebrew..."
brew update

# 3. Install Dependencies
echo "Installing formula dependencies..."
brew install \
    autoconf \
    automake \
    libtool \
    bison \
    ccache \
    cmake \
    ninja \
    pkgconf \
    gperf \
    flex \
    git \
    curl \
    wget \
    zip \
    perl \
    boost \
    eigen@3 \
    openssl@3 \
    zlib \
    libffi \
    readline \
    libxml2 \
    ncurses \
    python \
    tcl-tk \
    swig \
    graphviz \
    icarus-verilog \
    googletest \
    gawk \
    llvm \
    qt

echo "--------------------------------------------------"
echo "Configuring environment variables..."

# Apple Clang
export CC="$(xcrun --find clang)"
export CXX="$(xcrun --find clang++)"

# Keg-only tool paths (LLVM & OpenSSL)
# Essential for compiling C/C++ projects cleanly across macOS 15+ SDKs
if [ -d "${BREW_PREFIX}/opt/llvm" ]; then
    export PATH="${BREW_PREFIX}/opt/llvm/bin:${PATH}"
    export LDFLAGS="-L${BREW_PREFIX}/opt/llvm/lib ${LDFLAGS:-}"
    export CPPFLAGS="-I${BREW_PREFIX}/opt/llvm/include ${CPPFLAGS:-}"
fi

if [ -d "${BREW_PREFIX}/opt/openssl@3" ]; then
    export LDFLAGS="-L${BREW_PREFIX}/opt/openssl@3/lib ${LDFLAGS:-}"
    export CPPFLAGS="-I${BREW_PREFIX}/opt/openssl@3/include ${CPPFLAGS:-}"
fi

# Qt6 Configuration
if [ -d "${BREW_PREFIX}/opt/qt" ]; then
    export QT_PREFIX="${BREW_PREFIX}/opt/qt"
else
    export QT_PREFIX="$(brew --prefix qt)"
fi
export PATH="${QT_PREFIX}/bin:${PATH}"
export CMAKE_PREFIX_PATH="${QT_PREFIX}:${CMAKE_PREFIX_PATH:-}"

# ccache Configuration
export CCACHE_DIR="${HOME}/.ccache"
mkdir -p "${CCACHE_DIR}"
ccache --set-config=max_size=2G

echo "--------------------------------------------------"
echo "Verification:"
echo "  CC=${CC}"
echo "  CXX=${CXX}"
echo "  Qt=${QT_PREFIX}"
echo "--------------------------------------------------"

clang++ --version
cmake --version
ninja --version
ccache --version
python3 --version
qmake --version
iverilog -V

echo "=================================================="
echo "macOS dependencies successfully installed!"
echo "=================================================="
