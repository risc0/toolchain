#!/bin/bash

pushd riscv-gnu-toolchain

./configure --with-cmodel=medany --disable-gdb --with-arch=rv32im --with-abi=ilp32
make

popd
