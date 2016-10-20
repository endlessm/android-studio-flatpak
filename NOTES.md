Packaging Notes
===============

Both JDK 1.6 and 1.8 are needed for building. The `.deb` binary packages are
readily available and binary compatible with our userland, so we can just fetch
and unpack them under a rootfs directory. The `Makefile`, which is used
*inside* the Flatpak build sandbox, defines the variables needed to point the
build system to the two JDKs.
