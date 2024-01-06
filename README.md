# riscv32im Toolchain

The toolchain produced by this repository is meant for a RISC-V 32-bit ISA with the core integer and multiplication extension.

## Prerequisites

Based on https://github.com/riscv-collab/riscv-gnu-toolchain.

### macOS

```bash
brew install python3 gawk gnu-sed gmp mpfr libmpc isl zlib expat texinfo flock
```

### Linux

```bash
sudo apt-get install autoconf automake autotools-dev curl python3 python3-pip libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev ninja-build git cmake libglib2.0-dev
```

## Build

```bash
./build.sh
```
