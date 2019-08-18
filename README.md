# go-build-for-ios
Build Go applications for IOS

This repository contains a PoC that lets you build any Go application for IOS platform. Cross-compilation, tested using OSX (iPhoneOS SDK required) and 32-bit device (iPad 2).

**Requirements**:
* iPhoneOS SDK installed with Xcode
* Jailbreak on the target IOS device
* OpenSSH running on the target.
* [jtool](http://newosxbook.com/tools/jtool.html) reachable via PATH

I recommend to fork the project and adjust the ``Makefile`` to you current needs.

## Getting started

To build a sample project, [fileserver](https://github.com/mtojek/fileserver), please execute the following command:

```bash
$ make
```

If you want to build a custom project, you need to specify an additional variable:

```bash
$ make PROJECT=github.com/yudai/gotty deploy
```
... to build a web terminal application for IOS:

<img src="https://github.com/mtojek/go-build-for-ios/blob/master/screenshots/scr-1.png" width="640px" />

## Deployment

To build, sign the binary and deploy via SSH, run the following command:

```bash
$ make deploy
```

*Hint: please modify the network address of the target device*

Execute the application over the SSH connection and verify using browser (you should have just exposed a simple fileserver):

<img src="https://github.com/mtojek/go-build-for-ios/blob/master/screenshots/scr-2.png" width="640px" />

<img src="https://github.com/mtojek/go-build-for-ios/blob/master/screenshots/scr-3.png" width="640px" />

## Build output

Here is a sample successful build output for the build and sign command: 

```bash
$ make sign
mkdir -p bin
GOARM=7 CGO_ENABLED=1 GOARCH=arm \
	CC=`pwd`/tools/clangwrap.sh \
	CXX=`pwd`/tools/clangwrap.sh \
	go build -a -o bin/application github.com/mtojek/fileserver 
# runtime/cgo
+ SDK=iphoneos
++ xcrun -sdk iphoneos -show-sdk-path
+ SDK_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk
+ export IPHONEOS_DEPLOYMENT_TARGET=7.0
+ IPHONEOS_DEPLOYMENT_TARGET=7.0
++ xcrun -sdk iphoneos -find clang
+ CLANG=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang
+ exec /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -arch armv7 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -fPIC -marm -pthread -fno-caret-diagnostics -Qunused-arguments -fmessage-length=0 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b045=/tmp/go-build -gno-record-gcc-switches -fno-common -o $WORK/b045/_cgo_.o $WORK/b045/_cgo_main.o $WORK/b045/_x001.o $WORK/b045/_x002.o $WORK/b045/_x003.o $WORK/b045/_x004.o $WORK/b045/_x005.o $WORK/b045/_x006.o $WORK/b045/_x007.o $WORK/b045/_x008.o $WORK/b045/_x009.o $WORK/b045/_x010.o -g -O2 -framework CoreFoundation
Apple LLVM version 10.0.0 (clang-1000.11.45.5)
Target: arm-apple-darwin17.7.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ld" -demangle -lto_library /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libLTO.dylib -dynamic -arch armv7 -iphoneos_version_min 7.0.0 -syslibroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -o $WORK/b045/_cgo_.o $WORK/b045/_cgo_main.o $WORK/b045/_x001.o $WORK/b045/_x002.o $WORK/b045/_x003.o $WORK/b045/_x004.o $WORK/b045/_x005.o $WORK/b045/_x006.o $WORK/b045/_x007.o $WORK/b045/_x008.o $WORK/b045/_x009.o $WORK/b045/_x010.o -framework CoreFoundation -lSystem /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0/lib/darwin/libclang_rt.ios.a
# runtime/cgo
+ SDK=iphoneos
++ xcrun -sdk iphoneos -show-sdk-path
+ SDK_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk
+ export IPHONEOS_DEPLOYMENT_TARGET=7.0
+ IPHONEOS_DEPLOYMENT_TARGET=7.0
++ xcrun -sdk iphoneos -find clang
+ CLANG=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang
+ exec /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -arch armv7 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -fPIC -marm -pthread -fno-caret-diagnostics -Qunused-arguments -fmessage-length=0 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b045=/tmp/go-build -gno-record-gcc-switches -fno-common -I $WORK/b045/ -g -O2 -Wall -Werror -o $WORK/b045/_x001.o -c _cgo_export.c
Apple LLVM version 10.0.0 (clang-1000.11.45.5)
Target: arm-apple-darwin17.7.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang" -cc1 -triple armv7-apple-ios7.0.0 -emit-obj -disable-free -disable-llvm-verifier -discard-value-names -main-file-name _cgo_export.c -mrelocation-model pic -pic-level 2 -mthread-model posix -mdisable-fp-elim -fno-strict-return -masm-verbose -faligned-alloc-unavailable -target-cpu generic -target-feature +soft-float-abi -target-abi apcs-gnu -mfloat-abi soft -fallow-half-arguments-and-returns -dwarf-column-info -debug-info-kind=standalone -dwarf-version=2 -debugger-tuning=lldb -target-linker-version 409.12 -v -coverage-notes-file $WORK/b045/_x001.gcno -resource-dir /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -I $WORK/b045/ -O2 -Wall -Werror -Wno-error=private-module -Wno-error=objc-messaging-id -Wno-error=vexing-parse -fdebug-compilation-dir $WORK/b045 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b045=/tmp/go-build -ferror-limit 19 -fmessage-length 0 -pthread -stack-protector 1 -fblocks -fencode-extended-block-signature -fobjc-runtime=ios-7.0.0 -fsjlj-exceptions -fmax-type-align=16 -fno-common -fno-caret-diagnostics -fdiagnostics-show-option -vectorize-loops -vectorize-slp -o $WORK/b045/_x001.o -x c _cgo_export.c
clang -cc1 version 10.0.0 (clang-1000.11.45.5) default target x86_64-apple-darwin17.7.0
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/local/include"
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/Library/Frameworks"
#include "..." search starts here:
#include <...> search starts here:
 /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo
 $WORK/b045
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0/include
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/System/Library/Frameworks (framework directory)
End of search list.
# runtime/cgo
+ SDK=iphoneos
++ xcrun -sdk iphoneos -show-sdk-path
+ SDK_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk
+ export IPHONEOS_DEPLOYMENT_TARGET=7.0
+ IPHONEOS_DEPLOYMENT_TARGET=7.0
++ xcrun -sdk iphoneos -find clang
+ CLANG=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang
+ exec /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -arch armv7 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -fPIC -marm -pthread -fno-caret-diagnostics -Qunused-arguments -fmessage-length=0 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b045=/tmp/go-build -gno-record-gcc-switches -fno-common -I $WORK/b045/ -g -O2 -Wall -Werror -o $WORK/b045/_x002.o -c cgo.cgo2.c
Apple LLVM version 10.0.0 (clang-1000.11.45.5)
Target: arm-apple-darwin17.7.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang" -cc1 -triple armv7-apple-ios7.0.0 -emit-obj -disable-free -disable-llvm-verifier -discard-value-names -main-file-name cgo.cgo2.c -mrelocation-model pic -pic-level 2 -mthread-model posix -mdisable-fp-elim -fno-strict-return -masm-verbose -faligned-alloc-unavailable -target-cpu generic -target-feature +soft-float-abi -target-abi apcs-gnu -mfloat-abi soft -fallow-half-arguments-and-returns -dwarf-column-info -debug-info-kind=standalone -dwarf-version=2 -debugger-tuning=lldb -target-linker-version 409.12 -v -coverage-notes-file $WORK/b045/_x002.gcno -resource-dir /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -I $WORK/b045/ -O2 -Wall -Werror -Wno-error=private-module -Wno-error=objc-messaging-id -Wno-error=vexing-parse -fdebug-compilation-dir $WORK/b045 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b045=/tmp/go-build -ferror-limit 19 -fmessage-length 0 -pthread -stack-protector 1 -fblocks -fencode-extended-block-signature -fobjc-runtime=ios-7.0.0 -fsjlj-exceptions -fmax-type-align=16 -fno-common -fno-caret-diagnostics -fdiagnostics-show-option -vectorize-loops -vectorize-slp -o $WORK/b045/_x002.o -x c cgo.cgo2.c
clang -cc1 version 10.0.0 (clang-1000.11.45.5) default target x86_64-apple-darwin17.7.0
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/local/include"
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/Library/Frameworks"
#include "..." search starts here:
#include <...> search starts here:
 /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo
 $WORK/b045
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0/include
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/System/Library/Frameworks (framework directory)
End of search list.
# runtime/cgo
+ SDK=iphoneos
++ xcrun -sdk iphoneos -show-sdk-path
+ SDK_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk
+ export IPHONEOS_DEPLOYMENT_TARGET=7.0
+ IPHONEOS_DEPLOYMENT_TARGET=7.0
++ xcrun -sdk iphoneos -find clang
+ CLANG=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang
+ exec /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -arch armv7 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -fPIC -marm -pthread -fno-caret-diagnostics -Qunused-arguments -fmessage-length=0 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b045=/tmp/go-build -gno-record-gcc-switches -fno-common -I $WORK/b045/ -g -O2 -Wall -Werror -o $WORK/b045/_x003.o -c gcc_context.c
Apple LLVM version 10.0.0 (clang-1000.11.45.5)
Target: arm-apple-darwin17.7.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang" -cc1 -triple armv7-apple-ios7.0.0 -emit-obj -disable-free -disable-llvm-verifier -discard-value-names -main-file-name gcc_context.c -mrelocation-model pic -pic-level 2 -mthread-model posix -mdisable-fp-elim -fno-strict-return -masm-verbose -faligned-alloc-unavailable -target-cpu generic -target-feature +soft-float-abi -target-abi apcs-gnu -mfloat-abi soft -fallow-half-arguments-and-returns -dwarf-column-info -debug-info-kind=standalone -dwarf-version=2 -debugger-tuning=lldb -target-linker-version 409.12 -v -coverage-notes-file $WORK/b045/_x003.gcno -resource-dir /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -I $WORK/b045/ -O2 -Wall -Werror -Wno-error=private-module -Wno-error=objc-messaging-id -Wno-error=vexing-parse -fdebug-compilation-dir /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b045=/tmp/go-build -ferror-limit 19 -fmessage-length 0 -pthread -stack-protector 1 -fblocks -fencode-extended-block-signature -fobjc-runtime=ios-7.0.0 -fsjlj-exceptions -fmax-type-align=16 -fno-common -fno-caret-diagnostics -fdiagnostics-show-option -vectorize-loops -vectorize-slp -o $WORK/b045/_x003.o -x c gcc_context.c
clang -cc1 version 10.0.0 (clang-1000.11.45.5) default target x86_64-apple-darwin17.7.0
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/local/include"
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/Library/Frameworks"
#include "..." search starts here:
#include <...> search starts here:
 /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo
 $WORK/b045
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0/include
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/System/Library/Frameworks (framework directory)
End of search list.
# runtime/cgo
+ SDK=iphoneos
++ xcrun -sdk iphoneos -show-sdk-path
+ SDK_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk
+ export IPHONEOS_DEPLOYMENT_TARGET=7.0
+ IPHONEOS_DEPLOYMENT_TARGET=7.0
++ xcrun -sdk iphoneos -find clang
+ CLANG=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang
+ exec /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -arch armv7 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -fPIC -marm -pthread -fno-caret-diagnostics -Qunused-arguments -fmessage-length=0 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b045=/tmp/go-build -gno-record-gcc-switches -fno-common -I $WORK/b045/ -g -O2 -Wall -Werror -o $WORK/b045/_x004.o -c gcc_darwin_arm.c
Apple LLVM version 10.0.0 (clang-1000.11.45.5)
Target: arm-apple-darwin17.7.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang" -cc1 -triple armv7-apple-ios7.0.0 -emit-obj -disable-free -disable-llvm-verifier -discard-value-names -main-file-name gcc_darwin_arm.c -mrelocation-model pic -pic-level 2 -mthread-model posix -mdisable-fp-elim -fno-strict-return -masm-verbose -faligned-alloc-unavailable -target-cpu generic -target-feature +soft-float-abi -target-abi apcs-gnu -mfloat-abi soft -fallow-half-arguments-and-returns -dwarf-column-info -debug-info-kind=standalone -dwarf-version=2 -debugger-tuning=lldb -target-linker-version 409.12 -v -coverage-notes-file $WORK/b045/_x004.gcno -resource-dir /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -I $WORK/b045/ -O2 -Wall -Werror -Wno-error=private-module -Wno-error=objc-messaging-id -Wno-error=vexing-parse -fdebug-compilation-dir /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b045=/tmp/go-build -ferror-limit 19 -fmessage-length 0 -pthread -stack-protector 1 -fblocks -fencode-extended-block-signature -fobjc-runtime=ios-7.0.0 -fsjlj-exceptions -fmax-type-align=16 -fno-common -fno-caret-diagnostics -fdiagnostics-show-option -vectorize-loops -vectorize-slp -o $WORK/b045/_x004.o -x c gcc_darwin_arm.c
clang -cc1 version 10.0.0 (clang-1000.11.45.5) default target x86_64-apple-darwin17.7.0
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/local/include"
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/Library/Frameworks"
#include "..." search starts here:
#include <...> search starts here:
 /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo
 $WORK/b045
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0/include
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/System/Library/Frameworks (framework directory)
End of search list.
# runtime/cgo
+ SDK=iphoneos
++ xcrun -sdk iphoneos -show-sdk-path
+ SDK_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk
+ export IPHONEOS_DEPLOYMENT_TARGET=7.0
+ IPHONEOS_DEPLOYMENT_TARGET=7.0
++ xcrun -sdk iphoneos -find clang
+ CLANG=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang
+ exec /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -arch armv7 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -fPIC -marm -pthread -fno-caret-diagnostics -Qunused-arguments -fmessage-length=0 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b045=/tmp/go-build -gno-record-gcc-switches -fno-common -I $WORK/b045/ -g -O2 -Wall -Werror -o $WORK/b045/_x005.o -c gcc_libinit.c
Apple LLVM version 10.0.0 (clang-1000.11.45.5)
Target: arm-apple-darwin17.7.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang" -cc1 -triple armv7-apple-ios7.0.0 -emit-obj -disable-free -disable-llvm-verifier -discard-value-names -main-file-name gcc_libinit.c -mrelocation-model pic -pic-level 2 -mthread-model posix -mdisable-fp-elim -fno-strict-return -masm-verbose -faligned-alloc-unavailable -target-cpu generic -target-feature +soft-float-abi -target-abi apcs-gnu -mfloat-abi soft -fallow-half-arguments-and-returns -dwarf-column-info -debug-info-kind=standalone -dwarf-version=2 -debugger-tuning=lldb -target-linker-version 409.12 -v -coverage-notes-file $WORK/b045/_x005.gcno -resource-dir /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -I $WORK/b045/ -O2 -Wall -Werror -Wno-error=private-module -Wno-error=objc-messaging-id -Wno-error=vexing-parse -fdebug-compilation-dir /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b045=/tmp/go-build -ferror-limit 19 -fmessage-length 0 -pthread -stack-protector 1 -fblocks -fencode-extended-block-signature -fobjc-runtime=ios-7.0.0 -fsjlj-exceptions -fmax-type-align=16 -fno-common -fno-caret-diagnostics -fdiagnostics-show-option -vectorize-loops -vectorize-slp -o $WORK/b045/_x005.o -x c gcc_libinit.c
clang -cc1 version 10.0.0 (clang-1000.11.45.5) default target x86_64-apple-darwin17.7.0
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/local/include"
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/Library/Frameworks"
#include "..." search starts here:
#include <...> search starts here:
 /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo
 $WORK/b045
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0/include
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/System/Library/Frameworks (framework directory)
End of search list.
# runtime/cgo
+ SDK=iphoneos
++ xcrun -sdk iphoneos -show-sdk-path
+ SDK_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk
+ export IPHONEOS_DEPLOYMENT_TARGET=7.0
+ IPHONEOS_DEPLOYMENT_TARGET=7.0
++ xcrun -sdk iphoneos -find clang
+ CLANG=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang
+ exec /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -arch armv7 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -fPIC -marm -pthread -fno-caret-diagnostics -Qunused-arguments -fmessage-length=0 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b045=/tmp/go-build -gno-record-gcc-switches -fno-common -I $WORK/b045/ -g -O2 -Wall -Werror -o $WORK/b045/_x006.o -c gcc_setenv.c
Apple LLVM version 10.0.0 (clang-1000.11.45.5)
Target: arm-apple-darwin17.7.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang" -cc1 -triple armv7-apple-ios7.0.0 -emit-obj -disable-free -disable-llvm-verifier -discard-value-names -main-file-name gcc_setenv.c -mrelocation-model pic -pic-level 2 -mthread-model posix -mdisable-fp-elim -fno-strict-return -masm-verbose -faligned-alloc-unavailable -target-cpu generic -target-feature +soft-float-abi -target-abi apcs-gnu -mfloat-abi soft -fallow-half-arguments-and-returns -dwarf-column-info -debug-info-kind=standalone -dwarf-version=2 -debugger-tuning=lldb -target-linker-version 409.12 -v -coverage-notes-file $WORK/b045/_x006.gcno -resource-dir /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -I $WORK/b045/ -O2 -Wall -Werror -Wno-error=private-module -Wno-error=objc-messaging-id -Wno-error=vexing-parse -fdebug-compilation-dir /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b045=/tmp/go-build -ferror-limit 19 -fmessage-length 0 -pthread -stack-protector 1 -fblocks -fencode-extended-block-signature -fobjc-runtime=ios-7.0.0 -fsjlj-exceptions -fmax-type-align=16 -fno-common -fno-caret-diagnostics -fdiagnostics-show-option -vectorize-loops -vectorize-slp -o $WORK/b045/_x006.o -x c gcc_setenv.c
clang -cc1 version 10.0.0 (clang-1000.11.45.5) default target x86_64-apple-darwin17.7.0
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/local/include"
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/Library/Frameworks"
#include "..." search starts here:
#include <...> search starts here:
 /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo
 $WORK/b045
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0/include
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/System/Library/Frameworks (framework directory)
End of search list.
# runtime/cgo
+ SDK=iphoneos
++ xcrun -sdk iphoneos -show-sdk-path
+ SDK_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk
+ export IPHONEOS_DEPLOYMENT_TARGET=7.0
+ IPHONEOS_DEPLOYMENT_TARGET=7.0
++ xcrun -sdk iphoneos -find clang
+ CLANG=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang
+ exec /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -arch armv7 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -fPIC -marm -pthread -fno-caret-diagnostics -Qunused-arguments -fmessage-length=0 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b045=/tmp/go-build -gno-record-gcc-switches -fno-common -I $WORK/b045/ -g -O2 -Wall -Werror -o $WORK/b045/_x007.o -c gcc_signal_darwin_lldb.c
Apple LLVM version 10.0.0 (clang-1000.11.45.5)
Target: arm-apple-darwin17.7.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang" -cc1 -triple armv7-apple-ios7.0.0 -emit-obj -disable-free -disable-llvm-verifier -discard-value-names -main-file-name gcc_signal_darwin_lldb.c -mrelocation-model pic -pic-level 2 -mthread-model posix -mdisable-fp-elim -fno-strict-return -masm-verbose -faligned-alloc-unavailable -target-cpu generic -target-feature +soft-float-abi -target-abi apcs-gnu -mfloat-abi soft -fallow-half-arguments-and-returns -dwarf-column-info -debug-info-kind=standalone -dwarf-version=2 -debugger-tuning=lldb -target-linker-version 409.12 -v -coverage-notes-file $WORK/b045/_x007.gcno -resource-dir /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -I $WORK/b045/ -O2 -Wall -Werror -Wno-error=private-module -Wno-error=objc-messaging-id -Wno-error=vexing-parse -fdebug-compilation-dir /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b045=/tmp/go-build -ferror-limit 19 -fmessage-length 0 -pthread -stack-protector 1 -fblocks -fencode-extended-block-signature -fobjc-runtime=ios-7.0.0 -fsjlj-exceptions -fmax-type-align=16 -fno-common -fno-caret-diagnostics -fdiagnostics-show-option -vectorize-loops -vectorize-slp -o $WORK/b045/_x007.o -x c gcc_signal_darwin_lldb.c
clang -cc1 version 10.0.0 (clang-1000.11.45.5) default target x86_64-apple-darwin17.7.0
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/local/include"
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/Library/Frameworks"
#include "..." search starts here:
#include <...> search starts here:
 /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo
 $WORK/b045
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0/include
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/System/Library/Frameworks (framework directory)
End of search list.
# runtime/cgo
+ SDK=iphoneos
++ xcrun -sdk iphoneos -show-sdk-path
+ SDK_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk
+ export IPHONEOS_DEPLOYMENT_TARGET=7.0
+ IPHONEOS_DEPLOYMENT_TARGET=7.0
++ xcrun -sdk iphoneos -find clang
+ CLANG=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang
+ exec /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -arch armv7 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -fPIC -marm -pthread -fno-caret-diagnostics -Qunused-arguments -fmessage-length=0 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b045=/tmp/go-build -gno-record-gcc-switches -fno-common -I $WORK/b045/ -g -O2 -Wall -Werror -o $WORK/b045/_x008.o -c gcc_traceback.c
Apple LLVM version 10.0.0 (clang-1000.11.45.5)
Target: arm-apple-darwin17.7.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang" -cc1 -triple armv7-apple-ios7.0.0 -emit-obj -disable-free -disable-llvm-verifier -discard-value-names -main-file-name gcc_traceback.c -mrelocation-model pic -pic-level 2 -mthread-model posix -mdisable-fp-elim -fno-strict-return -masm-verbose -faligned-alloc-unavailable -target-cpu generic -target-feature +soft-float-abi -target-abi apcs-gnu -mfloat-abi soft -fallow-half-arguments-and-returns -dwarf-column-info -debug-info-kind=standalone -dwarf-version=2 -debugger-tuning=lldb -target-linker-version 409.12 -v -coverage-notes-file $WORK/b045/_x008.gcno -resource-dir /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -I $WORK/b045/ -O2 -Wall -Werror -Wno-error=private-module -Wno-error=objc-messaging-id -Wno-error=vexing-parse -fdebug-compilation-dir /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b045=/tmp/go-build -ferror-limit 19 -fmessage-length 0 -pthread -stack-protector 1 -fblocks -fencode-extended-block-signature -fobjc-runtime=ios-7.0.0 -fsjlj-exceptions -fmax-type-align=16 -fno-common -fno-caret-diagnostics -fdiagnostics-show-option -vectorize-loops -vectorize-slp -o $WORK/b045/_x008.o -x c gcc_traceback.c
clang -cc1 version 10.0.0 (clang-1000.11.45.5) default target x86_64-apple-darwin17.7.0
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/local/include"
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/Library/Frameworks"
#include "..." search starts here:
#include <...> search starts here:
 /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo
 $WORK/b045
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0/include
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/System/Library/Frameworks (framework directory)
End of search list.
# runtime/cgo
+ SDK=iphoneos
++ xcrun -sdk iphoneos -show-sdk-path
+ SDK_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk
+ export IPHONEOS_DEPLOYMENT_TARGET=7.0
+ IPHONEOS_DEPLOYMENT_TARGET=7.0
++ xcrun -sdk iphoneos -find clang
+ CLANG=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang
+ exec /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -arch armv7 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -fPIC -marm -pthread -fno-caret-diagnostics -Qunused-arguments -fmessage-length=0 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b045=/tmp/go-build -gno-record-gcc-switches -fno-common -I $WORK/b045/ -g -O2 -Wall -Werror -o $WORK/b045/_x009.o -c gcc_util.c
Apple LLVM version 10.0.0 (clang-1000.11.45.5)
Target: arm-apple-darwin17.7.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang" -cc1 -triple armv7-apple-ios7.0.0 -emit-obj -disable-free -disable-llvm-verifier -discard-value-names -main-file-name gcc_util.c -mrelocation-model pic -pic-level 2 -mthread-model posix -mdisable-fp-elim -fno-strict-return -masm-verbose -faligned-alloc-unavailable -target-cpu generic -target-feature +soft-float-abi -target-abi apcs-gnu -mfloat-abi soft -fallow-half-arguments-and-returns -dwarf-column-info -debug-info-kind=standalone -dwarf-version=2 -debugger-tuning=lldb -target-linker-version 409.12 -v -coverage-notes-file $WORK/b045/_x009.gcno -resource-dir /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -I $WORK/b045/ -O2 -Wall -Werror -Wno-error=private-module -Wno-error=objc-messaging-id -Wno-error=vexing-parse -fdebug-compilation-dir /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b045=/tmp/go-build -ferror-limit 19 -fmessage-length 0 -pthread -stack-protector 1 -fblocks -fencode-extended-block-signature -fobjc-runtime=ios-7.0.0 -fsjlj-exceptions -fmax-type-align=16 -fno-common -fno-caret-diagnostics -fdiagnostics-show-option -vectorize-loops -vectorize-slp -o $WORK/b045/_x009.o -x c gcc_util.c
clang -cc1 version 10.0.0 (clang-1000.11.45.5) default target x86_64-apple-darwin17.7.0
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/local/include"
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/Library/Frameworks"
#include "..." search starts here:
#include <...> search starts here:
 /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo
 $WORK/b045
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0/include
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/System/Library/Frameworks (framework directory)
End of search list.
# runtime/cgo
+ SDK=iphoneos
++ xcrun -sdk iphoneos -show-sdk-path
+ SDK_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk
+ export IPHONEOS_DEPLOYMENT_TARGET=7.0
+ IPHONEOS_DEPLOYMENT_TARGET=7.0
++ xcrun -sdk iphoneos -find clang
+ CLANG=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang
+ exec /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -arch armv7 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -fPIC -marm -pthread -fno-caret-diagnostics -Qunused-arguments -fmessage-length=0 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b045=/tmp/go-build -gno-record-gcc-switches -fno-common -I $WORK/b045/ -g -O2 -Wall -Werror -o $WORK/b045/_x010.o -c gcc_arm.S
Apple LLVM version 10.0.0 (clang-1000.11.45.5)
Target: arm-apple-darwin17.7.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang" -cc1 -triple armv7-apple-ios7.0.0 -E -disable-free -disable-llvm-verifier -discard-value-names -main-file-name gcc_arm.S -mrelocation-model pic -pic-level 2 -mthread-model posix -mdisable-fp-elim -fno-strict-return -masm-verbose -faligned-alloc-unavailable -target-cpu generic -target-feature +soft-float-abi -target-abi apcs-gnu -mfloat-abi soft -fallow-half-arguments-and-returns -dwarf-column-info -debug-info-kind=standalone -dwarf-version=2 -debugger-tuning=lldb -target-linker-version 409.12 -v -coverage-notes-file $WORK/b045/_x010.gcno -resource-dir /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -I $WORK/b045/ -O2 -Wall -Werror -Wno-error=private-module -Wno-error=objc-messaging-id -Wno-error=vexing-parse -fdebug-compilation-dir /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b045=/tmp/go-build -ferror-limit 19 -fmessage-length 0 -pthread -stack-protector 1 -fblocks -fencode-extended-block-signature -fobjc-runtime=ios-7.0.0 -fsjlj-exceptions -fmax-type-align=16 -fno-common -fno-caret-diagnostics -fdiagnostics-show-option -vectorize-loops -vectorize-slp -o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/gcc_arm-bfa8c6.s -x assembler-with-cpp gcc_arm.S
clang -cc1 version 10.0.0 (clang-1000.11.45.5) default target x86_64-apple-darwin17.7.0
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/local/include"
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/Library/Frameworks"
#include "..." search starts here:
#include <...> search starts here:
 /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo
 $WORK/b045
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0/include
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/System/Library/Frameworks (framework directory)
End of search list.
 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang" -cc1as -triple armv7-apple-ios7.0.0 -filetype obj -main-file-name gcc_arm.S -target-cpu generic -I /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -I $WORK/b045/ -fdebug-compilation-dir /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -dwarf-debug-producer Apple LLVM version 10.0.0 (clang-1000.11.45.5) -I /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -I $WORK/b045/ -debug-info-kind=limited -dwarf-version=2 -mrelocation-model pic -mllvm -arm-add-build-attributes -o $WORK/b045/_x010.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/gcc_arm-bfa8c6.s
# runtime/cgo
+ SDK=iphoneos
++ xcrun -sdk iphoneos -show-sdk-path
+ SDK_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk
+ export IPHONEOS_DEPLOYMENT_TARGET=7.0
+ IPHONEOS_DEPLOYMENT_TARGET=7.0
++ xcrun -sdk iphoneos -find clang
+ CLANG=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang
+ exec /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -arch armv7 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -fPIC -marm -pthread -fno-caret-diagnostics -Qunused-arguments -fmessage-length=0 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b045=/tmp/go-build -gno-record-gcc-switches -fno-common -I $WORK/b045/ -g -O2 -Wall -Werror -o $WORK/b045/_cgo_main.o -c _cgo_main.c
Apple LLVM version 10.0.0 (clang-1000.11.45.5)
Target: arm-apple-darwin17.7.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang" -cc1 -triple armv7-apple-ios7.0.0 -emit-obj -disable-free -disable-llvm-verifier -discard-value-names -main-file-name _cgo_main.c -mrelocation-model pic -pic-level 2 -mthread-model posix -mdisable-fp-elim -fno-strict-return -masm-verbose -faligned-alloc-unavailable -target-cpu generic -target-feature +soft-float-abi -target-abi apcs-gnu -mfloat-abi soft -fallow-half-arguments-and-returns -dwarf-column-info -debug-info-kind=standalone -dwarf-version=2 -debugger-tuning=lldb -target-linker-version 409.12 -v -coverage-notes-file $WORK/b045/_cgo_main.gcno -resource-dir /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo -I $WORK/b045/ -O2 -Wall -Werror -Wno-error=private-module -Wno-error=objc-messaging-id -Wno-error=vexing-parse -fdebug-compilation-dir $WORK/b045 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b045=/tmp/go-build -ferror-limit 19 -fmessage-length 0 -pthread -stack-protector 1 -fblocks -fencode-extended-block-signature -fobjc-runtime=ios-7.0.0 -fsjlj-exceptions -fmax-type-align=16 -fno-common -fno-caret-diagnostics -fdiagnostics-show-option -vectorize-loops -vectorize-slp -o $WORK/b045/_cgo_main.o -x c _cgo_main.c
clang -cc1 version 10.0.0 (clang-1000.11.45.5) default target x86_64-apple-darwin17.7.0
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/local/include"
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/Library/Frameworks"
#include "..." search starts here:
#include <...> search starts here:
 /usr/local/Cellar/go/1.12.9/libexec/src/runtime/cgo
 $WORK/b045
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0/include
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/System/Library/Frameworks (framework directory)
End of search list.
# net
+ SDK=iphoneos
++ xcrun -sdk iphoneos -show-sdk-path
+ SDK_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk
+ export IPHONEOS_DEPLOYMENT_TARGET=7.0
+ IPHONEOS_DEPLOYMENT_TARGET=7.0
++ xcrun -sdk iphoneos -find clang
+ CLANG=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang
+ exec /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -arch armv7 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/net -fPIC -marm -pthread -fno-caret-diagnostics -Qunused-arguments -fmessage-length=0 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b038=/tmp/go-build -gno-record-gcc-switches -fno-common -o $WORK/b038/_cgo_.o $WORK/b038/_cgo_main.o $WORK/b038/_x001.o $WORK/b038/_x002.o $WORK/b038/_x003.o $WORK/b038/_x004.o $WORK/b038/_x005.o -g -O2
Apple LLVM version 10.0.0 (clang-1000.11.45.5)
Target: arm-apple-darwin17.7.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ld" -demangle -lto_library /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libLTO.dylib -dynamic -arch armv7 -iphoneos_version_min 7.0.0 -syslibroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -o $WORK/b038/_cgo_.o $WORK/b038/_cgo_main.o $WORK/b038/_x001.o $WORK/b038/_x002.o $WORK/b038/_x003.o $WORK/b038/_x004.o $WORK/b038/_x005.o -lSystem /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0/lib/darwin/libclang_rt.ios.a
# net
+ SDK=iphoneos
++ xcrun -sdk iphoneos -show-sdk-path
+ SDK_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk
+ export IPHONEOS_DEPLOYMENT_TARGET=7.0
+ IPHONEOS_DEPLOYMENT_TARGET=7.0
++ xcrun -sdk iphoneos -find clang
+ CLANG=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang
+ exec /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -arch armv7 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/net -fPIC -marm -pthread -fno-caret-diagnostics -Qunused-arguments -fmessage-length=0 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b038=/tmp/go-build -gno-record-gcc-switches -fno-common -I $WORK/b038/ -g -O2 -o $WORK/b038/_x001.o -c _cgo_export.c
Apple LLVM version 10.0.0 (clang-1000.11.45.5)
Target: arm-apple-darwin17.7.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang" -cc1 -triple armv7-apple-ios7.0.0 -emit-obj -disable-free -disable-llvm-verifier -discard-value-names -main-file-name _cgo_export.c -mrelocation-model pic -pic-level 2 -mthread-model posix -mdisable-fp-elim -fno-strict-return -masm-verbose -faligned-alloc-unavailable -target-cpu generic -target-feature +soft-float-abi -target-abi apcs-gnu -mfloat-abi soft -fallow-half-arguments-and-returns -dwarf-column-info -debug-info-kind=standalone -dwarf-version=2 -debugger-tuning=lldb -target-linker-version 409.12 -v -coverage-notes-file $WORK/b038/_x001.gcno -resource-dir /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/net -I $WORK/b038/ -O2 -fdebug-compilation-dir $WORK/b038 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b038=/tmp/go-build -ferror-limit 19 -fmessage-length 0 -pthread -stack-protector 1 -fblocks -fencode-extended-block-signature -fobjc-runtime=ios-7.0.0 -fsjlj-exceptions -fmax-type-align=16 -fno-common -fno-caret-diagnostics -fdiagnostics-show-option -vectorize-loops -vectorize-slp -o $WORK/b038/_x001.o -x c _cgo_export.c
clang -cc1 version 10.0.0 (clang-1000.11.45.5) default target x86_64-apple-darwin17.7.0
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/local/include"
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/Library/Frameworks"
#include "..." search starts here:
#include <...> search starts here:
 /usr/local/Cellar/go/1.12.9/libexec/src/net
 $WORK/b038
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0/include
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/System/Library/Frameworks (framework directory)
End of search list.
# net
+ SDK=iphoneos
++ xcrun -sdk iphoneos -show-sdk-path
+ SDK_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk
+ export IPHONEOS_DEPLOYMENT_TARGET=7.0
+ IPHONEOS_DEPLOYMENT_TARGET=7.0
++ xcrun -sdk iphoneos -find clang
+ CLANG=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang
+ exec /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -arch armv7 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/net -fPIC -marm -pthread -fno-caret-diagnostics -Qunused-arguments -fmessage-length=0 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b038=/tmp/go-build -gno-record-gcc-switches -fno-common -I $WORK/b038/ -g -O2 -o $WORK/b038/_x002.o -c cgo_bsd.cgo2.c
Apple LLVM version 10.0.0 (clang-1000.11.45.5)
Target: arm-apple-darwin17.7.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang" -cc1 -triple armv7-apple-ios7.0.0 -emit-obj -disable-free -disable-llvm-verifier -discard-value-names -main-file-name cgo_bsd.cgo2.c -mrelocation-model pic -pic-level 2 -mthread-model posix -mdisable-fp-elim -fno-strict-return -masm-verbose -faligned-alloc-unavailable -target-cpu generic -target-feature +soft-float-abi -target-abi apcs-gnu -mfloat-abi soft -fallow-half-arguments-and-returns -dwarf-column-info -debug-info-kind=standalone -dwarf-version=2 -debugger-tuning=lldb -target-linker-version 409.12 -v -coverage-notes-file $WORK/b038/_x002.gcno -resource-dir /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/net -I $WORK/b038/ -O2 -fdebug-compilation-dir $WORK/b038 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b038=/tmp/go-build -ferror-limit 19 -fmessage-length 0 -pthread -stack-protector 1 -fblocks -fencode-extended-block-signature -fobjc-runtime=ios-7.0.0 -fsjlj-exceptions -fmax-type-align=16 -fno-common -fno-caret-diagnostics -fdiagnostics-show-option -vectorize-loops -vectorize-slp -o $WORK/b038/_x002.o -x c cgo_bsd.cgo2.c
clang -cc1 version 10.0.0 (clang-1000.11.45.5) default target x86_64-apple-darwin17.7.0
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/local/include"
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/Library/Frameworks"
#include "..." search starts here:
#include <...> search starts here:
 /usr/local/Cellar/go/1.12.9/libexec/src/net
 $WORK/b038
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0/include
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/System/Library/Frameworks (framework directory)
End of search list.
# net
+ SDK=iphoneos
++ xcrun -sdk iphoneos -show-sdk-path
+ SDK_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk
+ export IPHONEOS_DEPLOYMENT_TARGET=7.0
+ IPHONEOS_DEPLOYMENT_TARGET=7.0
++ xcrun -sdk iphoneos -find clang
+ CLANG=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang
+ exec /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -arch armv7 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/net -fPIC -marm -pthread -fno-caret-diagnostics -Qunused-arguments -fmessage-length=0 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b038=/tmp/go-build -gno-record-gcc-switches -fno-common -I $WORK/b038/ -g -O2 -o $WORK/b038/_x003.o -c cgo_resnew.cgo2.c
Apple LLVM version 10.0.0 (clang-1000.11.45.5)
Target: arm-apple-darwin17.7.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang" -cc1 -triple armv7-apple-ios7.0.0 -emit-obj -disable-free -disable-llvm-verifier -discard-value-names -main-file-name cgo_resnew.cgo2.c -mrelocation-model pic -pic-level 2 -mthread-model posix -mdisable-fp-elim -fno-strict-return -masm-verbose -faligned-alloc-unavailable -target-cpu generic -target-feature +soft-float-abi -target-abi apcs-gnu -mfloat-abi soft -fallow-half-arguments-and-returns -dwarf-column-info -debug-info-kind=standalone -dwarf-version=2 -debugger-tuning=lldb -target-linker-version 409.12 -v -coverage-notes-file $WORK/b038/_x003.gcno -resource-dir /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/net -I $WORK/b038/ -O2 -fdebug-compilation-dir $WORK/b038 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b038=/tmp/go-build -ferror-limit 19 -fmessage-length 0 -pthread -stack-protector 1 -fblocks -fencode-extended-block-signature -fobjc-runtime=ios-7.0.0 -fsjlj-exceptions -fmax-type-align=16 -fno-common -fno-caret-diagnostics -fdiagnostics-show-option -vectorize-loops -vectorize-slp -o $WORK/b038/_x003.o -x c cgo_resnew.cgo2.c
clang -cc1 version 10.0.0 (clang-1000.11.45.5) default target x86_64-apple-darwin17.7.0
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/local/include"
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/Library/Frameworks"
#include "..." search starts here:
#include <...> search starts here:
 /usr/local/Cellar/go/1.12.9/libexec/src/net
 $WORK/b038
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0/include
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/System/Library/Frameworks (framework directory)
End of search list.
# net
+ SDK=iphoneos
++ xcrun -sdk iphoneos -show-sdk-path
+ SDK_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk
+ export IPHONEOS_DEPLOYMENT_TARGET=7.0
+ IPHONEOS_DEPLOYMENT_TARGET=7.0
++ xcrun -sdk iphoneos -find clang
+ CLANG=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang
+ exec /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -arch armv7 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/net -fPIC -marm -pthread -fno-caret-diagnostics -Qunused-arguments -fmessage-length=0 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b038=/tmp/go-build -gno-record-gcc-switches -fno-common -I $WORK/b038/ -g -O2 -o $WORK/b038/_x004.o -c cgo_sockold.cgo2.c
Apple LLVM version 10.0.0 (clang-1000.11.45.5)
Target: arm-apple-darwin17.7.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang" -cc1 -triple armv7-apple-ios7.0.0 -emit-obj -disable-free -disable-llvm-verifier -discard-value-names -main-file-name cgo_sockold.cgo2.c -mrelocation-model pic -pic-level 2 -mthread-model posix -mdisable-fp-elim -fno-strict-return -masm-verbose -faligned-alloc-unavailable -target-cpu generic -target-feature +soft-float-abi -target-abi apcs-gnu -mfloat-abi soft -fallow-half-arguments-and-returns -dwarf-column-info -debug-info-kind=standalone -dwarf-version=2 -debugger-tuning=lldb -target-linker-version 409.12 -v -coverage-notes-file $WORK/b038/_x004.gcno -resource-dir /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/net -I $WORK/b038/ -O2 -fdebug-compilation-dir $WORK/b038 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b038=/tmp/go-build -ferror-limit 19 -fmessage-length 0 -pthread -stack-protector 1 -fblocks -fencode-extended-block-signature -fobjc-runtime=ios-7.0.0 -fsjlj-exceptions -fmax-type-align=16 -fno-common -fno-caret-diagnostics -fdiagnostics-show-option -vectorize-loops -vectorize-slp -o $WORK/b038/_x004.o -x c cgo_sockold.cgo2.c
clang -cc1 version 10.0.0 (clang-1000.11.45.5) default target x86_64-apple-darwin17.7.0
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/local/include"
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/Library/Frameworks"
#include "..." search starts here:
#include <...> search starts here:
 /usr/local/Cellar/go/1.12.9/libexec/src/net
 $WORK/b038
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0/include
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/System/Library/Frameworks (framework directory)
End of search list.
# net
+ SDK=iphoneos
++ xcrun -sdk iphoneos -show-sdk-path
+ SDK_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk
+ export IPHONEOS_DEPLOYMENT_TARGET=7.0
+ IPHONEOS_DEPLOYMENT_TARGET=7.0
++ xcrun -sdk iphoneos -find clang
+ CLANG=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang
+ exec /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -arch armv7 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/net -fPIC -marm -pthread -fno-caret-diagnostics -Qunused-arguments -fmessage-length=0 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b038=/tmp/go-build -gno-record-gcc-switches -fno-common -I $WORK/b038/ -g -O2 -o $WORK/b038/_x005.o -c cgo_unix.cgo2.c
Apple LLVM version 10.0.0 (clang-1000.11.45.5)
Target: arm-apple-darwin17.7.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang" -cc1 -triple armv7-apple-ios7.0.0 -emit-obj -disable-free -disable-llvm-verifier -discard-value-names -main-file-name cgo_unix.cgo2.c -mrelocation-model pic -pic-level 2 -mthread-model posix -mdisable-fp-elim -fno-strict-return -masm-verbose -faligned-alloc-unavailable -target-cpu generic -target-feature +soft-float-abi -target-abi apcs-gnu -mfloat-abi soft -fallow-half-arguments-and-returns -dwarf-column-info -debug-info-kind=standalone -dwarf-version=2 -debugger-tuning=lldb -target-linker-version 409.12 -v -coverage-notes-file $WORK/b038/_x005.gcno -resource-dir /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/net -I $WORK/b038/ -O2 -fdebug-compilation-dir $WORK/b038 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b038=/tmp/go-build -ferror-limit 19 -fmessage-length 0 -pthread -stack-protector 1 -fblocks -fencode-extended-block-signature -fobjc-runtime=ios-7.0.0 -fsjlj-exceptions -fmax-type-align=16 -fno-common -fno-caret-diagnostics -fdiagnostics-show-option -vectorize-loops -vectorize-slp -o $WORK/b038/_x005.o -x c cgo_unix.cgo2.c
clang -cc1 version 10.0.0 (clang-1000.11.45.5) default target x86_64-apple-darwin17.7.0
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/local/include"
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/Library/Frameworks"
#include "..." search starts here:
#include <...> search starts here:
 /usr/local/Cellar/go/1.12.9/libexec/src/net
 $WORK/b038
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0/include
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/System/Library/Frameworks (framework directory)
End of search list.
# net
+ SDK=iphoneos
++ xcrun -sdk iphoneos -show-sdk-path
+ SDK_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk
+ export IPHONEOS_DEPLOYMENT_TARGET=7.0
+ IPHONEOS_DEPLOYMENT_TARGET=7.0
++ xcrun -sdk iphoneos -find clang
+ CLANG=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang
+ exec /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -arch armv7 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/net -fPIC -marm -pthread -fno-caret-diagnostics -Qunused-arguments -fmessage-length=0 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b038=/tmp/go-build -gno-record-gcc-switches -fno-common -I $WORK/b038/ -g -O2 -o $WORK/b038/_cgo_main.o -c _cgo_main.c
Apple LLVM version 10.0.0 (clang-1000.11.45.5)
Target: arm-apple-darwin17.7.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang" -cc1 -triple armv7-apple-ios7.0.0 -emit-obj -disable-free -disable-llvm-verifier -discard-value-names -main-file-name _cgo_main.c -mrelocation-model pic -pic-level 2 -mthread-model posix -mdisable-fp-elim -fno-strict-return -masm-verbose -faligned-alloc-unavailable -target-cpu generic -target-feature +soft-float-abi -target-abi apcs-gnu -mfloat-abi soft -fallow-half-arguments-and-returns -dwarf-column-info -debug-info-kind=standalone -dwarf-version=2 -debugger-tuning=lldb -target-linker-version 409.12 -v -coverage-notes-file $WORK/b038/_cgo_main.gcno -resource-dir /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -I /usr/local/Cellar/go/1.12.9/libexec/src/net -I $WORK/b038/ -O2 -fdebug-compilation-dir $WORK/b038 -fdebug-prefix-map=/var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-build743785771/b038=/tmp/go-build -ferror-limit 19 -fmessage-length 0 -pthread -stack-protector 1 -fblocks -fencode-extended-block-signature -fobjc-runtime=ios-7.0.0 -fsjlj-exceptions -fmax-type-align=16 -fno-common -fno-caret-diagnostics -fdiagnostics-show-option -vectorize-loops -vectorize-slp -o $WORK/b038/_cgo_main.o -x c _cgo_main.c
clang -cc1 version 10.0.0 (clang-1000.11.45.5) default target x86_64-apple-darwin17.7.0
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/local/include"
ignoring nonexistent directory "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/Library/Frameworks"
#include "..." search starts here:
#include <...> search starts here:
 /usr/local/Cellar/go/1.12.9/libexec/src/net
 $WORK/b038
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0/include
 /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/usr/include
 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk/System/Library/Frameworks (framework directory)
End of search list.
# github.com/mtojek/fileserver
+ SDK=iphoneos
++ xcrun -sdk iphoneos -show-sdk-path
+ SDK_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk
+ export IPHONEOS_DEPLOYMENT_TARGET=7.0
+ IPHONEOS_DEPLOYMENT_TARGET=7.0
++ xcrun -sdk iphoneos -find clang
+ CLANG=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang
+ exec /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -arch armv7 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -marm -Wl,-headerpad,1144 -Wl,-no_pie -Wl,-pagezero_size,4000000 -o $WORK/b001/exe/a.out -Qunused-arguments /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/go.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000000.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000001.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000002.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000003.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000004.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000005.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000006.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000007.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000008.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000009.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000010.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000011.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000012.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000013.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000014.o -g -O2 -g -O2 -framework CoreFoundation -no-pie
Apple LLVM version 10.0.0 (clang-1000.11.45.5)
Target: arm-apple-darwin17.7.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ld" -demangle -lto_library /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libLTO.dylib -dynamic -arch armv7 -iphoneos_version_min 7.0.0 -syslibroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk -o $WORK/b001/exe/a.out -headerpad 1144 -no_pie -pagezero_size 4000000 /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/go.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000000.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000001.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000002.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000003.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000004.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000005.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000006.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000007.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000008.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000009.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000010.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000011.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000012.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000013.o /var/folders/5g/g6mmmyfn3sn9cgf6scls112r0000gn/T/go-link-299749489/000014.o -framework CoreFoundation -lSystem /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0/lib/darwin/libclang_rt.ios.a
ARCH=arm jtool --sign --inplace --ent tools/ent.xml bin/application
```
