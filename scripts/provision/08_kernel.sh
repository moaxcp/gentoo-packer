#!/bin/bash
emerge sys-kernel/gentoo-sources
emerge sys-kernel/genkernel

cd /usr/src/linux
mv /tmp/kernel.config .config

genkernel --install --symlink --makeopts="-j5 -l4" all
emerge -c sys-kernel/genkernel
