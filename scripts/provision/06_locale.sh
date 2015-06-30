#!/bin/bash
echo "generating locale"
#overwriting file first
echo "en_US ISO-8859-1" > /etc/locale.gen
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
eselect locale set 1
echo "set locale to 1"
eselect locale list
