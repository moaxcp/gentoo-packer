#!/bin/bash
ln -snf /usr/share/zoneinfo/UTC /etc/localtime
echo UTC > /etc/timezone
emerge -v --config sys-libs/timezone-data

