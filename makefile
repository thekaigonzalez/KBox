all:
	gcc src/filesystem.c -llua5.4 -lreadline -fPIC -shared -o ./deps/filesystem.so
	luac -o system/sym/OK src/symbols/OK.lua


# Builds all dependencies
build-directories:
	mkdir system
	mkdir system/sym
	mkdir deps

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
