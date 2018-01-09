#!/bin/sh

make all ARCH=arm
./mkbl2 spl/u-boot-spl.bin bl2.bin 14336
