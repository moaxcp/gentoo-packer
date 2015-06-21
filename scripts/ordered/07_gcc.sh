#!/bin/bash
chroot /mnt/gentoo /bin/bash <<'EOF'
echo "emerging gcc"
echo "sys-devel/gcc ~amd64" >> /etc/portage/package.accept_keywords

emerge -v sys-devel/gcc
gcc-config -l
gcc-config 2
env-update && source /etc/profile
emerge --oneshot libtool
EOF
