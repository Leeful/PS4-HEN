#!/bin/bash

set -e

pushd source/tool
make
popd

pushd source/kpayload
make
popd

pushd source/installer
make
popd

rm -f PS4-HEN-v1.6.bin PS4-HEN-v1.6.html

cp source/installer/installer.bin PS4-HEN-v1.6.bin

source/tool/bin2js PS4-HEN-v1.6.bin > source/payload.js

sed "s/###/$(cat source/payload.js)/" source/exploit.template > PS4-HEN-v1.6.html
sed -i 's/PS4-HEN/PS4-HEN v1.6/g' PS4-HEN-v1.6.html
