#!/bin/bash
#set -e

env-update
source /etc/profile
export PS1="(chroot) $PS1"

cd /usr/src/linux && make clean
emerge --depclean


echo "removing bash history"
unset HISTFILE
[ -f /root/.bash_history ] && rm /root/.bash_history
[ -f /home/vagrant/.bash_history ] && rm /home/vagrant/.bash_history

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

echo 'Whiteout swap'
swappart=`cat /proc/swaps | tail -n1 | awk -F ' ' '{print $1}'`
echo "swappart is ${swappart}"

echo 'turning swap off'
swapoff $swappart;
echo 'writing zeros'
dd if=/dev/zero of=$swappart;
echo "mkswap ${swappart}"
mkswap $swappart;
echo "swapon ${swappart}"
swapon $swappart;
