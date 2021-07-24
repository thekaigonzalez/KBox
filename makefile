all:
	gcc src/filesystem.c -llua5.3 -fPIC -shared -o ./deps/filesystem.so
	luac -o system/sym/OK src/symbols/OK.lua