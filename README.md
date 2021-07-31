# KBox

KBox is (planned to be) a user maintained MS-DOS based
command line interface running on the lua VM.

KBox uses multiple libraries from FreeKSD, Kux, and other
non-open projects.

Contains a pure C backend and Lua frontend.

## Dependencies
Requires a "deps" directory and all FreeKSD Headers (Most recent)

You can install those using the makefile, which builds FreeKSD and copies
the binaries over to a `deps` directory.

```
$ make build-deps
```