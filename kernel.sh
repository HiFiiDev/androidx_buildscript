#!/bin/sh
#
# PACROM Kernel Build Script
#
# This file is subject to the terms and conditions of the GNU General Public
# License.  See the file "COPYING" in the main directory of this archive
# for more details.
#
# Copyright (C) 2019 by PACROM
#
echo "Let's begin by setting up the arch"

#export arch
export ARCH=arm64

#export lz4
export LZ4_PREBUILTS_BIN=~/lineage/prebuilts/misc/linux-x86/lz4

#export cc
export CROSS_COMPILE=~/lineage/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-

#export cc32
export CROSS_COMPILE_ARM32=~/lineage/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-

#make proper
make mrproper

#make the defconfig
make marlin_defconfig

#make the kernel
make

echo "kernel build complete - now let's move it!"
#remove the old one
rm -rf ~/lineage/device/google/marlin-kernel/Image.lz4-dtb

#copy the new one
cp ~/lineage/kernel/google/marlin/arch/arm64/boot/Image.lz4-dtb ~/pacrom/device/google/marlin-kernel


