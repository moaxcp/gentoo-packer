#!/bin/bash
echo "copying kernel.config to /mnt/gentoo/tmp"
cp $SCRIPTS/files/kernel.config /mnt/gentoo/tmp/

chroot /mnt/gentoo /bin/bash <<'EOF'
emerge sys-kernel/gentoo-sources
emerge sys-kernel/genkernel
cd /usr/src/linux
mv /tmp/kernel.config .config
genkernel --install --symlink --oldconfig --makeopts="-j5 -l4" all
emerge -c sys-kernel/genkernel
EOF
