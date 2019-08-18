# go-build-for-ios
Build Go applications for IOS

This repository contains a PoC that lets you build any Go application for IOS platform. Cross-compilation, tested using OSX (iPhoneOS SDK required) and 32-bit device (iPad 2).

Requirements:
* iPhoneOS SDK
* Jailbreak on the target IOS device
* OpenSSH running on the target.

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
... to build a web terminal application for IOS.

## Deployment

To build, sign the binary and deploy via SSH, execute the following command:

```bash
$ make deploy
```
