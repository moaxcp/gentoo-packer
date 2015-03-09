#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
if [ -f /etc/portage/package.use ];then
  mv /etc/portage/package.use /etc/portage/package.use.migrate
  mkdir /etc/portage/package.use
  mkdir /etc/portage/package.keywords
  mv /etc/portage/package.use.migrate /etc/portage/package.use/migrate
else
  mkdir /etc/portage/package.use
  mkdir /etc/portage/package.keywords
fi
echo x11-libs/cairo X >> /etc/portage/package.use/cairo
echo cross-avr/gcc -sanitize > /etc/portage/package.use/avr-gcc-disable-sanitize
echo 'USE="-cups cjk"' >> /etc/portage/make.conf
echo 'dev-java/rxtx ~amd64' >> /etc/portage/package.keywords/cross-avr
emerge layman libXt arduino xauth

mkdir /usr/local/portage
echo 'PORTDIR_OVERLAY="/usr/local/portage"' >> /etc/portage/make.conf
crossdev -S -P -v -t avr

gpasswd -a vagrant tty
gpasswd -a vagrant uucp
echo X11Forwarding yes >> /etc/ssh/sshd_config
EOF
