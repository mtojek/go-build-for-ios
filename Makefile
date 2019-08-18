PROJECT ?= github.com/mtojek/fileserver # demo project

sign: build
	ARCH=arm jtool --sign --inplace --ent tools/ent.xml bin/application

build:
	mkdir -p bin
	GOARM=7 CGO_ENABLED=1 GOARCH=arm \
	CC=`pwd`/tools/clangwrap.sh \
	CXX=`pwd`/tools/clangwrap.sh \
	go build -a -o bin/application $(PROJECT)

deploy: sign
	scp bin/application root@192.168.0.18:/tmp/
