#!/bin/sh

set -e

if [ -z "$1" ]; then
  echo "Usage: build.sh <arch>"
  echo "  arch: x86_64 or arm64"
  exit 1
fi

ARCH="$1"

export MACOSX_DEPLOYMENT_TARGET="11.0"
export CFLAGS="-arch ${ARCH}"
export CXXFLAGS="-arch ${ARCH}"
export LDFLAGS="-arch ${ARCH}"

set -x

VERSION=$(cat version.txt)
cd tmp

./configure --without-readline
_build/oils.sh

cp _bin/cxx-opt-sh/oils-for-unix oils-for-unix-${VERSION}-darwin-${ARCH}

file oils-for-unix-${VERSION}-darwin-${ARCH}
