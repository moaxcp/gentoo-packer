#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
emerge sys-power/acpid
rc-update add acpid default
EOF
