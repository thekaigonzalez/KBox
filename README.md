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