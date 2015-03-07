#!/bin/bash

tarball=stage3-$SUBARCH-$STAGE3.tar.bz2

mount /dev/sda4 /mnt/gentoo

cd /mnt/gentoo
wget http://ftp.jaist.ac.jp/pub/Linux/Gentoo/releases/$ARCH/autobuilds/$STAGE3/$tarball
tar xvjpf $tarball
rm -f $tarball
