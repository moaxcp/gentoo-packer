#!/bin/bash
chroot /mnt/gentoo /bin/bash <<'EOF'
echo "emerging gcc"
echo "sys-devel/gcc ~amd64" >> /etc/portage/package.accept_keywords

emerge -v sys-devel/gcc

EOF
