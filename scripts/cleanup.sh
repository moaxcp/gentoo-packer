#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
cd /usr/src/linux && make clean
emerge -C sys-kernel/gentoo-sources
emerge --depclean

rm -rf /usr/portage
rm -rf /tmp/*
rm -rf /var/tmp/*

echo "removing bash history"
unset HISTFILE
[ -f /root/.bash_history ] && rm /root/.bash_history
[-f /home/vagrant/.bash_history ] && rm /home/vagrant/.bash_history

echo "removing log files"
find /var/log -type f | while read f; do echo -ne '' > $f; done;

echo 'Whiteout root'
count=`df --sync -kP / | tail -n1  | awk -F ' ' '{print $4}'`; 
let count--
dd if=/dev/zero of=/tmp/whitespace bs=1024 count=$count;
rm /tmp/whitespace;

echo 'Whiteout /boot'
count=`df --sync -kP /boot | tail -n1 | awk -F ' ' '{print $4}'`;
let count--
dd if=/dev/zero of=/boot/whitespace bs=1024 count=$count;
rm /boot/whitespace;

swappart=`cat /proc/swaps | tail -n1 | awk -F ' ' '{print $1}'`
swapoff $swappart;
dd if=/dev/zero of=$swappart;
mkswap $swappart;
swapon $swappart;
EOF

chroot /mnt/gentoo /bin/bash <<'EOF'
wget http://intgat.tigress.co.uk/rmy/uml/zerofree-1.0.3.tgz
tar xvzf zerofree-*.tgz
cd zerofree*/
make
EOF

mv /mnt/gentoo/zerofree* ./
cd zerofree*/

mount -o remount,ro /mnt/gentoo
./zerofree /dev/sda4

swapoff /dev/sda3
dd if=/dev/zero of=/dev/sda3
mkswap /dev/sda3
