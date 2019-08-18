#!/bin/sh
# This uses the latest available iOS SDK, which is recommended.
# To select a specific SDK, run ‘xcodebuild -showsdks’
# to see the available SDKs and replace iphoneos with one of them.
set -x 
SDK=iphoneos
SDK_PATH=`xcrun -sdk $SDK -show-sdk-path`
export IPHONEOS_DEPLOYMENT_TARGET=7.0
# cmd/cgo doesn’t support llvm-gcc-4.2, so we have to use clang.
CLANG=`xcrun -sdk $SDK -find clang`

exec "$CLANG" -v -arch armv7 -isysroot "$SDK_PATH" "$@"
