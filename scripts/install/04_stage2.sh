#!/bin/bash
set -e
echo "progressing from stage 1 to stage 2"
/usr/portage/scripts/bootstrap.sh
echo "selecting gcc-config 1"
gcc-config 1
gcc-config -l
