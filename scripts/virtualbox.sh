#!/bin/bash
set -e
chroot /mnt/gentoo /bin/bash <<'EOF'
emerge "app-emulation/virtualbox-guest-additions"

rc-update add virtualbox-guest-additions default
EOF
