#!/bin/bash

HOST=$1
PREFIX=$PWD/.dist/$HOST

pushd riscv-gnu-toolchain

./configure --prefix=$PREFIX --with-cmodel=medany --disable-gdb --with-arch=rv32im --with-abi=ilp32
make -j$(nproc 2>/dev/null || sysctl -n hw.logicalcpu)

popd

pushd .dist

tar cvJf $HOST.tar.xz $HOST

popd
