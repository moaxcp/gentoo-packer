#!/bin/bash
set -e

env-update
source /etc/profile
export PS1="(chroot) $PS1"

for script in install/*.sh
do
  echo "running $script"
  $script
done

