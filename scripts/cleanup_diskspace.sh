#from http://vstone.eu/reducing-vagrant-box-size/
#with additions for gentoo

cat - << EOWARNING
WARNING: This script will fil up your left over disk space.
 
DO NOT RUN THIS WHEN YOUR VIRTUAL HD IS RAW!!!!!!
 
You should NOT do this on a running system.
This is purely for making vagrant boxes damn small.
 
Press Ctrl+C within the next 10 seconds if you want to abort!!
 
EOWARNING
sleep 10;

echo 'remove un-needed dependencie'
emerge --depclean

echo 'remove distfiles'
#eclean -d distfiles
# or
rm /usr/portage/distfiles/*

echo 'Cleanup bash history'
unset HISTFILE
[ -f /root/.bash_history ] && rm /root/.bash_history
[ -f /home/vagrant/.bash_history ] && rm /home/vagrant/.bash_history
 
echo 'Cleanup log files'
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
