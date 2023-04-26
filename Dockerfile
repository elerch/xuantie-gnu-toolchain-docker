# need bookworm for most up to date cmake
FROM debian:bookworm as build

RUN true && \
    apt-get update && \
    apt-get install -y \
        autoconf \
        automake \
        autotools-dev \
        curl \
        python3 \
        libmpc-dev \
        libmpfr-dev \
        libgmp-dev \
        gawk \
        build-essential \
        bison \
        flex \
        texinfo \
        gperf \
        libtool \
        patchutils \
        bc \
        zlib1g-dev \
        libexpat-dev \
        git \
        && \
    git clone --recurse-submodules https://github.com/T-head-Semi/xuantie-gnu-toolchain && \
    cd xuantie-gnu-toolchain && \
    ./configure --prefix=/usr/local --enable-multilib && \
    make -j8 && \
    cd / && \
    rm -rf xuantie-gnu-toolchain && \
    apt-get remove -y \
        autoconf \
        automake \
        autotools-dev \
        curl \
        python3 \
        libmpc-dev \
        libmpfr-dev \
        libgmp-dev \
        gawk \
        build-essential \
        bison \
        flex \
        texinfo \
        gperf \
        libtool \
        patchutils \
        bc \
        zlib1g-dev \
        libexpat-dev \
        git \
        && \
    apt-get clean && \
    true

FROM debian:bookworm

COPY --from=build /usr/local/bin/ /usr/local/bin/
COPY --from=build /usr/local/riscv64-unknown-elf/ /usr/local/riscv64-unknown-elf/
COPY --from=build /usr/local/libexec/ /usr/local/libexec/
COPY --from=build /usr/local/lib/ /usr/local/lib/

RUN true && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        make \
        cmake \
        libmpc3 \
        && \
    apt-get clean && \
    true
