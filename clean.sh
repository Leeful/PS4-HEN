#!/bin/bash

pushd source/tool
make clean
popd

pushd source/kpayload
make clean
popd

pushd source/installer
make clean
popd

rm -f PS4-HEN-v2.0.bin PS4-HEN-v2.0.html source/payload.js
