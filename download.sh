#!/bin/sh
set -xe

VERSION=$(cat version.txt)

rm -rf tmp
mkdir tmp

curl -o tmp/oils-for-unix.tar.gz https://oils.pub/download/oils-for-unix-${VERSION}.tar.gz
tar -xzf tmp/oils-for-unix.tar.gz -C tmp --strip-components=1
rm tmp/oils-for-unix.tar.gz
