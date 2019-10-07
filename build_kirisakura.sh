#!/bin/bash
echo
echo "Clean Build Directory"
echo
make clean && make mrproper
echo
echo "Issue Build Commands"
echo
mkdir -p out
export ARCH=arm64
export SUBARCH=arm64
export CLANG_PATH=~/aospa/prebuilts/clang/host/linux-x86/clang-r353983c/bin
export PATH=${CLANG_PATH}:${PATH}
export CLANG_TRIPLE=aarch64-linux-gnu-
export CROSS_COMPILE=~/aospa/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
export CROSS_COMPILE_ARM32=~/aospa/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-
echo
echo "Set DEFCONFIG"
echo
make CC=clang O=out kirisakura_wahoo_defconfig
echo
echo "Build The Good Stuff"
echo
make CC=clang O=out -j16

