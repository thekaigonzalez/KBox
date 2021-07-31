.PHONY: all

all: bios
	gcc src/filesystem.c -llua5.4 -lreadline -fPIC -shared -o ./deps/filesystem.so
	luac -o system/sym/OK src/symbols/OK.lua



# Builds all dependencies
build-directories:
	mkdir system
	mkdir system/sym
	mkdir deps
	mkdir system/boot


system-boot: crub2
	mkdir system/boot

crub2-setup: crub2 crub2-files

build-deps: all
	tar -xf ./libs.tar.gz
	cp ./libhttp.so ./deps/
	cp ./libposix.so ./deps/
	cp ./libsfs.so ./deps/
	cp ./libfs.so ./deps/
	cp ./libsyscalls.so ./deps/
	cp ./lua-dev.so ./deps/
	cp ./libmemio.so ./deps/
	cp ./libhttp.so ./deps/
	cp ./symlib.so ./deps/
	rm ./libposix.so
	rm ./libsfs.so
	rm ./libfs.so
	rm ./libsyscalls.so
	rm ./lua-dev.so
	rm ./libmemio.so
	rm ./libhttp.so
	rm ./symlib.so


bios: lua-binary
	gcc src/BIOS.c -lncurses -lcurses -llua5.4 -lreadline -fPIC -shared -o deps/libbioshandlers.so


lua-binary: crub2
	luac -o system/boot/crub2 src/crub2/fsc.main
	luac -o system/boot/initrd src/crub2/initrd.imrc

crub2: crub2-files
	gcc ./src/crub.c -llua5.4 -o ./crub

crub2-mkdir: crub2
	mkdir system/crub

crub2-files:
	luac -o ./src/crub2/images/clear.dimg ./src/crub2/text/clear.lua

initg-swap:
	luac -o ./system/boot/initg ./src/crub2/system.imrc
bootmgr-build-dirs:
	mkdir ./system/KEFI/Bootmanager
bootmgr-build:
	luac -o ./system/KEFI/Bootmanager/boot.dsi ./src/crub2/system.imrc
bootmgr-setup: bootmgr-build

setup: crub2-mkdir crub2 build-directories build-deps system-boot lua-binary bios crub2-files bootmgr-build bootmgr-build-dirs