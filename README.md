# riscv32im Toolchain

The toolchain produced by this repository is meant for a RISC-V 32-bit ISA with the core integer and multiplication extension.

## Prerequisites

Based on https://github.com/riscv-collab/riscv-gnu-toolchain.

### macOS

```bash
brew install python3 gawk gnu-sed gmp mpfr libmpc isl zlib expat texinfo flock
```

Make sure you are building on a case-sensitive volume.

### Linux

```bash
sudo apt-get install autoconf automake autotools-dev curl python3 python3-pip libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev ninja-build git cmake libglib2.0-dev
```

## Build

```bash
./build.sh $HOST
```

`HOST` can be one of:
* riscv32im-linux-x86_64
* riscv32im-osx-arm64
* riscv32im-osx-x86_64

A final tarball lands in `.dist/$HOST`. For example:

```bash
$ ls .dist
riscv32im-osx-arm64
riscv32im-osx-arm64.tar.xz
```

# Building with GDB

1. Replace `--disable-gdb` with `--enable-gdb` in build.sh
2. Set `GDB_TARGET_FLAGS_EXTRA=--with-python=no` to disable python support
3. If on macOS (the paths may be different for x86_64):
    - set `CFLAGS=-I/opt/homebrew/include`
    - set `CPPFLAGS=-I/opt/homebrew/include`
    - set `LDFLAGS=-L/opt/homebrew/lib`
    - apply this patch:
    ```sh
    cd riscv-gnu-toolchain/gdb
    curl "https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=fe26aa95336c0ddec01b407b990caf2c758fd93f;hp=0a43fbaa23a5eaf4254a51fa43ef61a6e28c9bd6" | patch -p1
    ```
4. `./build.sh $HOST`
5. Create the tar.xz:
```sh
cd riscv-gnu-toolchain/build-gdb-newlib/gdb
mv gdb riscv32im-gdb
tar cvJf "riscv32im-gdb-${HOST#*-}.tar.xz" riscv32im-gdb
```
