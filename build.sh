#!/bin/bash

CFG=$1

pushd crosstool-ng

./bootstrap
./configure --enable-local
make

popd

cd $CFG

../../crosstool-ng/ct-ng build
