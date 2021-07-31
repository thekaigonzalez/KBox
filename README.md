# KBox

KBox is a user maintained MS-DOS based
command line interface running on the lua VM.

KBox uses multiple libraries from FreeKSD which contain Lua
helper functions, and are licensed under the GNU AFFERO General 
Public License. It also uses its own custom library for serialization. and many data handling.

Contains a pure C backend and Lua frontend.

## Dependencies
Requires a "deps" directory and all FreeKSD Headers (Most recent)

You can install those using the makefile, which builds FreeKSD and copies
the binaries over to a `deps` directory.

```
$ make build-directories
$ make build-deps
```

## Extensions

### .dimg
A Disk Image file format. A Hard-Code of the Lua binary format. Specifically for CRUB commands.

### .imrc
Code for a disk image instead of for the base system. Still ran as lua code, just known to usually serialize code
for specific disks.

## Files

### crub2
the `crub2` file is the loader for the crub2 boot loader.

### initrd 

the `initrd` file is the loader extension to initialize a specific bootloader.
For specific system swap drivers, use the initgr

### initgr

Initializes