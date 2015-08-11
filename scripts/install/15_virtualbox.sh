#!/bin/bash
set -e
env-update
source /etc/profile
export PS1="(chroot) $PS1"

emerge "app-emulation/virtualbox-guest-additions"

rc-update add virtualbox-guest-additions default
