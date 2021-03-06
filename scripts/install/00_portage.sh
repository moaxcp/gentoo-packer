#!/bin/bash
set -e
echo "emerge-webrsync"
emerge-webrsync
echo "starting sync"
emerge --sync --quiet
echo "updating make.conf"
echo "MAKEOPTS=\"-j5 -l4\"" >> /etc/portage/make.conf
echo "EMERGE_DEFAULT_OPTS=\"--jobs=4 --load-average=4\"" >> /etc/portage/make.conf
echo "installing portage"
emerge --verbose --oneshot portage
