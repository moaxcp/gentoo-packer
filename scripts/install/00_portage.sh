#!/bin/bash
set -e
echo "emerge-webrsync"
emerge-webrsync
echo "starting sync"
emerge --sync --quiet
echo "updating make.conf"
echo "MAKEOPTS=\"-j9 -l8\"" >> /etc/portage/make.conf
echo "EMERGE_DEFAULT_OPTS=\"--jobs=8 --load-average=8\"" >> /etc/portage/make.conf
echo "installing portage"
emerge --verbose --oneshot portage
