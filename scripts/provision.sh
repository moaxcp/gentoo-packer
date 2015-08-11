#!/bin/bash
set -e
if [[ -z $STAGE3 ]]
then
  echo "STAGE3 environment variable must be set to a timestamp."
  exit 1
fi

echo "current directory"
pwd
ls -l

echo "scripts set to $SCRIPTS"

chmod -R +x *

echo "directory"
ls -l .

echo "files directory"
ls -l files

echo "prepare directory"
ls -l prepare

echo "running prepare scripts"
for script in prepare/*.sh
do
  echo "running $script"
  $script
done

cp -r install /mnt/gentoo/root
cp install.sh /mnt/gentoo/root

echo "root directory"
ls -l /mnt/gentoo/root

echo "install directory"
ls -l /mnt/gentoo/root/install

chroot /mnt/gentoo /root/install.sh

echo "provision.sh complete"
