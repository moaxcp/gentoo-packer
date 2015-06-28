#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
mkdir /usr/portage
emerge-webrsync
echo "MAKEOPTS=\"-j5 -l4\"" >> /etc/portage/make.conf
echo "EMERGE_DEFAULT_OPTS=\"--jobs=4 --load-average=4\"" >> /etc/portage/make.conf
EOF
