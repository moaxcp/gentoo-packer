#!/bin/bash
set -e
source /etc/profile
export PS1="(chroot) $PS1"
39 for script in install/*.sh
40 do
41   echo "running $script"
42   $script
43 done
44
