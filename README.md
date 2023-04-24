Xuantie GNU Toolchain Docker Image
==================================

This dockerfile will build the image based on the default branch of
https://github.com/T-head-Semi/xuantie-gnu-toolchain

There is a completed docker image you can pull

`docker pull git.lerch.org/lobo/xuantie-gnu-toolchain:b181cea`

As of b181cea, it appears no T-Head proprietary binaries are involved with the
build process

This takes 1hr 9min on a 16 core Intel(R) Xeon(R) Platinum 8375C CPU @ 2.90GHz.
Recommend at least 16GB RAM to build.

The image is based on debian bookworm, which is still in testing at the time
of writing. The image also adds cmake to this toolkit. This allows for
downstream usage of [Bouffalo Lab SDK](https://github.com/bouffalolab/bouffalo_sdk/)
which requires a fairly modern version of cmake.
