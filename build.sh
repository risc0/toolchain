#!/bin/bash

pushd crosstool-ng

./bootstrap
./configure --enable-local
make

popd
