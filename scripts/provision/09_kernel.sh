#!/bin/bash
set -e
emerge sys-kernel/gentoo-sources
emerge sys-kernel/genkernel

pushd /usr/src/linux
mv /tmp/kernel.config .config
make olddefconfig
popd

genkernel --install --symlink --makeopts="-j5 -l4" all
